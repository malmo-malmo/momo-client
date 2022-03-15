import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo_flutter/resources/resources.dart';

class EventCard extends ConsumerWidget {
  const EventCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      child: Container(
        margin: const EdgeInsets.only(top: 44),
        padding: const EdgeInsets.symmetric(horizontal: 24),
        height: 97,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColors.gray0,
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 3),
              blurRadius: 6,
              spreadRadius: 0,
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '나에게 맞는 모임은?',
                  style: AppStyles.regular12.copyWith(
                    color: AppColors.gray6,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'MBTI별 모임 찾기',
                  style: AppStyles.bold16,
                ),
              ],
            ),
            Transform.rotate(
              angle: pi,
              child: const Icon(
                CupertinoIcons.back,
                size: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
