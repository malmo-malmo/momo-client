import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:momo_flutter/utils/format/time_format.dart';
import 'package:momo_flutter/widgets/button/dialog_bottom_button.dart';
import 'package:momo_flutter/widgets/title/sub_title.dart';

class TimeInputField extends StatefulWidget {
  const TimeInputField({
    Key? key,
    required this.selectTime,
  }) : super(key: key);

  final Function(int hour, int minute) selectTime;

  @override
  State<TimeInputField> createState() => _TimeInputFieldState();
}

class _TimeInputFieldState extends State<TimeInputField> {
  String timeText = '';

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final result = await showDialog(
          context: context,
          builder: (_) => _TimePickerDialog(),
        );

        if (result != null) {
          result[0] = result[2] ? result[0] : result[0] + 12;
          widget.selectTime(result[0], result[1]);
          timeText = timeFormat(result[0], result[1]);
          setState(() {});
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        height: 44,
        width: 123,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: timeText.isEmpty ? AppColors.gray1 : AppColors.gray4,
        ),
        child: Center(
          child: Text(
            timeText,
            style: AppStyles.regular16.copyWith(
              color: AppColors.gray0,
            ),
          ),
        ),
      ),
    );
  }
}

final _isAmProvider = StateProvider.autoDispose<bool>((ref) => true);
final _hourProvider = StateProvider.autoDispose<int>((ref) => 0);
final _minuteProvider = StateProvider.autoDispose<int>((ref) => 0);

// ignore: must_be_immutable
class _TimePickerDialog extends StatelessWidget {
  _TimePickerDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 221,
        width: 280,
        padding: const EdgeInsets.only(top: 48),
        child: Consumer(
          builder: (context, ref, child) {
            final isAm = ref.watch(_isAmProvider);
            final hour = ref.watch(_hourProvider);
            final minute = ref.watch(_minuteProvider);
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 100,
                  padding: const EdgeInsets.symmetric(horizontal: 56),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _CustomPicker(
                        children: const [
                          Center(child: SubTitle(AppStrings.am)),
                          Center(child: SubTitle(AppStrings.pm)),
                        ],
                        onSelected: (index) => ref.read(_isAmProvider.state).state = (index == 0 ? true : false),
                      ),
                      Row(
                        children: [
                          _CustomPicker(
                            children: List.generate(12, (index) => Center(child: SubTitle('$index'))),
                            onSelected: (index) => ref.read(_hourProvider.state).state = index,
                          ),
                          const SubTitle(':'),
                          _CustomPicker(
                            children: List.generate(
                              12,
                              (index) => Center(
                                child: SubTitle(
                                  index <= 1 ? '0${index * 5}' : '${index * 5}',
                                ),
                              ),
                            ),
                            onSelected: (index) => ref.read(_minuteProvider.state).state = index * 5,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                DialogBottomButton(
                  isEnable: true,
                  result: [hour, minute, isAm],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _CustomPicker extends StatelessWidget {
  const _CustomPicker({
    Key? key,
    required this.children,
    required this.onSelected,
  }) : super(key: key);

  final List<Widget> children;
  final void Function(int index) onSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      width: 40,
      child: CupertinoPicker(
        selectionOverlay: const SizedBox(),
        squeeze: 1,
        diameterRatio: 3,
        itemExtent: 30,
        onSelectedItemChanged: onSelected,
        children: children,
      ),
    );
  }
}
