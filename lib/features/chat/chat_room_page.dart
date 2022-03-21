import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:momo_flutter/features/chat/widgets/chat_message_row.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:momo_flutter/widgets/input_field/floating_input_field.dart';

class ChatRoomPage extends StatelessWidget {
  const ChatRoomPage({Key? key}) : super(key: key);

  static const routeName = 'ChatRoomPage';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(CupertinoIcons.back),
          ),
          title: const Text('런닝맨'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(vertical: 22),
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 44),
                        child: Container(
                          height: 56,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color(0xff7295ff),
                          ),
                          child: Center(
                            child: Text(
                              '멤버 신청이 왔습니다. 대화를 나눠보세요.',
                              style: AppStyles.regular14.copyWith(
                                color: AppColors.gray0,
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                    return ChatMessageRow(
                      isMine: index % 2 == 0,
                      text: '채팅 메세지입니다 ' * (index + 1),
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(height: 20),
                  itemCount: 15,
                ),
              ),
              FloatingInputField(
                hintText: '메세지를 입력하세요',
                sendMessage: (text) {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
