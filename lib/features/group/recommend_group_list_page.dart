import 'package:flutter/material.dart';

class RecommendGroupListPage extends StatefulWidget {
  const RecommendGroupListPage(this.likeCallback, {Key? key}) : super(key: key);

  final void Function({
    required int groupId,
    required bool like,
  }) likeCallback;

  static const routeName = 'RecommendGroupListPage';

  @override
  State<RecommendGroupListPage> createState() => _RecommendGroupListPageState();
}

class _RecommendGroupListPageState extends State<RecommendGroupListPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
