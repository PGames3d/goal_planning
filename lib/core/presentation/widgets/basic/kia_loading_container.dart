import 'package:flutter/material.dart';

import 'loading_container.dart';

class KiaLoadingContainer extends StatelessWidget {
  const KiaLoadingContainer({
    super.key,
    required this.isLoading,
    required this.child,
    required this.isCenter,
    this.backgroundColor,
  });

  final bool isLoading;
  final Widget child;
  final bool isCenter;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: !isLoading,
      onPopInvoked: (bool didPop) {
        if (didPop) {
          return;
        }
      },
      child: LoadingContainer(
        isLoading: isLoading,
        loaderWidget: _Loader(backgroundColor: backgroundColor),
        child: isCenter
            ? Align(alignment: Alignment.center, child: child)
            : Align(alignment: Alignment.topCenter, child: child),
      ),
    );
  }
}

class _Loader extends StatelessWidget {
  const _Loader({this.backgroundColor});
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      child: Container(
        color: backgroundColor,
        child: Center(
          child: SizedBox.fromSize(
            size: const Size.square(48),
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).colorScheme.primary),
            ),
          ),
        ),
      ),
    );
  }
}
