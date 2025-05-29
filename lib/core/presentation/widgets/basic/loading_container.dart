import 'package:flutter/material.dart';

class LoadingContainer extends StatelessWidget {
  const LoadingContainer({
    super.key,
    required this.isLoading,
    required this.child,
    this.loaderWidget = const SizedBox.shrink(),
  });

  final bool isLoading;
  final Widget child;
  final Widget loaderWidget;

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      child,
      if (isLoading)
        Positioned.fill(
            child: Align(alignment: Alignment.center, child: loaderWidget)),
    ]);
  }
}
