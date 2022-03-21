import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:momo_flutter/app_consts.dart';
import 'package:momo_flutter/features/chat/chat_room_page.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:momo_flutter/widgets/card/profile_image_card.dart';

class ChatListPage extends StatelessWidget {
  const ChatListPage({Key? key}) : super(key: key);

  static const routeName = 'ChatListPage';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.gray1,
        appBar: AppBar(
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(CupertinoIcons.back),
          ),
          title: const Text('쪽지함'),
          backgroundColor: AppColors.backgroundWhite,
        ),
        body: ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 22),
          itemBuilder: (context, index) => _ChatListCard(index),
          itemCount: 30,
          separatorBuilder: (context, index) => const SizedBox(height: 14),
        ),
      ),
    );
  }
}

class _ChatListCard extends StatelessWidget {
  const _ChatListCard(this.index, {Key? key}) : super(key: key);

  final int index;
  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(index),
      endActionPane: ActionPane(
        extentRatio: 0.2,
        motion: const BehindMotion(),
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.purple,
              ),
              height: 76,
              width: 64,
              child: const Center(
                child: Icon(
                  CupertinoIcons.delete,
                  color: AppColors.backgroundWhite,
                ),
              ),
            ),
          ),
        ],
      ),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            ChatRoomPage.routeName,
          );
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.backgroundWhite,
            boxShadow: const [BoxShadow()],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          height: 76,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const ProfileImageCard(
                    img: AppConsts.defalutProfile,
                    rad: 18,
                  ),
                  const SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('런닝맨', style: AppStyles.bold14),
                      const SizedBox(height: 6),
                      SizedBox(
                        width: 200,
                        child: Text(
                          '모임에 참가하고 싶어요!! 모임에 참가하고 싶어요!! 모임에 참가하고 싶어요!! 모임에 참가하고 싶어요!!',
                          style: AppStyles.regular12.copyWith(
                            color: AppColors.gray6,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Text(
                '오후 9:00',
                style: AppStyles.regular12.copyWith(color: AppColors.gray4),
              )
            ],
          ),
        ),
      ),
    );
  }
}
