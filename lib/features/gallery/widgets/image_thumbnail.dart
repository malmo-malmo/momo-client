import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:momo_flutter/features/gallery/provider/photo_data_provider.dart';
import 'package:momo_flutter/resources/app_error_strings.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:momo_flutter/widgets/toast/cutom_toast.dart';

class ImageThumbnail extends StatefulWidget {
  const ImageThumbnail({
    Key? key,
    required this.imageData,
  }) : super(key: key);

  final Uint8List imageData;

  @override
  State<ImageThumbnail> createState() => _ImageThumbnailState();
}

class _ImageThumbnailState extends State<ImageThumbnail> {
  bool _check = false;
  late String imagePath;

  @override
  void initState() {
    super.initState();
    imagePath = File.fromRawPath(widget.imageData).path;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return InkWell(
          onTap: () {
            if (ref.watch(checkMaxPhoto) && !_check) {
              FToast().showToast(
                child: const CustomToast(
                  AppErrorString.maxPhotoError,
                ),
                gravity: ToastGravity.BOTTOM,
              );
            } else {
              ref.read(photoDatasStateProvider.notifier).setData(check: _check, image: imagePath);
              setState(() => _check = !_check);
            }
          },
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.memory(
                  widget.imageData,
                  fit: BoxFit.cover,
                  gaplessPlayback: true,
                ),
              ),
              _check
                  ? Opacity(
                      opacity: 0.4,
                      child: Container(
                        height: double.infinity,
                        width: double.infinity,
                        color: AppColors.gray6,
                      ),
                    )
                  : const SizedBox(),
              _check
                  ? const Center(
                      child: Icon(
                      Icons.check,
                      color: AppColors.gray0,
                    ))
                  : const SizedBox(),
            ],
          ),
        );
      },
    );
  }
}
