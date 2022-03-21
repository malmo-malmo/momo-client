import 'package:flutter/material.dart';
import 'package:momo_flutter/features/chat/chat_list_page.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:momo_flutter/utils/load_asset.dart';

class HeaderChatButton extends StatelessWidget {
  const HeaderChatButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            ChatListPage.routeName,
          );
        },
        child: loadAsset(AppIcons.chat),
      ),
    );
  }
}
