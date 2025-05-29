
import 'package:flutter/material.dart';
import 'package:kias/core/utils/is_null_or_empty.dart';

class KeyboardDismisser extends StatelessWidget {
  const KeyboardDismisser({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.dismissKeyBoard,
      child: child,
    );
  }
}
