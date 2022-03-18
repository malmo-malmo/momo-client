import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo_flutter/data/models/user/participant_user_response.dart';
import 'package:momo_flutter/features/group/providers/participant_user_provider.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:momo_flutter/widgets/button/action_button.dart';
import 'package:momo_flutter/widgets/button/bottom_button.dart';
import 'package:momo_flutter/widgets/card/error_card.dart';
import 'package:momo_flutter/widgets/card/profile_image_card.dart';
import 'package:momo_flutter/widgets/indicator/loading_indicator.dart';

class GroupAuthorityPage extends ConsumerWidget {
  const GroupAuthorityPage(this.groupId, {Key? key}) : super(key: key);

  static const routeName = 'GroupAuthorityPage';

  final int groupId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userResponse = ref.watch(participantUserProvider(groupId));

    return SafeArea(
      child: userResponse.when(
        error: (error, stackTrace) => const ErrorCard(),
        loading: () => const LoadingIndicator(),
        data: (users) {
          final checks = ref.watch(participantCheckStateProvider(users.length));
          final checkIndex = ref.watch(isCheckUserProvider(users.length));

          return Scaffold(
            appBar: AppBar(
              leading: InkWell(
                onTap: () => Navigator.pop(context),
                child: const Icon(CupertinoIcons.xmark),
              ),
              actions: [
                ActionButton(
                  buttonTitle: AppStrings.confirm,
                  isEnable: checkIndex != -1,
                  onPressed: () async {
                    final check = await showDialog<bool?>(
                      context: context,
                      builder: (_) => _UserConfirmDialog(users[checkIndex]),
                    );
                    if (check != null) {
                      Navigator.pop(context, users[checkIndex].userId);
                    }
                  },
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30, right: 24, left: 24, bottom: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(AppStrings.nickname, style: AppStyles.bold16),
                          Text(AppStrings.choice, style: AppStyles.bold16),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      width: double.infinity,
                      height: 32 + 72.0 * users.length,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(0, 3),
                            blurRadius: 6,
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: ListView.builder(
                        itemCount: users.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => _UserCard(
                          check: checks[index],
                          index: index,
                          onTab: () => ref.read(participantCheckStateProvider(users.length).notifier).checkOne(index),
                          user: users[index],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _UserCard extends StatelessWidget {
  const _UserCard({
    Key? key,
    required this.index,
    required this.user,
    required this.check,
    required this.onTab,
  }) : super(key: key);

  final Function onTab;
  final bool check;
  final int index;
  final ParticipantUserResponse user;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      height: 72,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ProfileImageCard(
                img: user.imageUrl ?? 'https://img.insight.co.kr/static/2019/04/20/700/mev0r133kiy3hx0u4c48.jpg',
                rad: 18,
              ),
              const SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.nickname,
                    style: AppStyles.bold14,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    AppStrings.achievementRate + ' ${user.attendanceRate}%',
                    style: AppStyles.regular12.copyWith(
                      color: AppColors.gray5,
                    ),
                  )
                ],
              ),
            ],
          ),
          InkWell(
            onTap: () => onTab(),
            child: CircleAvatar(
              radius: 12,
              backgroundColor: check ? AppColors.purple : AppColors.gray2,
              child: check
                  ? const Icon(
                      Icons.check,
                      size: 16,
                      color: AppColors.gray0,
                    )
                  : const SizedBox(),
            ),
          ),
        ],
      ),
    );
  }
}

class _UserConfirmDialog extends StatelessWidget {
  const _UserConfirmDialog(this.user, {Key? key}) : super(key: key);

  final ParticipantUserResponse user;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        height: 273,
        width: 280,
        child: Padding(
          padding: const EdgeInsets.only(top: 42),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ProfileImageCard(
                  img: user.imageUrl ??
                      'https://www.nemopan.com/files/attach/images/6294/004/387/013/63dac7acb2889fd9d34b68a338f9af8c.jpg',
                  rad: 24),
              Text(user.nickname, style: AppStyles.regular14),
              Text(
                AppStrings.achievementRate + ' ${user.attendanceRate}%',
                style: AppStyles.regular12.copyWith(
                  color: AppColors.gray5,
                ),
              ),
              const Text(
                AppStrings.authorityConfirm,
                style: AppStyles.regular16,
                textAlign: TextAlign.center,
              ),
              BottomButton(
                isEnable: true,
                buttonTitle: AppStrings.confirm,
                onPressed: () => Navigator.pop(context, true),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
