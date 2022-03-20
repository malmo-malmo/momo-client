import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:momo_flutter/app_consts.dart';
import 'package:momo_flutter/data/models/schedule/schedule_detail_response.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:momo_flutter/utils/format/post_card_date_format.dart';
import 'package:momo_flutter/widgets/card/profile_image_card.dart';

class ScheduleCard extends StatelessWidget {
  const ScheduleCard(this.schedule, {Key? key}) : super(key: key);

  final ScheduleDetailResponse schedule;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [BoxShadow()],
        color: AppColors.backgroundWhite,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ProfileImageCard(
                      img: schedule.authorImage ?? AppConsts.defalutProfile,
                      rad: 18,
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          schedule.authorNickname,
                          style: AppStyles.bold14,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          postCardDateFormat(schedule.startDateTime),
                          style: AppStyles.regular12.copyWith(
                            color: AppColors.gray4,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  height: 32,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: schedule.attend ? const Color(0xffedf2ff) : const Color(0xfffff0f0),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          schedule.attend ? Icons.check : CupertinoIcons.xmark,
                          size: 12,
                          color: schedule.attend ? AppColors.backgroundPurple : AppColors.red,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          schedule.attend ? '출석' : '불참',
                          style: AppStyles.regular10.copyWith(
                            color: schedule.attend ? AppColors.blue : AppColors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            Text(schedule.title, style: AppStyles.bold16),
            const SizedBox(height: 12),
            Text(
              schedule.contents,
              style: AppStyles.regular14,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
