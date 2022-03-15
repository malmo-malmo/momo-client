import 'package:flutter_riverpod/flutter_riverpod.dart';

final reminderSelectedDayProvider = StateProvider.autoDispose<int>((ref) => DateTime.now().day);
