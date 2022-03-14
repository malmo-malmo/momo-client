import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo_flutter/features/profile/provider/category_provider.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:momo_flutter/widgets/button/category_button.dart';

class CategoryListCard extends StatelessWidget {
  const CategoryListCard({
    Key? key,
    this.initialState,
    this.color = AppColors.backgroundWhite,
  }) : super(key: key);

  final List<bool>? initialState;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 35),
      height: 442,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26),
        color: color,
      ),
      child: Center(
        child: Consumer(
          builder: (context, ref, child) {
            final categoryState = ref.watch(categoryStateProvider(initialState));
            return Wrap(
              spacing: 24,
              runSpacing: 36,
              children: [
                for (int i = 0; i < categoryState.length; i++)
                  CategoryButton(
                    check: categoryState[i],
                    index: i,
                    onTabIcon: ref.read(categoryStateProvider(initialState).notifier).toggleCategory,
                  )
              ],
            );
          },
        ),
      ),
    );
  }
}
