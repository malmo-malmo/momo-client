import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo_flutter/app_config.dart';
import 'package:momo_flutter/app_consts.dart';
import 'package:momo_flutter/provider/user_provider.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:momo_flutter/utils/load_asset.dart';

class UserCategoryList extends ConsumerWidget {
  const UserCategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userData = ref.watch(userDataStateProvider);
    return SizedBox(
      height: 88,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: InkWell(
                onTap: () {},
                child: const CircleAvatar(
                  radius: 32,
                  backgroundColor: AppColors.gray3,
                  child: Icon(
                    Icons.add,
                    color: AppColors.gray4,
                  ),
                ),
              ),
            );
          }
          return _UserCategoryColumn(userData.categories[index - 1].name);
        },
        separatorBuilder: (context, index) => const SizedBox(width: 14),
        itemCount: userData.categories.length + 1,
      ),
    );
  }
}

class _UserCategoryColumn extends StatelessWidget {
  const _UserCategoryColumn(this.categoryName, {Key? key}) : super(key: key);

  final String categoryName;

  @override
  Widget build(BuildContext context) {
    final _index = _getCategoryIcon(categoryName);
    return Column(
      children: [
        loadAsset(categoryIconOn[_index]),
        const SizedBox(height: 8),
        Text(
          categoryName,
          style: AppStyles.regular14,
        ),
      ],
    );
  }

  int _getCategoryIcon(String categoryName) {
    for (int i = 0; i < 8; i++) {
      if (AppConfig.categoryCodeNamePair[i].name == categoryName) {
        return i;
      }
    }
    return -1;
  }
}
