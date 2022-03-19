import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo_flutter/data/models/post/post_detail_response.dart';
import 'package:momo_flutter/features/post/provider/comment_list_provider.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:momo_flutter/utils/format/post_card_date_format.dart';
import 'package:momo_flutter/widgets/card/profile_image_card.dart';
import 'package:momo_flutter/widgets/title/sub_title.dart';

class PostDetailCard extends StatelessWidget {
  const PostDetailCard(this.post, {Key? key}) : super(key: key);

  final PostDetailResponse post;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 72,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      ProfileImageCard(
                        img: post.authorImage ??
                            'https://www.theguru.co.kr/data/photos/20210937/art_16316071303022_bf8378.jpg',
                        rad: 18,
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            post.authorNickname,
                            style: AppStyles.regular14,
                          ),
                          const SizedBox(height: 6),
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
                ],
              ),
            ),
            SubTitle(post.title),
            const SizedBox(height: 20),
            Text(
              post.contents,
              style: AppStyles.regular14,
            ),
            const SizedBox(height: 32),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (int i = 0; i < post.imageUrls.length; i++)
                  InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: () {},
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        post.imageUrls[i],
                        width: 72,
                        height: 72,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 30),
            Container(height: 1, color: AppColors.gray1),
            const SizedBox(height: 20),
            Consumer(
              builder: (context, ref, _) {
                return Text(
                  AppStrings.commentCount + ' ${ref.watch(commentListStateProvider(post.id)).commentCnt}',
                  style: AppStyles.regular12.copyWith(
                    color: AppColors.gray4,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
