import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:momo_flutter/widgets/button/bottom_sheet_tab_button.dart';
import 'package:momo_flutter/widgets/dialog/question_dialog.dart';
import 'package:momo_flutter/widgets/indicator/bottom_sheet_indicator.dart';

class DeleteBottomSheet extends StatelessWidget {
  const DeleteBottomSheet(this.id, {Key? key}) : super(key: key);

  final int id;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 18, left: 16, right: 16),
      height: 102,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const BottomSheetIndicator(),
          const SizedBox(height: 18),
          Consumer(
            builder: (context, ref, child) {
              return BottomSheetTabButton(
                title: AppStrings.toDelte,
                icon: AppIcons.delete,
                onTap: () async {
                  final result = await showDialog(
                    context: context,
                    builder: (_) => const QuestionDialog(
                      dialogText: '삭제하시겠습니까?\n삭제 후 복구가 불가능합니다.',
                      yesText: '네, 삭제할게요',
                    ),
                  );
                  Navigator.pop(context);
                  if (result != null && result) {}
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
