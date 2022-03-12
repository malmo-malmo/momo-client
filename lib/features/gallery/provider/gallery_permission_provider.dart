import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_manager/photo_manager.dart';

final galleryPermissionProvider = FutureProvider<bool>((ref) async {
  PermissionState result = await PhotoManager.requestPermissionExtend();
  if (result.isAuth) {
    return true;
  }
  return false;
});
