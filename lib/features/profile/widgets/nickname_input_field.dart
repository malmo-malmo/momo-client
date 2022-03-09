import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo_flutter/features/profile/provider/profile_update_provider.dart';
import 'package:momo_flutter/provider/user_provider.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:momo_flutter/widgets/dialog/confirm_dialog.dart';

class NicknameInputField extends StatelessWidget {
  const NicknameInputField({
    Key? key,
    this.color,
  }) : super(key: key);

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: AppStyles.containerDecoration(color: color),
      height: 44,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 180,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Consumer(
                builder: (context, ref, child) {
                  return TextFormField(
                    onChanged: (value) {
                      ref.read(profileUpdateStateProvider.notifier).setUserNickname(value);
                      ref.read(vaildatioinNicknameProvider.state).state = false;
                    },
                    decoration: const InputDecoration(
                      hintText: AppStrings.nicknameHint,
                    ),
                    maxLength: 10,
                  );
                },
              ),
            ),
          ),
          SizedBox(
            width: 62,
            height: 32,
            child: Consumer(
              builder: (context, ref, child) {
                final nickname = ref.watch(profileUpdateStateProvider).nickname;
                return ElevatedButton(
                  onPressed: nickname.isNotEmpty
                      ? () async {
                          final response = await ref.read(userDataStateProvider.notifier).validateNickname(nickname);
                          ref.read(vaildatioinNicknameProvider.state).state = true;
                          showDialog(
                            context: context,
                            builder: (context) => ConfirmDialog(
                              response ? AppStrings.availableNickname : AppStrings.notAvailableNickname,
                            ),
                          );
                        }
                      : null,
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                    textStyle: MaterialStateProperty.all(AppStyles.regular10),
                  ),
                  child: const Text(AppStrings.confirmDuplicate),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
