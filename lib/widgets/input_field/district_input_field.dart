import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo_flutter/provider/district_result_provider.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:momo_flutter/utils/calculate_offset.dart';
import 'package:momo_flutter/widgets/input_field/custom_drop_down_list.dart';

class DistrictInputField extends StatelessWidget {
  DistrictInputField({
    Key? key,
    required this.district,
    required this.cityCode,
    required this.setDistrict,
    this.color,
  }) : super(key: key);

  final String district;
  final String cityCode;
  final Function(String) setDistrict;
  final Color? color;

  final _districtInputBoxKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    if (cityCode.isEmpty) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: AppStyles.containerDecoration(color: color),
        height: 44,
        width: 120,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              district.isEmpty ? AppStrings.gangnam : district,
              style: AppStyles.regular16.copyWith(
                color: district.isEmpty ? AppColors.gray4 : null,
              ),
            ),
            Transform.rotate(
              angle: pi * 3 / 2,
              child: const Icon(
                CupertinoIcons.back,
                size: 20,
              ),
            ),
          ],
        ),
      );
    }
    return Consumer(
      builder: (context, ref, child) {
        final districtList = ref.watch(districtResultProvider(cityCode));
        return Container(
          key: _districtInputBoxKey,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: AppStyles.containerDecoration(color: color),
          height: 44,
          width: 120,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ...districtList.when(
                error: (error, stacktrace) => [const SizedBox()],
                loading: () => [const SizedBox()],
                data: (data) {
                  return [
                    Text(
                      district.isEmpty ? data.first : district,
                      style: AppStyles.regular16.copyWith(
                        color: district.isEmpty ? AppColors.gray4 : null,
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
                              values: data,
                              setValue: setDistrict,
                              curValue: district,
                              offset: calculateOffset(_districtInputBoxKey),
                              defaultValue: data.first,
                              width: 120,
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
                  ];
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
