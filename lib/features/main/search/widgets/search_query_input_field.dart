import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo_flutter/features/main/search/provider/search_result_provider.dart';
import 'package:momo_flutter/features/main/search/widgets/search_filter_bottom_sheet.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:momo_flutter/utils/load_asset.dart';

class SearchQueryInputField extends StatelessWidget {
  const SearchQueryInputField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 44,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [BoxShadow()],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SearchFilterBottomSheet(),
                ),
              );
            },
            child: loadAsset(AppIcons.filter),
          ),
          SizedBox(
            height: 44,
            width: 240,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: '검색어를 입력하세요',
                ),
              ),
            ),
          ),
          Consumer(
            builder: (context, ref, child) {
              return InkWell(
                onTap: () => ref.read(isSearchedProvider.state).state = true,
                child: loadAsset(AppIcons.search),
              );
            },
          ),
        ],
      ),
    );
  }
}
