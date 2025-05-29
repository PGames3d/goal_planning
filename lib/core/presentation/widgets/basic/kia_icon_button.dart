import 'package:flutter/material.dart';

import '../../../utils/constants/ui_helpers.dart';

class KiaIconButton extends StatelessWidget {
  const KiaIconButton(
      {super.key,
      required this.icon,
      required this.onPressed,
      this.color,
      this.iconSize = 24,
      this.splashRadius,
      this.hasBadge = false,
      this.tooltip,
      this.hasBorder = false,
      this.borderColor,
      this.shapeSize = UIHelpers.defaultButtonRadius});

  final IconData icon;
  final VoidCallback onPressed;
  final Color? color;
  final double iconSize;
  final double? splashRadius;
  final bool hasBadge;
  final String? tooltip;
  final bool hasBorder;
  final Color? borderColor;
  final double? shapeSize;

  @override
  Widget build(BuildContext context) {
    //wrapped icon button with material components to bring splash effect upfront
    return Material(
      type: MaterialType.transparency,
      child: IconButton(
        tooltip: tooltip,
        constraints: BoxConstraints(minHeight: iconSize, minWidth: iconSize),
        onPressed: onPressed,
        iconSize: iconSize,
        splashRadius: splashRadius ?? (iconSize / 2),
        icon: Icon(
          icon,
          color: color ?? Theme.of(context).iconTheme.color,
        ),
      ),
    );
  }
}
