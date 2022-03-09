import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo_flutter/app_config.dart';
import 'package:momo_flutter/data/datasources/remote/retrofit/user_client.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:momo_flutter/utils/calculate_offset.dart';
import 'package:momo_flutter/widgets/input_field/custom_drop_down_list.dart';

class CityInputField extends StatelessWidget {
  CityInputField({
    Key? key,
    this.color,
    required this.city,
    required this.setCity,
  }) : super(key: key);

  final Color? color;
  final String city;
  final void Function(String city) setCity;

  final _cityInputBoxKey = GlobalKey();
  final _valueList = AppConfig.locationCodeNamePair.map((e) => e.name).toList();

  @override
  Widget build(BuildContext context) {
    return Container(
      key: _cityInputBoxKey,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 44,
      width: 156,
      decoration: AppStyles.containerDecoration(color: color),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            city.isEmpty ? AppStrings.seoul : city,
            style: AppStyles.regular16.copyWith(
              color: city.isEmpty ? AppColors.gray4 : null,
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  opaque: false,
                  pageBuilder: (
                    context,
                    animation,
                    secondaryAnimation,
                  ) =>
                      CustomDropDownList(
                    values: _valueList,
                    offset: calculateOffset(_cityInputBoxKey),
                    defaultValue: AppStrings.seoul,
                    curValue: city,
                    setValue: setCity,
                  ),
                  transitionsBuilder: (
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ) =>
                      FadeTransition(
                    opacity: animation,
                    child: child,
                  ),
                ),
              );
            },
            child: Transform.rotate(
              angle: pi * 3 / 2,
              child: const Icon(
                CupertinoIcons.back,
                size: 20,
              ),
            ),
          )
        ],
      ),
    );
  }
}
