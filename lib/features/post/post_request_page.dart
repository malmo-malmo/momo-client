import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo_flutter/data/models/enum/post_type.dart';
import 'package:momo_flutter/features/gallery/gallery_page.dart';
import 'package:momo_flutter/features/gallery/provider/gallery_permission_provider.dart';
import 'package:momo_flutter/features/post/provider/post_request_provider.dart';
import 'package:momo_flutter/provider/loading_provider.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:momo_flutter/utils/load_asset.dart';
import 'package:momo_flutter/widgets/button/action_button.dart';
import 'package:momo_flutter/widgets/indicator/custom_loader.dart';
import 'package:momo_flutter/widgets/input_field/content_input_field.dart';
import 'package:momo_flutter/widgets/input_field/title_input_field.dart';

class PostRequestArg {
  final int groupId;
  final PostType postType;

  PostRequestArg({
    required this.groupId,
    required this.postType,
  });
}

class PostRequestPage extends StatelessWidget {
  const PostRequestPage(this.arg, {Key? key}) : super(key: key);

  static const routeName = 'PostRequestPage';

  final PostRequestArg arg;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Scaffold(
              appBar: AppBar(
                leading: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(CupertinoIcons.xmark),
                ),
                title: Text(
                  arg.postType == PostType.NORMAL ? AppStrings.createPost : AppStrings.createNotice,
                ),
                actions: [
                  Consumer(
                    builder: (context, ref, child) {
                      final isValid = ref.watch(postRequestCheckProvider(arg));
                      return ActionButton(
                        isEnable: isValid,
                        buttonTitle: AppStrings.confirm,
                        onPressed: () async {
                          ref.read(loadingProvider.state).state = true;
                          final result = await ref.read(postRequestStateProvider(arg).notifier).createPost();
                          ref.read(loadingProvider.state).state = false;
                          Navigator.pop(context, result);
                        },
                      );
                    },
                  ),
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.only(right: 16, left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: CustomScrollView(
                        slivers: [
                          const SliverToBoxAdapter(child: SizedBox(height: 24)),
                          SliverToBoxAdapter(
                            child: Consumer(
                              builder: (context, ref, child) {
                                return TitleInputField(
                                  onTextChanged: ref.read(postRequestStateProvider(arg).notifier).setTitle,
                                  hintText: AppStrings.title,
                                );
                              },
                            ),
                          ),
                          const SliverToBoxAdapter(child: SizedBox(height: 14)),
                          SliverToBoxAdapter(
                            child: Consumer(
                              builder: (context, ref, child) {
                                return ContentInputField(
                                  onTextChanged: ref.read(postRequestStateProvider(arg).notifier).setContents,
                                  maxLines: 24,
                                  height: 400,
                                  hintText: AppStrings.contentHint,
                                );
                              },
                            ),
                          ),
                          const SliverToBoxAdapter(child: SizedBox(height: 24)),
                          Consumer(
                            builder: (context, ref, child) {
                              final images = ref.watch(postRequestStateProvider(arg)).images;
                              return SliverToBoxAdapter(
                                child: images.isEmpty
                                    ? const SizedBox()
                                    : Wrap(
                                        spacing: 8,
                                        runSpacing: 8,
                                        children: List.generate(
                                          images.length,
                                          (index) => _ImageCard(
                                            image: images[index],
                                            deleteImg: ref.read(postRequestStateProvider(arg).notifier).deleteImg,
                                          ),
                                        ),
                                      ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    Consumer(
                      builder: (context, ref, child) {
                        return _FloatingCameraBotton(
                          addImages: ref.read(postRequestStateProvider(arg).notifier).setImages,
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
    );
  }
}

class _FloatingCameraBotton extends StatelessWidget {
  const _FloatingCameraBotton({
    Key? key,
    required this.addImages,
  }) : super(key: key);

  final Function(List<String> images) addImages;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: false,
      child: Container(
        color: const Color(0xffffffff),
        height: 56,
        child: Consumer(
          builder: (context, ref, child) {
            return InkWell(
              onTap: () async {
                FocusScope.of(context).unfocus();
                final check = await ref.read(galleryPermissionProvider.future);
                if (check) {
                  final images = await Navigator.pushNamed(
                    context,
                    GalleryPage.routeName,
                    arguments: PhotoRequestType.many,
                  );
                  if (images != null) {
                    addImages(images as List<String>);
                  }
                }
              },
              child: loadAsset(AppIcons.camera),
            );
          },
        ),
      ),
    );
  }
}

class _ImageCard extends StatelessWidget {
  const _ImageCard({
    Key? key,
    required this.image,
    required this.deleteImg,
  }) : super(key: key);

  final String image;
  final void Function(String img) deleteImg;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 100,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: SizedBox(
              height: 100,
              width: 100,
              child: Image.file(
                File(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: InkWell(
                onTap: () => deleteImg(image),
                child: const Icon(
                  CupertinoIcons.xmark,
                  color: AppColors.gray0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
