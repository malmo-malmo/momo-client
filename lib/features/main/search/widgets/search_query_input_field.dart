import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo_flutter/features/main/search/provider/search_result_provider.dart';
import 'package:momo_flutter/features/main/search/widgets/search_filter_bottom_sheet.dart';
import 'package:momo_flutter/provider/recent_searched_data.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:momo_flutter/utils/load_asset.dart';

class SearchQueryInputField extends StatefulWidget {
  const SearchQueryInputField({
    Key? key,
    required this.refresh,
  }) : super(key: key);

  final Function refresh;

  @override
  State<SearchQueryInputField> createState() => _SearchQueryInputFieldState();
}

class _SearchQueryInputFieldState extends State<SearchQueryInputField> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 44,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.gray0,
        boxShadow: const [
          BoxShadow(offset: Offset(0, 0.3)),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchFilterBottomSheet(
                    refresh: widget.refresh,
                  ),
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
              child: Consumer(
                builder: (context, ref, child) {
                  return TextFormField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: '검색어를 입력하세요',
                    ),
                    onChanged: (value) => ref.read(searchQueryProvider.state).state = value,
                  );
                },
              ),
            ),
          ),
          const Spacer(),
          Consumer(
            builder: (context, ref, child) {
              return InkWell(
                onTap: () {
                  FocusScope.of(context).unfocus();
                  ref.read(searchResultListProvider.notifier).reset();
                  widget.refresh();
                  ref.read(isSearchedProvider.state).state = true;
                  ref.read(searchedDataStateProvider.notifier).addSearchedWord(_controller.text);
                },
                child: loadAsset(AppIcons.search),
              );
            },
          ),
        ],
      ),
    );
  }
}
