import 'package:flutter/material.dart';

enum AnimatedVisibilityAnimationOrientation { horizontal, vertical }

class AnimatedVisibility extends StatelessWidget {
  const AnimatedVisibility({
    super.key,
    required this.child,
    required this.visible,
    this.orientation,
    this.duration = const Duration(milliseconds: 500),
    this.curve = Curves.fastOutSlowIn,
  });

  static Widget withTicker({
    required Widget child,
    required bool visible,
    AnimatedVisibilityAnimationOrientation? orientation,
    Duration duration = const Duration(milliseconds: 500),
    Curve curve = Curves.fastOutSlowIn,
  }) =>
      _AutoTickerProvider(
        visible: visible,
        orientation: orientation,
        duration: duration,
        curve: curve,
        child: child,
      );

  final Widget child;
  final bool visible;
  final AnimatedVisibilityAnimationOrientation? orientation;
  final Duration duration;
  final Curve curve;

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: duration,
      curve: curve,
      child: visible ? child : _buildAnimationOrientation(),
    );
  }

  Widget _buildAnimationOrientation() {
    final AnimatedVisibilityAnimationOrientation? orientation =
        this.orientation;
    if (orientation != null) {
      switch (orientation) {
        case AnimatedVisibilityAnimationOrientation.horizontal:
          return const SizedBox(height: double.infinity);
        case AnimatedVisibilityAnimationOrientation.vertical:
          return const SizedBox(width: double.infinity);
      }
    } else {
      return const SizedBox.shrink();
    }
  }
}

class _AutoTickerProvider extends StatefulWidget {
  const _AutoTickerProvider({
    required this.child,
    required this.visible,
    this.orientation,
    this.duration = const Duration(milliseconds: 500),
    this.curve = Curves.fastOutSlowIn,
  });

  final Widget child;
  final bool visible;
  final AnimatedVisibilityAnimationOrientation? orientation;
  final Duration duration;
  final Curve curve;

  @override
  __AutoTickerProviderState createState() => __AutoTickerProviderState();
}

class __AutoTickerProviderState extends State<_AutoTickerProvider>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return AnimatedVisibility(
      visible: widget.visible,
      orientation: widget.orientation,
      duration: widget.duration,
      curve: widget.curve,
      child: widget.child,
    );
  }
}
