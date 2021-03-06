import 'package:flutter/material.dart';
import 'package:momo_flutter/features/profile/widgets/university_result_dialog.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:momo_flutter/utils/load_asset.dart';

class UniversityInputField extends StatefulWidget {
  const UniversityInputField({
    Key? key,
    this.color,
    this.initialValue,
  }) : super(key: key);

  final Color? color;
  final String? initialValue;

  @override
  State<UniversityInputField> createState() => _UniversityInputFieldState();
}

class _UniversityInputFieldState extends State<UniversityInputField> {
  // ignore: prefer_final_fields
  late TextEditingController _controller = TextEditingController(
    text: widget.initialValue,
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: AppStyles.containerDecoration(color: widget.color),
      height: 44,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 240,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: TextFormField(
                controller: _controller,
                decoration: const InputDecoration(
                  hintText: AppStrings.universityHint,
                ),
              ),
            ),
          ),
          InkWell(
            child: loadAsset(AppIcons.search),
            onTap: () async {
              final university = await showDialog(
                context: context,
                builder: (context) => UniversityResultDialog(_controller.text),
              );
              if (university != null) {
                _controller.text = university;
              }
            },
          ),
        ],
      ),
    );
  }
}
