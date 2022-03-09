import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo_flutter/features/intro/widgets/intro_sub_title.dart';
import 'package:momo_flutter/features/profile/intro_profile_page.dart';
import 'package:momo_flutter/features/profile/provider/category_provider.dart';
import 'package:momo_flutter/provider/user_provider.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:momo_flutter/widgets/button/bottom_button.dart';
import 'package:momo_flutter/features/profile/widgets/category_list_card.dart';
import 'package:momo_flutter/widgets/title/main_title.dart';

class IntroCategoryPage extends StatelessWidget {
  const IntroCategoryPage({Key? key}) : super(key: key);

  static const routeName = 'IntroCategoryPage';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.gray1,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 45),
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(
                    CupertinoIcons.back,
                    size: 24,
                    color: AppColors.gray6,
                  ),
                ),
                const SizedBox(height: 25),
                const MainTitle(AppStrings.introCategoryTitle),
                const SizedBox(height: 20),
                const IntroSubTitle(AppStrings.introCategorySubTitle),
                const SizedBox(height: 40),
                const CategoryListCard(),
                const SizedBox(height: 64),
                Padding(
                  padding: const EdgeInsets.only(bottom: 36),
                  child: Consumer(
                    builder: (context, ref, child) {
                      final categoryState = ref.watch(categoryStateProvider(null));
                      return BottomButton(
                        isEnable: ref.watch(categoryStateProvider(null).notifier).isValid(),
                        buttonTitle: AppStrings.next,
                        onPressed: () async {
                          await ref.read(userDataStateProvider.notifier).updateUserCategories(categoryState);
                          Navigator.pushNamed(context, IntroProfilePage.routeName);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
