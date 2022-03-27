import 'package:flutter/material.dart';
import 'package:momo_flutter/widgets/indicator/step_indicator.dart';

class FullImagePageViewArg {
  final int initialPage;
  final List<String> images;

  FullImagePageViewArg({
    required this.initialPage,
    required this.images,
  });
}

class FullImagePageView extends StatefulWidget {
  const FullImagePageView(
    this.arg, {
    Key? key,
  }) : super(key: key);

  static const routeName = 'FullImagePageView';

  final FullImagePageViewArg arg;

  @override
  State<FullImagePageView> createState() => _FullImagePageViewState();
}

class _FullImagePageViewState extends State<FullImagePageView> {
  late PageController _controller = PageController(initialPage: widget.arg.initialPage);
  late int _currentPage = widget.arg.initialPage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              onPageChanged: (index) => setState(() => _currentPage = index),
              itemBuilder: (context, index) => Image.network(
                widget.arg.images[index],
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.contain,
              ),
              itemCount: widget.arg.images.length,
            ),
          ),
          StepIndicator(
            currentIndex: _currentPage,
            length: widget.arg.images.length,
          ),
        ],
      ),
    );
  }
}
