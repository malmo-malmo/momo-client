import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo_flutter/features/gallery/gallery_page.dart';
import 'package:momo_flutter/features/gallery/provider/gallery_permission_provider.dart';
import 'package:momo_flutter/features/main/my_group/provider/group_request_provider.dart';
import 'package:momo_flutter/resources/app_error_strings.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:momo_flutter/utils/load_asset.dart';

class RequestImageBox extends StatelessWidget {
  const RequestImageBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.gray1,
      width: double.infinity,
      height: 200,
      child: Consumer(
        builder: (context, ref, child) {
          final image = ref.watch(groupRequestStateProvider).imagePath;
          return Stack(
            children: [
              image.isEmpty
                  ? const SizedBox(
                      height: 200,
                      width: double.infinity,
                      child: Center(
                        child: Text(AppErrorString.requestImageEmpty),
                      ),
                    )
                  : Image.file(
                      File(image),
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 24, bottom: 20),
                  child: InkWell(
                    onTap: () async {
                      final check = await ref.read(galleryPermissionProvider.future);
                      if (check) {
                        final imagePath = await Navigator.pushNamed(
                          context,
                          GalleryPage.routeName,
                          arguments: PhotoRequestType.one,
                        );
                        if (imagePath != null) {
                          ref.read(groupRequestStateProvider.notifier).setImageUrl(imagePath as String);
                        }
                      }
                    },
                    child: loadAsset(
                      AppIcons.camera,
                      color: image.isEmpty ? null : AppColors.backgroundWhite,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
