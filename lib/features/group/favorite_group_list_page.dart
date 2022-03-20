import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo_flutter/features/group/providers/favorite_group_provider.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:momo_flutter/widgets/card/group_card.dart';
import 'package:momo_flutter/widgets/indicator/loading_indicator.dart';

class FavoriteGroupListPage extends StatelessWidget {
  const FavoriteGroupListPage({Key? key}) : super(key: key);

  static const routeName = 'FavoriteGroupListPage';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(CupertinoIcons.back),
          ),
          title: const Text(AppStrings.favoriteGroup),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Consumer(
            builder: (context, ref, _) {
              final favoriteGroupState = ref.watch(favoriteGroupListProvider);
              if (favoriteGroupState.isLoading) {
                return const LoadingIndicator();
              }

              if (favoriteGroupState.favoriteGroups.isEmpty) {
                return const Center(
                  child: Text('찜한 모임이 없습니다!'),
                );
              }

              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: MediaQuery.of(context).size.width / 360 * 200,
                  mainAxisSpacing: 14,
                  crossAxisSpacing: 14,
                  childAspectRatio: 100 / 150,
                ),
                itemCount: favoriteGroupState.favoriteGroups.length,
                itemBuilder: (context, index) {
                  return GroupCard(
                    favoriteGroupState.favoriteGroups[index],
                    setLike: () {
                      if (favoriteGroupState.favoriteGroups[index].favoriteGroup) {
                        ref.read(favoriteGroupListProvider.notifier).deleteLike(index);
                      } else {
                        ref.read(favoriteGroupListProvider.notifier).createLike(index);
                      }
                    },
                    width: MediaQuery.of(context).size.width / 360 * 157,
                    height: MediaQuery.of(context).size.height / 640 * 200,
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
