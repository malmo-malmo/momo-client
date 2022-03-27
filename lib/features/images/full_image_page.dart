import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:momo_flutter/resources/resources.dart';

class FullImagePage extends StatelessWidget {
  const FullImagePage(this.image, {Key? key}) : super(key: key);

  static const routeName = 'FullImagePage';

  final String image;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.gray6,
        appBar: AppBar(
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              CupertinoIcons.xmark,
              color: AppColors.backgroundWhite,
            ),
          ),
        ),
        extendBodyBehindAppBar: true,
        body: Padding(
          padding: const EdgeInsets.only(top: 120, bottom: 160),
          child: Image.network(
            image,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
