import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo_flutter/features/main/my_group/provider/group_category_provider.dart';
import 'package:momo_flutter/features/main/my_group/provider/group_request_provider.dart';
import 'package:momo_flutter/features/main/my_group/widgets/recruit_number_input_box.dart';
import 'package:momo_flutter/features/main/my_group/widgets/request_image_box.dart';
import 'package:momo_flutter/features/main/my_group/widgets/university_toggle_button.dart';
import 'package:momo_flutter/provider/loading_provider.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:momo_flutter/widgets/button/action_button.dart';
import 'package:momo_flutter/widgets/button/category_button.dart';
import 'package:momo_flutter/widgets/button/on_off_toggle_button.dart';
import 'package:momo_flutter/widgets/dialog/confirm_dialog.dart';
import 'package:momo_flutter/widgets/indicator/custom_loader.dart';
import 'package:momo_flutter/widgets/input_field/city_input_field.dart';
import 'package:momo_flutter/widgets/input_field/content_input_field.dart';
import 'package:momo_flutter/widgets/input_field/date_input_field.dart';
import 'package:momo_flutter/widgets/input_field/district_input_field.dart';
import 'package:momo_flutter/widgets/input_field/title_input_field.dart';
import 'package:momo_flutter/widgets/title/sub_title.dart';

class GroupRequestPage extends StatelessWidget {
  const GroupRequestPage({Key? key}) : super(key: key);

  static const routeName = 'GroupRequestPage';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: [
            Scaffold(
              appBar: AppBar(
                leading: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(CupertinoIcons.xmark),
                ),
                title: const Text(AppStrings.makeGroup),
                actions: [
                  Consumer(
                    builder: (context, ref, child) {
                      final isValid = ref.watch(groupRequestCheckProvider);
                      return ActionButton(
                        buttonTitle: AppStrings.complete,
                        onPressed: () async {
                          ref.read(loadingProvider.state).state = true;
                          final result = await ref.read(groupRequestStateProvider.notifier).createGroup();
                          ref.read(loadingProvider.state).state = false;
                          await showDialog(
                            context: context,
                            builder: (context) => ConfirmDialog("${result.name}'\n모임을 추가했어요!"),
                          );
                          Navigator.pop(context, result);
                        },
                        isEnable: isValid,
                      );
                    },
                  ),
                ],
              ),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    const RequestImageBox(),
                    const _SubTitle(AppStrings.groupName),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Consumer(
                        builder: (context, ref, child) {
                          return TitleInputField(
                            onTextChanged: ref.read(groupRequestStateProvider.notifier).setGroupName,
                            hintText: AppStrings.groupName,
                          );
                        },
                      ),
                    ),
                    const _SubTitle(AppStrings.acticeCatetory),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Consumer(
                        builder: (context, ref, child) {
                          final checks = ref.watch(groupRequestCategoryStateProvider);
                          return Center(
                            child: Wrap(
                              spacing: 16,
                              runSpacing: 20,
                              children: [
                                for (int i = 0; i < checks.length; i++)
                                  CategoryButton(
                                    check: checks[i],
                                    index: i,
                                    onTabIcon: (index) {
                                      ref.read(groupRequestCategoryStateProvider.notifier).checkCategory(index);
                                      ref.read(groupRequestStateProvider.notifier).setGroupCategory(index);
                                    },
                                  )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    const _SubTitle(AppStrings.groupType),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Consumer(
                        builder: (context, ref, child) {
                          return OnOffToggleButton(
                            tabButton: ref.read(groupRequestStateProvider.notifier).setOnOff,
                          );
                        },
                      ),
                    ),
                    const _SubTitle(AppStrings.groupStartDay),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Consumer(
                        builder: (context, ref, child) {
                          return DateInputField(
                            setDate: ref.read(groupRequestStateProvider.notifier).setStartDate,
                          );
                        },
                      ),
                    ),
                    const _SubTitle(AppStrings.recruitNumber),
                    const RecruitNumberInputBox(),
                    const _SubTitle(AppStrings.myUniversity),
                    const UniversityToggleButton(),
                    const _SubTitle(AppStrings.groupLocation),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Consumer(
                        builder: (context, ref, child) {
                          final groupRequestData = ref.watch(groupRequestStateProvider);
                          return Row(
                            children: [
                              CityInputField(
                                city: ref.watch(groupRequestStateProvider.notifier).groupCity,
                                setCity: ref.read(groupRequestStateProvider.notifier).setCity,
                              ),
                              const SizedBox(width: 24),
                              DistrictInputField(
                                district: groupRequestData.district,
                                cityCode: groupRequestData.city,
                                setDistrict: ref.read(groupRequestStateProvider.notifier).setDistrict,
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    const _SubTitle(AppStrings.memo),
                    Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 40),
                      child: Consumer(
                        builder: (context, ref, child) {
                          return ContentInputField(
                            onTextChanged: ref.read(groupRequestStateProvider.notifier).setIntroduction,
                            hintText: AppStrings.groupHintText,
                            height: 82,
                            maxLines: 2,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ...customLoader,
          ],
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
      padding: const EdgeInsets.only(top: 40, bottom: 16, left: 16),
      child: SubTitle(title),
    );
  }
}
