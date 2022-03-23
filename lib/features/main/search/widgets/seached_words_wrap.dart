import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo_flutter/provider/recent_searched_data.dart';
import 'package:momo_flutter/resources/app_error_strings.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:momo_flutter/widgets/card/empty_item_card.dart';

class SearchedWordsWrap extends ConsumerWidget {
  const SearchedWordsWrap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchedWords = ref.watch(searchedDataStateProvider).words;

    if (searchedWords.isEmpty) {
      return const Padding(
        padding: EdgeInsets.only(top: 40),
        child: EmptyItemCard(AppErrorString.recentWordsEmpty),
      );
    }
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: List.generate(
        searchedWords.length,
        (index) => _SearchedWordCard(
          word: searchedWords[index],
        ),
      ),
    );
  }
}

class _SearchedWordCard extends StatelessWidget {
  const _SearchedWordCard({
    Key? key,
    required this.word,
  }) : super(key: key);

  final String word;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      width: 14.0 * word.length + 56,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(offset: Offset(0, 0.3)),
        ],
        color: AppColors.gray0,
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              word,
              style: AppStyles.regular14,
            ),
            Consumer(
              builder: (context, ref, child) {
                return InkWell(
                  onTap: () => ref.read(searchedDataStateProvider.notifier).deleteSearchedWord(word),
                  child: const Icon(
                    CupertinoIcons.xmark,
                    color: AppColors.gray4,
                    size: 16,
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
