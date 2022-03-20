import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:momo_flutter/features/gallery/provider/photo_data_provider.dart';
import 'package:momo_flutter/features/gallery/provider/photo_provider.dart';
import 'package:momo_flutter/features/gallery/widgets/image_thumbnail.dart';
import 'package:momo_flutter/resources/app_error_strings.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:momo_flutter/widgets/button/action_button.dart';
import 'package:momo_flutter/widgets/card/error_card.dart';
import 'package:momo_flutter/widgets/indicator/loading_indicator.dart';
import 'package:momo_flutter/widgets/toast/cutom_toast.dart';

enum PhotoRequestType { one, many }

class GalleryPage extends ConsumerStatefulWidget {
  const GalleryPage(this.photoRequestType, {Key? key}) : super(key: key);

  static const routeName = 'GalleryPage';
  final PhotoRequestType photoRequestType;

  @override
  ConsumerState<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends ConsumerState<GalleryPage> {
  List<String> images = [];
  String image = '';

  late FToast fToast;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  @override
  Widget build(BuildContext context) {
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
                  buttonTitle: widget.photoRequestType == PhotoRequestType.one ? AppStrings.confirm : AppStrings.add,
                  onPressed: () => Navigator.pop(
                    context,
                    widget.photoRequestType == PhotoRequestType.one ? image : images,
                  ),
                  isEnable: ref.watch(isSelectPhoto),
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
                          final checks = ref.watch(galleryStateProvider);
                          return InkWell(
                            onTap: () async {
                              final imageFile = await photoList[index].file;

                              if (widget.photoRequestType == PhotoRequestType.one) {
                                image = imageFile!.path;
                                ref.read(galleryStateProvider.notifier).checkOne(index);
                              } else {
                                if (ref.watch(checkMaxPhoto) && !checks[index]) {
                                  FToast().showToast(
                                    child: const CustomToast(AppErrorString.maxPhotoError),
                                    gravity: ToastGravity.BOTTOM,
                                  );
                                } else {
                                  checks[index] ? images.remove(imageFile!.path) : images.add(imageFile!.path);

                                  ref.read(galleryStateProvider.notifier).toggle(index);
                                }
                              }
                            },
                            child: ImageThumbnail(
                              imageData: bytes,
                              check: checks[index],
                            ),
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
  }
}
