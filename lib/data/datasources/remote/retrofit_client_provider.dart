import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo_flutter/data/datasources/remote/dio_provider.dart';
import 'package:momo_flutter/data/datasources/remote/retrofit/attendance_client.dart';
import 'package:momo_flutter/data/datasources/remote/retrofit/comment_client.dart';
import 'package:momo_flutter/data/datasources/remote/retrofit/district_client.dart';
import 'package:momo_flutter/data/datasources/remote/retrofit/favorite_client.dart';
import 'package:momo_flutter/data/datasources/remote/retrofit/group_client.dart';
import 'package:momo_flutter/data/datasources/remote/retrofit/management_client.dart';
import 'package:momo_flutter/data/datasources/remote/retrofit/post_client.dart';
import 'package:momo_flutter/data/datasources/remote/retrofit/schedule_client.dart';
import 'package:momo_flutter/data/datasources/remote/retrofit/user_client.dart';

final groupClientProvider = Provider<GroupClient>((ref) {
  final dio = ref.watch(dioProvider);
  return GroupClient(dio);
});

final postClientProvider = Provider<PostClient>((ref) {
  final dio = ref.watch(dioProvider);
  return PostClient(dio);
});

final scheduleClientProvider = Provider<ScheduleClient>((ref) {
  final dio = ref.watch(dioProvider);
  return ScheduleClient(dio);
});

final attendanceClientProvider = Provider<AttendanceClient>((ref) {
  final dio = ref.watch(dioProvider);
  return AttendanceClient(dio);
});

final userClientProvider = Provider<UserClient>((ref) {
  final dio = ref.watch(dioProvider);
  return UserClient(dio);
});

final commentClientProvider = Provider<CommentClient>((ref) {
  final dio = ref.watch(dioProvider);
  return CommentClient(dio);
});

final districtClientProvider = Provider<DistrictClient>((ref) {
  final dio = ref.watch(dioProvider);
  return DistrictClient(dio);
});

final favoriteClientProvider = Provider<FavoriteClient>((ref) {
  final dio = ref.watch(dioProvider);
  return FavoriteClient(dio);
});

final managementClientProvider = Provider<ManagementClient>((ref) {
  final dio = ref.watch(dioProvider);
  return ManagementClient(dio);
});
