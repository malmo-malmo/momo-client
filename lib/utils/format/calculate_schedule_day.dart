import 'package:intl/intl.dart';
import 'package:momo_flutter/utils/format/calculate_max_day.dart';

String calculateRequestStartDay(int year, int month) => DateFormat('yyyy-MM-dd').format(
      DateTime(
        year,
        month,
        1,
      ),
    );

String calculateRequestEndDay(int year, int month) => DateFormat('yyyy-MM-dd').format(
      DateTime(
        year,
        month,
        calculateMaxDay(
          year,
          month,
        ),
      ),
    );
