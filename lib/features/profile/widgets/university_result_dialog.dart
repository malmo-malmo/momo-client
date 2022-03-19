import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo_flutter/features/profile/provider/profile_update_provider.dart';
import 'package:momo_flutter/features/profile/provider/university_result_provider.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:momo_flutter/widgets/card/empty_item_card.dart';
import 'package:momo_flutter/widgets/card/error_card.dart';
import 'package:momo_flutter/widgets/indicator/loading_indicator.dart';

class UniversityResultDialog extends ConsumerWidget {
  const UniversityResultDialog(this.universityName, {Key? key}) : super(key: key);

  final String universityName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final universityResult = ref.watch(universityResultProvider(universityName));
    return Dialog(
      insetPadding: const EdgeInsets.all(0),
      child: SizedBox(
        height: 328,
        width: 280,
        child: Padding(
          padding: const EdgeInsets.only(top: 32),
          child: universityResult.when(
            loading: () => const LoadingIndicator(),
            error: (error, stack) => const ErrorCard(),
            data: (data) {
              final _checks = ref.watch(universityCheckProvider(data.length));
              return data.isEmpty
                  ? const EmptyItemCard(AppStrings.emptyUniversity)
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32),
                          child: Text(
                            '검색결과 (${data.length})',
                            style: AppStyles.bold16,
                          ),
                        ),
                        const SizedBox(height: 13),
                        SizedBox(
                          height: 192,
                          child: Scrollbar(
                            isAlwaysShown: true,
                            child: ListView.builder(
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () => ref.read(universityCheckProvider(data.length).notifier).checkOne(index),
                                  child: Container(
                                    height: 48,
                                    padding: const EdgeInsets.only(left: 32, top: 16),
                                    color: _checks[index] ? AppColors.purple : AppColors.backgroundWhite,
                                    child: Text(
                                      data[index],
                                      style: AppStyles.regular16.copyWith(
                                        color: _checks[index] ? AppColors.gray0 : null,
                                      ),
                                    ),
                                  ),
                                );
                              },
                              itemCount: data.length,
                            ),
                          ),
                        ),
                        const Spacer(),
                        SizedBox(
                          height: 56,
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: _checks.indexWhere((element) => element) != -1
                                ? () {
                                    ref
                                        .read(profileUpdateStateProvider.notifier)
                                        .setUserUniversity(data[_checks.indexWhere((element) => element)]);
                                    Navigator.pop(
                                      context,
                                      data[_checks.indexWhere((element) => element)],
                                    );
                                  }
                                : null,
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ),
                                ),
                              ),
                            ),
                            child: const Text(AppStrings.confirm),
                          ),
                        ),
                      ],
                    );
            },
          ),
        ),
      ),
    );
  }
}
