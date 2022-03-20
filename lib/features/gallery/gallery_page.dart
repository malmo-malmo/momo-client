import 'dart:typed_data';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:momo_flutter/features/gallery/provider/photo_data_provider.dart';
import 'package:momo_flutter/features/gallery/provider/photo_provider.dart';
import 'package:momo_flutter/features/gallery/widgets/image_thumbnail.dart';
import 'package:momo_flutter/features/gallery/widgets/radio_image_thumbnail.dart';
import 'package:momo_flutter/resources/app_error_strings.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:momo_flutter/widgets/button/action_button.dart';
import 'package:momo_flutter/widgets/card/error_card.dart';
import 'package:momo_flutter/widgets/indicator/loading_indicator.dart';

enum PhotoRequestType { one, many }

class GalleryPage extends StatelessWidget {
  const GalleryPage(this.photoRequestType, {Key? key}) : super(key: key);

  static const routeName = 'GalleryPage';
  final PhotoRequestType photoRequestType;

  @override
  Widget build(BuildContext context) {
    FToast().init(context);

    return Consumer(
      builder: (context, ref, child) {
        final photoState = ref.watch(photoListProvider);

        return SafeArea(
          child: photoState.when(
            loading: () => const Scaffold(
              body: LoadingIndicator(),
            ),
            error: (error, stack) => const Scaffold(
              body: ErrorCard(
                errorMessage: AppErrorString.photoError,
              ),
            ),
            data: (photoList) {
              return Scaffold(
                appBar: AppBar(
                  leading: InkWell(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(CupertinoIcons.back),
                  ),
                  title: const Text(AppStrings.gallery),
                  actions: [
                    ActionButton(
                      buttonTitle: AppStrings.edit,
                      onPressed: () => Navigator.pop(
                        context,
                        photoRequestType == PhotoRequestType.one
                            ? ref.read(radioPhotoDataStateProvider)
                            : ref.read(photoDatasStateProvider),
                      ),
                      isEnable: photoRequestType == PhotoRequestType.one
                          ? ref.watch(isSelectPhotoOne)
                          : ref.watch(isSelectPhoto),
                    ),
                  ],
                ),
                body: Column(
                  children: [
                    Expanded(
                      child: GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                        itemCount: photoList.length,
                        itemBuilder: (_, index) {
                          return FutureBuilder<Uint8List?>(
                            future: photoList[index].thumbData,
                            builder: (_, snapshot) {
                              final bytes = snapshot.data;
                              if (bytes == null) {
                                return const LoadingIndicator();
                              }
                              final checks = ref.watch(photoDataStateProvider);
                              return photoRequestType == PhotoRequestType.one
                                  ? InkWell(
                                      onTap: () async {
                                        final imagePath = await photoList[index].file;
                                        ref.read(radioPhotoDataStateProvider.state).state = imagePath!.path;
                                        ref.read(photoDataStateProvider.notifier).checkOne(index);
                                      },
                                      child: RadioImageThumbnail(
                                        index: index,
                                        imageData: bytes,
                                        check: checks[index],
                                      ),
                                    )
                                  : ImageThumbnail(
                                      imageData: bytes,
                                    );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
