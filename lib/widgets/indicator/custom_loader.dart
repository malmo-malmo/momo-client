import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo_flutter/provider/loading_provider.dart';
import 'package:momo_flutter/widgets/indicator/loading_indicator.dart';

const customLoader = [
  CustomOpacity(),
  CustomLoader(),
];

class CustomOpacity extends StatelessWidget {
  const CustomOpacity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final loading = ref.watch(loadingProvider);
        if (loading) {
          return Opacity(
            opacity: 0.5,
            child: Container(
              color: Colors.black,
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}

class CustomLoader extends StatelessWidget {
  const CustomLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final loading = ref.watch(loadingProvider);
        if (loading) {
          return const LoadingIndicator();
        }
        return const SizedBox();
      },
    );
  }
}
