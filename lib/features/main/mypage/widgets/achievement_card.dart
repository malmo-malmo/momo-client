import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:pie_chart/pie_chart.dart';

class AchievementCard extends StatefulWidget {
  const AchievementCard({Key? key}) : super(key: key);

  @override
  State<AchievementCard> createState() => _AchievementCardState();
}

class _AchievementCardState extends State<AchievementCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: _isExpanded ? 266 : 60,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.backgroundPurple,
      ),
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  text: '내 달성률 ',
                  style: AppStyles.regular14.copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppColors.purple,
                  ),
                  children: const [
                    TextSpan(
                      text: '살펴보기',
                      style: AppStyles.regular14,
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () => setState(() => _isExpanded = !_isExpanded),
                child: AnimatedRotation(
                  duration: const Duration(milliseconds: 200),
                  turns: _isExpanded ? 1 / 4 : 3 / 4,
                  child: const Icon(
                    CupertinoIcons.back,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          Container(color: AppColors.gray0, height: 1),
          const SizedBox(height: 20),
          RichText(
            text: TextSpan(
              text: '당신은 진정한 ',
              style: AppStyles.bold20,
              children: [
                TextSpan(
                  text: '프로 모임러!',
                  style: AppStyles.bold20.copyWith(
                    color: AppColors.purple,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 26),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationY(pi),
                    child: PieChart(
                      dataMap: {'1': (100 - 80).toDouble(), '2': (80).toDouble()},
                      chartType: ChartType.ring,
                      chartRadius: 100,
                      ringStrokeWidth: 16,
                      gradientList: const [
                        [
                          AppColors.gray2,
                          AppColors.gray2,
                        ],
                        [AppColors.purple, AppColors.purple],
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
                    '80',
                    style: AppStyles.bold20.copyWith(
                      color: AppColors.purple,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '내 모임 달성률 top3',
                      style: AppStyles.bold14.copyWith(fontSize: 12),
                    ),
                    const SizedBox(height: 16),
                    const _GroupRateRow(
                      groupName: '기초를 위한 영어 회화 모임',
                      rate: 100,
                    ),
                    const _GroupRateRow(
                      groupName: '서울 맛집 탐방',
                      rate: 60,
                    ),
                    const _GroupRateRow(
                      groupName: '청계천 달리기&산책',
                      rate: 60,
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class _GroupRateRow extends StatelessWidget {
  const _GroupRateRow({
    Key? key,
    required this.groupName,
    required this.rate,
  }) : super(key: key);

  final String groupName;
  final int rate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 103,
            child: Text(
              groupName,
              style: AppStyles.regular12.copyWith(color: AppColors.gray6),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(
            '$rate%',
            style: AppStyles.regular12.copyWith(color: AppColors.gray6),
          ),
        ],
      ),
    );
  }
}
