import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo_flutter/data/models/management/my_group_response.dart';
import 'package:momo_flutter/data/repositories/schedule_repository.dart';

final groupSummaryProvider = FutureProvider.autoDispose<List<MyGroupResponse>>(
  (ref) {
    final scheduleRepository = ref.watch(scheduleRepositoryProvider);
    return scheduleRepository.getMyGroupSummary();
  },
);
