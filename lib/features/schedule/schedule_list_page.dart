import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:momo_flutter/features/schedule/widgets/schedule_list_view.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:momo_flutter/widgets/button/header_chat_button.dart';

class ScheduleListPage extends StatelessWidget {
  const ScheduleListPage(this.groupId, {Key? key}) : super(key: key);

  static const routeName = 'ScheduleListPage';

  final int groupId;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.gray1,
        appBar: AppBar(
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(CupertinoIcons.back),
          ),
          actions: const [HeaderChatButton()],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: SizedBox(height: 24),
              ),
              ScheduleListView(groupId),
            ],
          ),
        ),
      ),
    );
  }
}
