import 'package:flutter/material.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:momo_flutter/utils/load_asset.dart';

class FloatingInputField extends StatefulWidget {
  const FloatingInputField({
    Key? key,
    required this.hintText,
    required this.sendMessage,
  }) : super(key: key);

  final String hintText;
  final Function(String text) sendMessage;

  @override
  State<FloatingInputField> createState() => _FloatingInputFieldState();
}

class _FloatingInputFieldState extends State<FloatingInputField> {
  bool check = false;
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 14),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColors.gray1,
              ),
              constraints: const BoxConstraints(maxHeight: 88),
              child: TextFormField(
                scrollPadding: EdgeInsets.zero,
                controller: _controller,
                maxLength: 150,
                maxLines: null,
                strutStyle: StrutStyle.disabled,
                style: AppStyles.regular14.copyWith(height: 22 / 14),
                decoration: InputDecoration(
                  hintText: widget.hintText,
                  border: InputBorder.none,
                  counterText: '',
                ),
                onChanged: (text) => setState(
                  () => check = _controller.text.isNotEmpty,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: InkWell(
              borderRadius: BorderRadius.circular(22),
              onTap: check
                  ? () {
                      widget.sendMessage(_controller.text);
                      _controller.clear();
                      FocusScope.of(context).unfocus();
                    }
                  : null,
              child: loadAsset(
                AppIcons.sendButton,
                color: check ? AppColors.purple : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
