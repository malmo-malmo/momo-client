import 'package:flutter/material.dart';

class NoticeListPage extends StatefulWidget {
  const NoticeListPage(this.groupId, {Key? key}) : super(key: key);

  static const routeName = 'NoticeListPage';

  final int groupId;

  @override
  State<NoticeListPage> createState() => _NoticeListPageState();
}

class _NoticeListPageState extends State<NoticeListPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
