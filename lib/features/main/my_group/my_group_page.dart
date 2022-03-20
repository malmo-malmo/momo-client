import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo_flutter/data/models/group/group_detail_response.dart';
import 'package:momo_flutter/features/main/main_bottom_navigation_bar.dart';
import 'package:momo_flutter/features/main/my_group/group_request_page.dart';
import 'package:momo_flutter/features/main/my_group/widgets/manage_group_list.dart';
import 'package:momo_flutter/features/main/my_group/widgets/participant_group_list.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:momo_flutter/utils/load_asset.dart';
import 'package:momo_flutter/widgets/indicator/loading_indicator.dart';
import 'package:momo_flutter/widgets/title/main_title.dart';
import 'package:momo_flutter/widgets/title/sub_title_row.dart';
import 'package:momo_flutter/features/main/my_group/provider/my_group_provider.dart';

class MyGroupPage extends StatelessWidget {
  const MyGroupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const MainBottomNavigationBar(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: InkWell(
              onTap: () {},
              child: loadAsset(
                AppIcons.notification,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: InkWell(
              onTap: () {},
              child: loadAsset(AppIcons.chat),
            ),
          ),
        ],
      ),
      floatingActionButton: Consumer(
        builder: (context, ref, child) {
          return FloatingActionButton(
            onPressed: () async {
              final result = await Navigator.pushNamed(
                context,
                GroupRequestPage.routeName,
              );
              if (result != null) {
                ref.read(myGroupStateProvider.notifier).createGroupCallback(result as GroupDetailResponse);
              }
            },
            child: loadAsset(AppIcons.addGroup),
          );
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 16, bottom: 32),
                child: MainTitle(AppStrings.myGroup),
              ),
              const SubTitleRow(
                title: AppStrings.directManageGroup,
                icon: AppIcons.myGroup,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 32),
                child: SizedBox(
                  height: 212,
                  child: Consumer(
                    builder: (context, ref, child) {
                      final myGroupState = ref.watch(myGroupStateProvider);
                      return myGroupState.isLoading
                          ? const LoadingIndicator()
                          : ManageGroupList(
                              myGroupState.myGroups,
                            );
                    },
                  ),
                ),
              ),
              const SubTitleRow(
                title: AppStrings.directManageGroup,
                icon: AppIcons.myGroup,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Consumer(
                  builder: (context, ref, child) {
                    final myGroupState = ref.watch(myGroupStateProvider);
                    return myGroupState.isLoading
                        ? const LoadingIndicator()
                        : ParticipantGroupList(
                            myGroupState.etcGroups,
                          );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
