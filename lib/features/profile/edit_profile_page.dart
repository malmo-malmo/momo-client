import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo_flutter/app_consts.dart';
import 'package:momo_flutter/data/models/user/user_update_request.dart';
import 'package:momo_flutter/features/gallery/gallery_page.dart';
import 'package:momo_flutter/features/profile/provider/profile_update_provider.dart';
import 'package:momo_flutter/features/profile/widgets/nickname_input_field.dart';
import 'package:momo_flutter/features/profile/widgets/university_input_field.dart';
import 'package:momo_flutter/provider/loading_provider.dart';
import 'package:momo_flutter/provider/user_provider.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:momo_flutter/utils/load_asset.dart';
import 'package:momo_flutter/widgets/button/action_button.dart';
import 'package:momo_flutter/widgets/card/profile_image_card.dart';
import 'package:momo_flutter/widgets/indicator/custom_loader.dart';
import 'package:momo_flutter/widgets/input_field/city_input_field.dart';
import 'package:momo_flutter/widgets/input_field/district_input_field.dart';
import 'package:momo_flutter/widgets/title/sub_title.dart';

class EditProfilePage extends ConsumerStatefulWidget {
  const EditProfilePage(
    this.userUpdateRequest, {
    Key? key,
  }) : super(key: key);

  final UserUpdateRequest userUpdateRequest;

  static const routeName = 'EditProfilePage';

  @override
  ConsumerState<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends ConsumerState<EditProfilePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => ref.read(profileUpdateStateProvider.notifier).initRequest(widget.userUpdateRequest),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: AppColors.backgroundWhite,
            appBar: AppBar(
              leading: InkWell(
                onTap: () => Navigator.pop(context),
                child: const Icon(CupertinoIcons.back),
              ),
              title: const Text(AppStrings.managementProfile),
              actions: [
                Consumer(
                  builder: (context, ref, child) {
                    final isValid = ref.watch(profileUpdateCheckProvider);
                    final validateNickname = ref.watch(vaildatioinNicknameProvider);
                    final updateRequest = ref.watch(profileUpdateStateProvider);
                    return ActionButton(
                      buttonTitle: AppStrings.complete,
                      onPressed: () async {
                        ref.read(loadingProvider.state).state = true;
                        await ref.read(userDataStateProvider.notifier).updateUserData(
                              UserUpdateRequest(
                                city: updateRequest.city,
                                district: updateRequest.district,
                                nickname: validateNickname
                                    ? updateRequest.nickname
                                    : widget.userUpdateRequest.nickname,
                                university: updateRequest.university,
                              ),
                            );
                        ref.read(loadingProvider.state).state = false;
                        Navigator.pop(context);
                      },
                      isEnable: isValid,
                    );
                  },
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                child: Container(
                  constraints: const BoxConstraints(minHeight: 800),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 60),
                      Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          height: 102,
                          width: 102,
                          child: Consumer(
                            builder: (context, ref, child) {
                              final imagePath = ref.watch(userDataStateProvider).image;
                              return Stack(
                                children: [
                                  ProfileImageCard(
                                    img: imagePath ?? AppConsts.defalutProfile,
                                    rad: 50,
                                    backgroundColor: AppColors.purple,
                                  ),
                                  Positioned(
                                    right: 0,
                                    bottom: 0,
                                    child: InkWell(
                                      onTap: () async {
                                        final result = await Navigator.pushNamed(
                                          context,
                                          GalleryPage.routeName,
                                          arguments: PhotoRequestType.one,
                                        );
                                        if (result != null) {
                                          ref.read(loadingProvider.state).state = true;
                                          ref
                                              .read(userDataStateProvider.notifier)
                                              .updateProfileImage(result as String);
                                          ref.read(loadingProvider.state).state = false;
                                        }
                                      },
                                      child: CircleAvatar(
                                        radius: 17,
                                        backgroundColor: AppColors.purple,
                                        child: Center(
                                          child: loadAsset(AppIcons.squareCamera),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      const Padding(
                        padding: EdgeInsets.only(top: 30, bottom: 14),
                        child: SubTitle(AppStrings.nickname),
                      ),
                      NicknameInputField(
                        initialValue: widget.userUpdateRequest.nickname,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 30, bottom: 14),
                        child: SubTitle(AppStrings.university),
                      ),
                      UniversityInputField(
                        initialValue: widget.userUpdateRequest.university,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 30, bottom: 14),
                        child: SubTitle(AppStrings.area),
                      ),
                      Consumer(
                        builder: (context, ref, child) {
                          final updateProfileData = ref.watch(profileUpdateStateProvider);
                          return Row(
                            children: [
                              CityInputField(
                                city: ref.watch(profileUpdateStateProvider.notifier).userCity,
                                setCity: ref.read(profileUpdateStateProvider.notifier).setUserCity,
                              ),
                              const SizedBox(width: 24),
                              DistrictInputField(
                                district: updateProfileData.district,
                                cityCode: updateProfileData.city,
                                setDistrict:
                                    ref.read(profileUpdateStateProvider.notifier).setUserDistrict,
                              ),
                            ],
                          );
                        },
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
