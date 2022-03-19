import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo_flutter/features/intro/widgets/intro_sub_title.dart';
import 'package:momo_flutter/features/profile/intro_profile_page.dart';
import 'package:momo_flutter/features/profile/provider/category_provider.dart';
import 'package:momo_flutter/provider/loading_provider.dart';
import 'package:momo_flutter/provider/user_provider.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:momo_flutter/widgets/button/bottom_button.dart';
import 'package:momo_flutter/features/profile/widgets/category_list_card.dart';
import 'package:momo_flutter/widgets/indicator/custom_loader.dart';
import 'package:momo_flutter/widgets/title/main_title.dart';

class IntroCategoryPage extends StatelessWidget {
  const IntroCategoryPage({Key? key}) : super(key: key);

  static const routeName = 'IntroCategoryPage';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: AppColors.gray1,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height >= 800 ? MediaQuery.of(context).size.height : 800,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 24),
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(
                          CupertinoIcons.back,
                          size: 24,
                          color: AppColors.gray6,
                        ),
                      ),
                      const SizedBox(height: 24),
                      const MainTitle(AppStrings.introCategoryTitle),
                      const SizedBox(height: 20),
                      const IntroSubTitle(AppStrings.introCategorySubTitle),
                      const SizedBox(height: 40),
                      const CategoryListCard(),
                      const SizedBox(height: 64),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Consumer(
                          builder: (context, ref, child) {
                            final categoryState = ref.watch(categoryStateProvider(null));
                            final isValid = ref.watch(categoryCheckProvider(null));
                            return BottomButton(
                              isEnable: isValid,
                              buttonTitle: AppStrings.next,
                              onPressed: () async {
                                ref.read(loadingProvider.state).state = true;
                                await ref.read(userDataStateProvider.notifier).updateUserCategories(categoryState);
                                ref.read(loadingProvider.state).state = false;
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
          ),
          ...customLoader,
        ],
      ),
    );
  }
}
