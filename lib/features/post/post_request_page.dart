import 'package:flutter/material.dart';
import 'package:momo_flutter/data/models/enum/post_type.dart';

class PostRequestArg {
  final int groupId;
  final PostType postType;

  PostRequestArg({
    required this.groupId,
    required this.postType,
  });
}

class PostRequestPage extends StatelessWidget {
  const PostRequestPage(this.arg, {Key? key}) : super(key: key);

  static const routeName = 'PostRequestPage';

  final PostRequestArg arg;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
