import 'package:flutter/material.dart';
import 'package:momo_flutter/features/main/main_bottom_navigation_bar.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:momo_flutter/utils/load_asset.dart';
import 'package:momo_flutter/widgets/title/main_title.dart';
import 'package:momo_flutter/widgets/title/sub_title_row.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const MainBottomNavigationBar(),
      appBar: AppBar(
        actions: [
          loadAsset(AppIcons.notification),
          loadAsset(AppIcons.chat),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 32),
              child: MainTitle(AppStrings.homeTitle),
            ),
            SubTitleRow(
              title: '${DateTime.now().month}' + AppStrings.momth + ' ' + AppStrings.reminder,
              icon: AppIcons.reminder,
            ),
          ],
        ),
      ),
    );
  }
}
