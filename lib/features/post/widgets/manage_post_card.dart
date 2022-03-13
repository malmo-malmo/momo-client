import 'package:flutter/material.dart';
import 'package:momo_flutter/data/models/management/management_post_response.dart';
import 'package:momo_flutter/features/post/post_detail_page.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:momo_flutter/utils/format/post_card_date_format.dart';
import 'package:momo_flutter/widgets/card/profile_image_card.dart';

class ManagePostCard extends StatelessWidget {
  const ManagePostCard(this.managePost, {Key? key}) : super(key: key);

  final ManagementPostResponse managePost;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(
        context,
        PostDetailPage.routeName,
        arguments: managePost.post.id,
      ),
      child: Container(
        height: 182,
        decoration: AppStyles.containerDecoration(
          radius: 20,
          color: AppColors.backgroundWhite,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ProfileImageCard(
                    img: managePost.post.authorImage ?? 'adf',
                    rad: 18,
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        managePost.post.authorNickname,
                        style: AppStyles.bold14,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        postCardDateFormat(managePost.post.createdDate),
                        style: AppStyles.regular12.copyWith(
                          color: AppColors.gray4,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                managePost.post.title,
                style: AppStyles.bold16,
              ),
              const SizedBox(height: 12),
              Text(
                managePost.post.contents,
                style: AppStyles.regular14,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 12),
              Text(
                managePost.groupName,
                style: AppStyles.regular12.copyWith(
                  color: AppColors.gray4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
