import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo_flutter/app_config.dart';
import 'package:momo_flutter/features/main/search/provider/search_data_provider.dart';
import 'package:momo_flutter/features/main/search/provider/search_result_provider.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:momo_flutter/widgets/button/bottom_button.dart';
import 'package:momo_flutter/widgets/button/category_button.dart';
import 'package:momo_flutter/widgets/title/sub_title.dart';

class SearchFilterBottomSheet extends StatelessWidget {
  const SearchFilterBottomSheet({
    Key? key,
    required this.refresh,
  }) : super(key: key);

  final Function refresh;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 36, left: 16, right: 16),
        child: Consumer(
          builder: (context, ref, child) {
            final categoryChecks = ref.watch(searchCategoryStateProvider);
            final cityChecks = ref.watch(searchLocationStateProvider);
            final check = ref.watch(searchFilterCheckProvider);
            return BottomButton(
              buttonTitle: AppStrings.complete,
              isEnable: check,
              onPressed: () async {
                ref.read(categoryFilterStateProvider.notifier).checkFilter(categoryChecks);
                ref.read(locationFilterStateProvider.notifier).checkFilter(cityChecks);
                ref.read(searchResultListProvider.notifier).reset();
                ref.read(isSearchedProvider.state).state = true;
                Navigator.pop(context);
                refresh();
              },
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  InkWell(onTap: () => Navigator.pop(context), child: const Icon(CupertinoIcons.xmark, size: 20)),
                  const SizedBox(width: 14),
                  const Text('검색필터', style: AppStyles.bold16),
                ],
              ),
            ),
            const SizedBox(height: 14),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              color: AppColors.backgroundPurple,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const _SubTitle(AppStrings.area),
                  Consumer(
                    builder: (context, ref, child) {
                      final cityChecks = ref.watch(searchLocationStateProvider);
                      return Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: [
                          for (int i = 0; i < AppConfig.locationCodeNamePair.length; i++)
                            _LocationCard(
                              title: AppConfig.locationCodeNamePair[i].name,
                              check: cityChecks[i],
                              index: i,
                              toggle: ref.read(searchLocationStateProvider.notifier).toggle,
                            ),
                        ],
                      );
                    },
                  ),
                  const _SubTitle('활동 카테고리'),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: Consumer(
                      builder: (context, ref, child) {
                        final categoryChecks = ref.watch(searchCategoryStateProvider);
                        return Center(
                          child: Wrap(
                            spacing: 16,
                            runSpacing: 20,
                            children: [
                              for (int i = 0; i < AppConfig.categoryCodeNamePair.length; i++)
                                CategoryButton(
                                  check: categoryChecks[i],
                                  index: i,
                                  onTabIcon: ref.read(searchCategoryStateProvider.notifier).toggle,
                                  spaceHeight: 14,
                                ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 150),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LocationCard extends StatelessWidget {
  const _LocationCard({
    Key? key,
    required this.title,
    required this.check,
    required this.index,
    required this.toggle,
  }) : super(key: key);

  final String title;
  final bool check;
  final int index;
  final void Function(int index) toggle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => toggle(index),
      child: Container(
        height: 41,
        width: title.length * 7 + 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: check ? AppColors.purple : AppColors.gray0,
          boxShadow: const [BoxShadow()],
        ),
        child: Center(
          child: Text(
            title,
            style: AppStyles.bold16.copyWith(
              color: check ? AppColors.gray0 : null,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}

class _SubTitle extends StatelessWidget {
  const _SubTitle(
    this.title, {
    Key? key,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, bottom: 16),
      child: SubTitle(title),
    );
  }
}
