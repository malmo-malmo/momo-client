import 'package:flutter/material.dart';
import 'package:momo_flutter/data/models/post/post_response.dart';
import 'package:momo_flutter/features/post/post_detail_page.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:momo_flutter/utils/format/post_card_date_format.dart';
import 'package:momo_flutter/widgets/card/profile_image_card.dart';

class PostCard extends StatelessWidget {
  const PostCard(
    this.post, {
    Key? key,
    this.isEnd = false,
  }) : super(key: key);

  final PostResponse post;
  final bool isEnd;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: InkWell(
        onTap: !isEnd
            ? () async {
                Navigator.pushNamed(
                  context,
                  PostDetailPage.routeName,
                  arguments: post.id,
                );
              }
            : null,
        child: Container(
          height: 182,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(),
            ],
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
                      img: post.authorImage ??
                          'https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/cbdef037365169.573db7853cebb.jpg',
                      rad: 16,
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          post.authorNickname,
                          style: AppStyles.regular14,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          post.createdDate.contains('-') ? postCardDateFormat(post.createdDate) : post.createdDate,
                          style: AppStyles.regular12.copyWith(
                            color: AppColors.gray4,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(post.title, style: AppStyles.bold16),
                const SizedBox(height: 12),
                Text(
                  post.contents,
                  style: AppStyles.regular14,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 12),
                Text(
                  AppStrings.commentCount + ' ' + '${post.commentCnt}',
                  style: AppStyles.regular12.copyWith(
                    color: AppColors.gray4,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
