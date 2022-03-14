import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo_flutter/features/main/my_group/provider/group_request_provider.dart';
import 'package:momo_flutter/resources/resources.dart';

class RecruitNumberInputBox extends StatelessWidget {
  const RecruitNumberInputBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.gray4,
            ),
            padding: const EdgeInsets.only(left: 24),
            height: 44,
            width: 60,
            child: Center(
              child: SizedBox(
                height: 44,
                width: 40,
                child: Consumer(
                  builder: (context, ref, child) {
                    return TextField(
                      onChanged: ref.read(groupRequestStateProvider.notifier).setRecruitmentCnt,
                      decoration: const InputDecoration(counterText: ''),
                      keyboardType: TextInputType.number,
                      maxLength: 2,
                      maxLines: 1,
                    );
                  },
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          const Text(
            '명',
            style: AppStyles.regular16,
          ),
        ],
      ),
    );
  }
}
