import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo_flutter/features/schedule/provider/group_summary_provider.dart';
import 'package:momo_flutter/features/schedule/provider/schedule_request_provider.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:momo_flutter/utils/calculate_offset.dart';
import 'package:momo_flutter/widgets/input_field/custom_drop_down_list.dart';
import 'package:momo_flutter/widgets/title/sub_title.dart';

final _groupNameInputFieldKey = GlobalKey();

class GroupNameInputField extends StatelessWidget {
  const GroupNameInputField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 40, bottom: 14),
          child: SubTitle(AppStrings.choiceGroup),
        ),
        Container(
          key: _groupNameInputFieldKey,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: AppColors.gray1,
          ),
          height: 44,
          width: double.infinity,
          child: Consumer(
            builder: (context, ref, child) {
              final response = ref.watch(groupSummaryProvider);
              final groupId = ref.watch(scheduleRequestStateProvider(null)).groupId;

              return response.when(
                loading: () => const SizedBox(),
                error: (error, stacktrace) => const SizedBox(),
                data: (groups) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        groupId == -1 ? AppStrings.choiceGroupHint : groups.where((e) => e.id == groupId).first.name,
                        style: AppStyles.regular16.copyWith(
                          color: groupId == -1 ? AppColors.gray4 : null,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              opaque: false,
                              pageBuilder: (context, animation, secondaryAnimation) => CustomDropDownList(
                                values: groups.map((e) => e.name).toList(),
                                setValue: (name) {
                                  ref
                                      .read(scheduleRequestStateProvider(null).notifier)
                                      .setGroupId(groups.where((element) => element.name == name).first.id);
                                },
                                curValue:
                                    groupId == -1 ? '' : groups.where((element) => element.id == groupId).first.name,
                                offset: calculateOffset(_groupNameInputFieldKey),
                                defaultValue: groups.first.name,
                                width: MediaQuery.of(context).size.width - 32,
                                backgroundColor: AppColors.gray1,
                              ),
                              transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(
                                opacity: animation,
                                child: child,
                              ),
                            ),
                          );
                        },
                        child: Transform.rotate(
                          angle: pi * 3 / 2,
                          child: const Icon(
                            CupertinoIcons.back,
                            size: 20,
                          ),
                        ),
                      )
                    ],
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
