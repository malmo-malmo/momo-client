import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo_flutter/features/main/main_page.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:momo_flutter/utils/load_asset.dart';

class MainBottomNavigationBar extends StatelessWidget {
  const MainBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      height: 64,
      decoration: const BoxDecoration(
        color: AppColors.gray0,
        boxShadow: [BoxShadow()],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          _BottomTab(
            tabTitle: AppStrings.home,
            onImage: AppIcons.tabHomeOn,
            offImage: AppIcons.tabHomeOff,
            curIndex: 0,
          ),
          _BottomTab(
            tabTitle: AppStrings.search,
            onImage: AppIcons.tabSearchOn,
            offImage: AppIcons.tabSearchOff,
            curIndex: 1,
          ),
          _BottomTab(
            tabTitle: AppStrings.calendar,
            onImage: AppIcons.tabCalendarOn,
            offImage: AppIcons.tabCalendarOff,
            curIndex: 2,
          ),
          _BottomTab(
            tabTitle: AppStrings.myGroup,
            onImage: AppIcons.tabMyGroupOn,
            offImage: AppIcons.tabMyGroupOff,
            curIndex: 3,
          ),
          _BottomTab(
            tabTitle: AppStrings.myPage,
            onImage: AppIcons.tabMyPageOn,
            offImage: AppIcons.tabMyPageOff,
            curIndex: 4,
          ),
        ],
      ),
    );
  }
}

class _BottomTab extends StatelessWidget {
  const _BottomTab({
    Key? key,
    required this.tabTitle,
    required this.onImage,
    required this.offImage,
    required this.curIndex,
  }) : super(key: key);

  final String tabTitle;
  final String onImage;
  final String offImage;
  final int curIndex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Consumer(builder: (context, ref, child) {
        final _tabIndex = ref.watch(bottomTabIndexProvider);
        return InkWell(
          onTap: () => ref.read(bottomTabIndexProvider.state).state = curIndex,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              loadAsset(
                curIndex == _tabIndex ? onImage : offImage,
              ),
              Text(
                tabTitle,
                style: AppStyles.regular11,
              ),
            ],
          ),
        );
      }),
    );
  }
}
