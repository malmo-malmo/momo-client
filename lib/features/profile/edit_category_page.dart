import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo_flutter/features/profile/provider/category_provider.dart';
import 'package:momo_flutter/features/profile/widgets/category_list_card.dart';
import 'package:momo_flutter/provider/user_provider.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:momo_flutter/widgets/button/action_button.dart';

class EditCategoryPage extends StatelessWidget {
  const EditCategoryPage(this.initialState, {Key? key}) : super(key: key);

  static const routeName = 'EditCategoryPage';

  final List<bool> initialState;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(CupertinoIcons.back),
          ),
          title: const Text(AppStrings.favoriteCategory),
          actions: [
            Consumer(
              builder: (context, ref, child) {
                final isValid = ref.watch(categoryCheckProvider(initialState));
                final categoryState = ref.watch(categoryStateProvider(initialState));
                return ActionButton(
                  buttonTitle: AppStrings.complete,
                  onPressed: () async {
                    await ref.read(userDataStateProvider.notifier).updateUserCategories(categoryState);
                    Navigator.pop(context);
                  },
                  isEnable: isValid,
                );
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: CategoryListCard(
            initialState: initialState,
          ),
        ),
      ),
    );
  }
}
