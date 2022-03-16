import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:pie_chart/pie_chart.dart';

class WeeklyTopRateCard extends StatelessWidget {
  const WeeklyTopRateCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      height: 304,
      width: 328,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.backgroundWhite,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const _AchievementRow(
            title: '하루 3시간 공부 인증',
            icon: CupertinoIcons.at_circle,
            rate: 95,
          ),
          Container(height: 1, color: AppColors.lineGrayPurple),
          const _AchievementRow(
            title: '영어회화 초급 스터디',
            icon: CupertinoIcons.at_circle,
            rate: 90,
          ),
          Container(height: 1, color: AppColors.lineGrayPurple),
          const _AchievementRow(
            title: '서울 맛집탐방',
            icon: CupertinoIcons.at_circle,
            rate: 80,
          ),
          Container(height: 1, color: AppColors.lineGrayPurple),
          const _AchievementRow(
            title: '주제가 있는 독서모임',
            icon: CupertinoIcons.at_circle,
            rate: 60,
          ),
        ],
      ),
    );
  }
}

class _AchievementRow extends StatelessWidget {
  const _AchievementRow({
    Key? key,
    required this.title,
    required this.icon,
    required this.rate,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final int rate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          Icon(icon, size: 36),
          const SizedBox(width: 14),
          Text(
            title,
            style: AppStyles.bold16,
          ),
          const Spacer(),
          Stack(
            alignment: Alignment.center,
            children: [
              Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(pi),
                child: PieChart(
                  dataMap: {'1': (100 - rate).toDouble(), '2': (rate).toDouble()},
                  chartType: ChartType.ring,
                  chartRadius: 32,
                  ringStrokeWidth: 5,
                  gradientList: const [
                    [
                      AppColors.gray4,
                      AppColors.gray4,
                    ],
                    [
                      AppColors.purple,
                      AppColors.purple,
                    ],
                  ],
                  initialAngleInDegree: 270,
                  legendOptions: const LegendOptions(
                    showLegendsInRow: false,
                    showLegends: false,
                  ),
                  chartValuesOptions: const ChartValuesOptions(
                    showChartValueBackground: false,
                    showChartValues: false,
                    showChartValuesInPercentage: false,
                    showChartValuesOutside: false,
                    decimalPlaces: 1,
                  ),
                ),
              ),
              Text(
                '$rate',
                style: AppStyles.regular10,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
