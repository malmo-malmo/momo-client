import 'package:flutter/material.dart';
import 'package:momo_flutter/app_consts.dart';
import 'package:momo_flutter/data/models/attendance/attendance_response.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:momo_flutter/widgets/card/profile_image_card.dart';

class AttendanceCard extends StatelessWidget {
  const AttendanceCard(
    this.attendanceResponse, {
    Key? key,
    required this.onSelect,
  }) : super(key: key);

  final AttendanceResponse attendanceResponse;
  final void Function({
    required int userId,
    required bool isAttend,
  }) onSelect;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      height: 72,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ProfileImageCard(
                img: attendanceResponse.imageUrl ?? AppConsts.defalutProfile,
                rad: 18,
              ),
              const SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    attendanceResponse.nickname,
                    style: AppStyles.bold14,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    AppStrings.achievementRate + ' ${attendanceResponse.attendanceRate}%',
                    style: AppStyles.regular12.copyWith(
                      color: AppColors.gray5,
                    ),
                  )
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () => onSelect(
                  userId: attendanceResponse.attendanceId,
                  isAttend: true,
                ),
                child: CircleAvatar(
                  radius: 12,
                  backgroundColor: attendanceResponse.isAttend ? AppColors.purple : AppColors.gray2,
                  child: attendanceResponse.isAttend
                      ? const Icon(
                          Icons.check,
                          size: 16,
                          color: AppColors.backgroundWhite,
                        )
                      : const SizedBox(),
                ),
              ),
              const SizedBox(width: 32),
              InkWell(
                onTap: () {
                  onSelect(
                    userId: attendanceResponse.attendanceId,
                    isAttend: false,
                  );
                },
                child: CircleAvatar(
                  radius: 12,
                  backgroundColor: !attendanceResponse.isAttend ? AppColors.purple : AppColors.gray2,
                  child: !attendanceResponse.isAttend
                      ? const Icon(
                          Icons.check,
                          size: 16,
                          color: AppColors.backgroundWhite,
                        )
                      : const SizedBox(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
