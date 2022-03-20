import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:momo_flutter/resources/resources.dart';

class ImageThumbnail extends StatelessWidget {
  const ImageThumbnail({
    Key? key,
    required this.imageData,
    required this.check,
  }) : super(key: key);

  final Uint8List imageData;
  final bool check;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.memory(
            imageData,
            fit: BoxFit.cover,
            gaplessPlayback: true,
          ),
        ),
        check
            ? Opacity(
                opacity: 0.4,
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: AppColors.gray6,
                ),
              )
            : const SizedBox(),
        check
            ? const Center(
                child: Icon(
                Icons.check,
                color: AppColors.gray0,
              ))
            : const SizedBox(),
      ],
    );
  }
}
