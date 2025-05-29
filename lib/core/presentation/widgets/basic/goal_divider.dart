import 'package:flutter/material.dart';

import '../../../utils/constants/ui_helpers.dart';

class GoalDivider extends StatelessWidget {
  final double? height;
  final double? thickness;
  final Color? color;
  const GoalDivider({super.key, this.height, this.thickness, this.color});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: height ?? UIHelpers.dividerHeight,
      thickness: thickness ?? 1,
      color: color,
    );
  }
}
