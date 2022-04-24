import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo_flutter/features/main/my_group/provider/group_request_provider.dart';
import 'package:momo_flutter/provider/user_provider.dart';
import 'package:momo_flutter/resources/resources.dart';

class UniversityToggleButton extends ConsumerWidget {
  const UniversityToggleButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final check = ref.watch(groupRequestStateProvider).university != null;
    final university = ref.watch(userDataStateProvider).university;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(22),
            onTap: () => ref.read(groupRequestStateProvider.notifier).setUniversity(university),
            child: Container(
              height: 44,
              width: 91,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                color: check ? AppColors.purple : AppColors.gray1,
              ),
              child: Center(
                child: Text(
                  AppStrings.include,
                  style: AppStyles.regular16.copyWith(
                    color: check ? AppColors.gray0 : AppColors.gray4,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          InkWell(
            borderRadius: BorderRadius.circular(22),
            onTap: () => ref.read(groupRequestStateProvider.notifier).setUniversity(null),
            child: Container(
              height: 44,
              width: 106,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                color: !check ? AppColors.purple : AppColors.gray1,
              ),
              child: Center(
                child: Text(
                  AppStrings.notInclude,
                  style: AppStyles.regular16.copyWith(
                    color: !check ? AppColors.gray0 : AppColors.gray4,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
