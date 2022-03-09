import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo_flutter/data/datasources/remote/retrofit_client_provider.dart';

final districtResultProvider = FutureProvider.family.autoDispose<List<String>, String>(
  (ref, cityCode) async {
    final districtClient = ref.watch(districtClientProvider);
    final districts = await districtClient.getDistricts(cityCode);
    return districts.map((e) => e.districtName).toList();
  },
);
