import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:momo_flutter/utils/format/calendar_format.dart';
import 'package:momo_flutter/widgets/button/bottom_button.dart';
import 'package:momo_flutter/widgets/button/dialog_bottom_button.dart';
import 'package:momo_flutter/widgets/calendar_style/calendar_default_builder.dart';
import 'package:momo_flutter/widgets/calendar_style/calendar_disabled_builder.dart';
import 'package:momo_flutter/widgets/calendar_style/calendar_dow_builder.dart';
import 'package:momo_flutter/widgets/calendar_style/calendar_header_style.dart';
import 'package:momo_flutter/widgets/calendar_style/calendar_outside_builder.dart';
import 'package:momo_flutter/widgets/calendar_style/calendar_selected_builder.dart';
import 'package:momo_flutter/widgets/calendar_style/calendar_today_builder.dart';
import 'package:table_calendar/table_calendar.dart';

class DateInputField extends StatefulWidget {
  const DateInputField({
    Key? key,
    required this.setDate,
  }) : super(key: key);

  final Function(DateTime dateTime) setDate;

  @override
  State<DateInputField> createState() => _DateInputFieldState();
}

class _DateInputFieldState extends State<DateInputField> {
  String dateTimeText = '';

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final dateTime = await showDialog(
          context: context,
          builder: (context) => const _CalendarDialog(),
        );

        if (dateTime != null) {
          widget.setDate(dateTime);
          dateTimeText = DateFormat('yyyy-MM-dd').format(dateTime) + ' ' + dayTitleToKR(dateTime) + '요일';
          setState(() {});
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        height: 44,
        width: 190,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: dateTimeText.isNotEmpty ? AppColors.gray4 : AppColors.gray1,
        ),
        child: Center(
          child: Text(
            dateTimeText,
            style: AppStyles.regular16.copyWith(
              color: AppColors.gray0,
            ),
          ),
        ),
      ),
    );
  }
}

final selectDayProvider = Provider.autoDispose<DateTime>((ref) => ref.watch(selectdDayStateProvider));

final selectdDayStateProvider = StateProvider.autoDispose<DateTime>((ref) => DateTime.now());

class _CalendarDialog extends StatelessWidget {
  const _CalendarDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final _selectDay = ref.watch(selectDayProvider);

        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: SizedBox(
            height: 363,
            width: 280,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8, right: 28, left: 28),
                  child: TableCalendar(
                    firstDay: DateTime.now(),
                    lastDay: DateTime.utc(DateTime.now().year + 2, 12, 31),
                    focusedDay: _selectDay,
                    formatAnimationDuration: const Duration(milliseconds: 200),
                    locale: 'ko-KR',
                    rowHeight: 32,
                    headerStyle: calendarHeaderStyle(
                      iconPadding: 24,
                      titleTextStyle: AppStyles.bold16,
                    ),
                    onDaySelected: (selDay, foDay) => ref.read(selectdDayStateProvider.state).state = selDay,
                    selectedDayPredicate: (date) => _selectDay == date,
                    calendarBuilders: CalendarBuilders(
                      selectedBuilder: (context, date, focusedDay) => calendarSelectedBuilder(date, _selectDay),
                      todayBuilder: calendarTodayBuilder,
                      dowBuilder: calendarDowBuilder,
                      defaultBuilder: calendarDefaultBuilder,
                      outsideBuilder: calendarOutsideBuilder,
                      disabledBuilder: calendarDisabledBuilder,
                      rangeStartBuilder: calendarTodayBuilder,
                    ),
                  ),
                ),
                DialogBottomButton(
                  isEnable: true,
                  result: _selectDay,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
