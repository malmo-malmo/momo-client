import 'package:flutter/material.dart';
import 'package:momo_flutter/resources/resources.dart';

class OnOffToggleButton extends StatefulWidget {
  const OnOffToggleButton({Key? key, required this.tabButton}) : super(key: key);

  final Function(bool onOff) tabButton;

  @override
  _OnOffToggleButtonState createState() => _OnOffToggleButtonState();
}

class _OnOffToggleButtonState extends State<OnOffToggleButton> {
  List<bool> checks = [true, false];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(22),
          onTap: () {
            widget.tabButton(true);
            checks = [true, false];
            setState(() {});
          },
          child: Container(
            height: 44,
            width: 91,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              color: checks[0] ? AppColors.purple : AppColors.gray1,
            ),
            child: Center(
              child: Text(
                AppStrings.online,
                style: AppStyles.regular16.copyWith(
                  color: checks[0] ? AppColors.gray0 : AppColors.gray4,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        InkWell(
          borderRadius: BorderRadius.circular(22),
          onTap: () {
            widget.tabButton(false);
            checks = [false, true];
            setState(() {});
          },
          child: Container(
            height: 44,
            width: 106,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              color: checks[1] ? AppColors.purple : AppColors.gray1,
            ),
            child: Center(
              child: Text(
                AppStrings.offline,
                style: AppStyles.regular16.copyWith(
                  color: checks[1] ? AppColors.gray0 : AppColors.gray4,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
