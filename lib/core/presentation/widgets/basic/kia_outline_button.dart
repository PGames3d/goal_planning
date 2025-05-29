import 'package:flutter/material.dart';

import '../../../utils/constants/ui_helpers.dart';

class KiaOutLineButton extends StatelessWidget {
  const KiaOutLineButton(
      {required this.buttonText,
      super.key,
      this.color,
      this.action,
      this.buttonWidth,
      this.buttonHeight = 47,
      this.isTextButton = false,
      this.shapeSize = UIHelpers.defaultButtonRadius,
      this.horizontalPadding});

  const KiaOutLineButton.flat(
      {required this.buttonText,
      super.key,
      this.action,
      this.buttonWidth,
      this.buttonHeight = 47,
      this.horizontalPadding})
      : isTextButton = true,
        color = null,
        shapeSize = null;

  final String buttonText;
  final Color? color;
  final VoidCallback? action;
  final bool isTextButton;
  final double? buttonWidth;
  final double? horizontalPadding;
  final double? buttonHeight;
  final double? shapeSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: buttonHeight, width: buttonWidth, child: _getButton());
  }

  Widget _getButton() {
    return isTextButton
        ? TextButton(onPressed: action, child: Text(buttonText))
        : OutlinedButton(
            style: FilledButton.styleFrom(
                padding:
                    EdgeInsets.symmetric(horizontal: horizontalPadding ?? 15),
                backgroundColor: color,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      (shapeSize ?? UIHelpers.defaultButtonRadius)),
                )),
            onPressed: action,
            child: Text(buttonText),
          );
  }
}
