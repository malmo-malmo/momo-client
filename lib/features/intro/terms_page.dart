import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo_flutter/features/intro/intro_category_page.dart';
import 'package:momo_flutter/features/intro/providers/terms_check_provider.dart';
import 'package:momo_flutter/features/intro/widgets/intro_sub_title.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:momo_flutter/widgets/button/bottom_button.dart';
import 'package:momo_flutter/widgets/text/main_title.dart';

class TermsPage extends StatelessWidget {
  const TermsPage({Key? key}) : super(key: key);

  static const routeName = 'TermsPage';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.gray1,
        body: Padding(
          padding: const EdgeInsets.only(top: 94, bottom: 36, right: 20, left: 20),
          child: Consumer(
            builder: (context, ref, child) {
              final termsState = ref.watch(termsCheckStateProvider);
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const MainTitle(AppStrings.termsTitle),
                  const SizedBox(height: 20),
                  const IntroSubTitle(AppStrings.termsSubTitle),
                  const SizedBox(height: 44),
                  _TermsAllCheckBox(
                    check: termsState.first,
                    onCheck: () => ref.read(termsCheckStateProvider.notifier).checkAll(!termsState.first),
                  ),
                  const SizedBox(height: 32),
                  _TermsRow(
                    isCheck: termsState[1],
                    onCheck: () => ref.read(termsCheckStateProvider.notifier).checkTerm(1),
                    title: AppStrings.privacyPolicy,
                  ),
                  const SizedBox(height: 14),
                  _TermsRow(
                    isCheck: termsState[2],
                    onCheck: () => ref.read(termsCheckStateProvider.notifier).checkTerm(2),
                    title: AppStrings.thirdPartyPolicy,
                  ),
                  const SizedBox(height: 14),
                  _TermsRow(
                    isCheck: termsState[3],
                    onCheck: () => ref.read(termsCheckStateProvider.notifier).checkTerm(3),
                    title: AppStrings.marketingPolicy,
                  ),
                  const Spacer(),
                  BottomButton(
                    buttonTitle: AppStrings.next,
                    isEnable: ref.watch(termsCheckStateProvider.notifier).isEnable(),
                    onPressed: () => Navigator.pushNamed(context, IntroCategoryPage.routeName),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _TermsRow extends StatelessWidget {
  const _TermsRow({
    Key? key,
    required this.title,
    required this.isCheck,
    required this.onCheck,
  }) : super(key: key);

  final String title;
  final bool isCheck;
  final Function onCheck;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(24),
                onTap: () {
                  onCheck();
                },
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: isCheck ? AppColors.lightPurple : AppColors.gray3,
                  child: const Icon(
                    Icons.check,
                    size: 20,
                    color: AppColors.gray0,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                title,
                style: AppStyles.regular14,
              ),
            ],
          ),
          Text(
            '보기',
            style: AppStyles.regular12.copyWith(
              decoration: TextDecoration.underline,
              color: AppColors.gray6,
            ),
          )
        ],
      ),
    );
  }
}

class _TermsAllCheckBox extends StatelessWidget {
  const _TermsAllCheckBox({
    Key? key,
    required this.check,
    required this.onCheck,
  }) : super(key: key);

  final bool check;
  final Function onCheck;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 56,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.gray0,
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              onCheck();
            },
            child: CircleAvatar(
              radius: 15,
              backgroundColor: check ? AppColors.purple : AppColors.gray4,
              child: const Icon(
                Icons.check,
                size: 20,
                color: AppColors.gray0,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Text(
            '전체 동의',
            style: AppStyles.bold16.copyWith(
              color: check ? AppColors.purple : AppColors.gray4,
            ),
          ),
        ],
      ),
    );
  }
}
