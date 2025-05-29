
import 'package:flutter/material.dart';

import '../../../../gen/colors.gen.dart';
import '../../../utils/constants/ui_helpers.dart';
import 'goal_text.dart';

class GoalButton extends StatelessWidget {
  const GoalButton({
    required this.buttonText,
    this.shape,
    super.key,
    this.color,
    this.action,
    this.buttonWidth,
    this.buttonHeight = 38,
    this.isTextButton = false,
    this.shapeSize = UIHelpers.defaultButtonRadius,
    this.horizontalPadding,
    this.iconButton = false,
    this.icon,
    this.textColor,
  });

  const GoalButton.flat({
    required this.buttonText,
    super.key,
    this.action,
    this.buttonWidth,
    this.buttonHeight = 38,
    this.horizontalPadding,
    this.iconButton = false,
    this.icon,
    this.textColor,
  })  : isTextButton = true,
        color = null,
        shape = null,
        shapeSize = null;

  final String buttonText;
  final bool iconButton;
  final Icon? icon;
  final Color? color;
  final VoidCallback? action;
  final bool isTextButton;
  final double? buttonWidth;
  final double? buttonHeight;
  final double? shapeSize;
  final double? horizontalPadding;
  final OutlinedBorder? shape;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: buttonHeight, width: buttonWidth, child: _getButton(context));
  }

  Widget _getButton(BuildContext context) {
    return isTextButton
        ? TextButton(
            onPressed: action,
            child: Text(
              buttonText,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(color: color ?? ColorName.blackColor),
            ))
        : iconButton
            ? GestureDetector(
                onTap: action,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: horizontalPadding ?? 15),
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(
                        (shapeSize ?? UIHelpers.defaultButtonRadius)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      icon ?? const Icon(Icons.add),
                      const SizedBox(
                        width: 4,
                      ),
                      GoalText(
                        buttonText,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: ColorName.blackColor,
                            fontWeight: FontWeight.w700),
                      ),
                      // Text(
                      //   buttonText,
                      //   style:  const TextStyle(color:  ColorName.blackColor,fontWeight: FontWeight.w700),
                      // ),
                    ],
                  ),
                ),
              )
            : FilledButton(
                style: FilledButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                        horizontal: horizontalPadding ?? 15),
                    backgroundColor: color,
                    shape: shape ??
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              (shapeSize ?? UIHelpers.defaultButtonRadius)),
                        )),
                onPressed: action,
                child: GoalText(
                  buttonText,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: textColor ?? ColorName.blackColor,
                      fontWeight: FontWeight.w700),
                ),
                // child: Text(
                //   buttonText,
                //   style:  TextStyle(color:  ColorName.blackColor,fontWeight: FontWeight.w700),
                // ),
              );
  }
}
