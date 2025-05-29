import 'package:kias/gen/colors.gen.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/ui_helpers.dart';

class KiaIconElevatedButton extends StatelessWidget {
  const KiaIconElevatedButton(
      {required this.buttonText,
      super.key,
      this.color,
      this.action,
      this.buttonWidth,
      this.buttonHeight = 36,
      this.isTextButton = false,
      this.shapeSize = UIHelpers.defaultButtonRadius,
      this.icon});

  const KiaIconElevatedButton.flat(
      {required this.buttonText,
      super.key,
      this.action,
      this.buttonWidth,
      this.buttonHeight = 47,
      this.icon})
      : isTextButton = true,
        color = null,
        shapeSize = null;

  final String buttonText;
  final Color? color;
  final VoidCallback? action;
  final bool isTextButton;
  final double? buttonWidth;
  final double? buttonHeight;
  final double? shapeSize;
  final Icon? icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: buttonHeight, width: buttonWidth, child: _getButton(context));
  }

  Widget _getButton(BuildContext context) {
    return isTextButton
        ? TextButton(
            onPressed: action,
            child: Text(buttonText,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: ColorName.blackColor, fontWeight: FontWeight.w700)))
        : FilledButton.icon(
            icon: icon ?? const SizedBox(),
            style: FilledButton.styleFrom(
                // padding: EdgeInsets.zero,
                backgroundColor: color,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      (shapeSize ?? UIHelpers.defaultButtonRadius)),
                )),
            onPressed: action,
            label: Text(
              buttonText,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: ColorName.blackColor, fontWeight: FontWeight.w700),
            ),
          );
  }
}
