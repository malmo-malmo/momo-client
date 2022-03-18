import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo_flutter/features/schedule/provider/schedule_request_provider.dart';
import 'package:momo_flutter/features/schedule/widgets/group_name_input_field.dart';
import 'package:momo_flutter/features/schedule/widgets/time_input_field.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:momo_flutter/widgets/button/action_button.dart';
import 'package:momo_flutter/widgets/button/on_off_toggle_button.dart';
import 'package:momo_flutter/widgets/input_field/content_input_field.dart';
import 'package:momo_flutter/widgets/input_field/date_input_field.dart';
import 'package:momo_flutter/widgets/input_field/title_input_field.dart';
import 'package:momo_flutter/widgets/title/sub_title.dart';

class ScheduleRequestPage extends StatelessWidget {
  const ScheduleRequestPage(this.groupId, {Key? key}) : super(key: key);

  static const routeName = 'ScheduleRequestPage';

  final int? groupId;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: AppBar(
            leading: InkWell(
              onTap: () => Navigator.pop(context),
              child: const Icon(CupertinoIcons.xmark),
            ),
            title: const Text(AppStrings.addSchedule),
            actions: [
              Consumer(
                builder: (context, ref, child) {
                  final isValid = ref.watch(scheduleRequestCheckProvider(groupId));
                  return ActionButton(
                    isEnable: isValid,
                    buttonTitle: AppStrings.complete,
                    onPressed: () async {
                      final result = await ref.read(scheduleRequestStateProvider(groupId).notifier).createSchedule();
                      Navigator.pop(context, result);
                    },
                  );
                },
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      groupId == null ? const GroupNameInputField() : const SizedBox(),
                      const _SubTitle(AppStrings.scheduleName),
                      Consumer(
                        builder: (context, ref, child) {
                          return TitleInputField(
                            onTextChanged: ref.read(scheduleRequestStateProvider(groupId).notifier).setTitle,
                            hintText: AppStrings.title,
                          );
                        },
                      ),
                      const _SubTitle(AppStrings.groupType),
                      Consumer(
                        builder: (context, ref, child) {
                          return OnOffToggleButton(
                            tabButton: ref.read(scheduleRequestStateProvider(groupId).notifier).setOnOff,
                          );
                        },
                      ),
                      const _SubTitle(AppStrings.dateAndTime),
                      Consumer(
                        builder: (context, ref, child) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              DateInputField(
                                setDate: ref.read(scheduleRequestStateProvider(groupId).notifier).setDate,
                              ),
                              TimeInputField(
                                selectTime: ref.read(scheduleRequestStateProvider(groupId).notifier).setTime,
                              ),
                            ],
                          );
                        },
                      ),
                      const _SubTitle(AppStrings.memo),
                      Consumer(
                        builder: (context, ref, child) {
                          return ContentInputField(
                            onTextChanged: ref.read(scheduleRequestStateProvider(groupId).notifier).setContents,
                            maxLines: 2,
                            height: 82,
                            hintText: AppStrings.scheduleHintText,
                          );
                        },
                      ),
                      const SizedBox(height: 88),
                    ],
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

class _SubTitle extends StatelessWidget {
  const _SubTitle(this.title, {Key? key}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, bottom: 14),
      child: SubTitle(title),
    );
  }
}
