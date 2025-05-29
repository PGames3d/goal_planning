import 'package:flutter/material.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../gen/colors.gen.dart';
import '../../../utils/constants/ui_helpers.dart';
import 'goal_svg.dart';
import 'goal_text.dart';

class GoalNormalButton extends StatelessWidget {
  const GoalNormalButton({super.key,this.labelSize, this.color,this.labelWeight, this.labelColor, required this.onAction,this.isEnable = true, required this.label, this.width,this.height,this.isIconButton,this.iconColor,this.iconPath});
  final bool? isIconButton;
  final String? iconPath;
  final Function onAction;
  final Color? iconColor;
  final String label;
  final double? height;
  final double? width;
  final bool isEnable;
  final Color? color;
  final Color? labelColor;
  final FontWeight? labelWeight;
  final double? labelSize;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(UIHelpers.extraSmallPadding),
      onTap: !isEnable ? null : () {
        onAction.call();
      },
      child: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(UIHelpers.extraSmallPadding),
            color: isEnable? color ?? Theme.of(context).colorScheme.primary : color?.withOpacity(0.5) ?? Theme.of(context).colorScheme.primary.withOpacity(0.5)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(isIconButton??false)...[
              goalSvg(context,
                  path:iconPath ?? Assets.icons.phoneCall,
                  colorFilter:  ColorFilter.mode(
                      iconColor ?? ColorName.whiteColor, BlendMode.srcIn)),
              const SizedBox(
                width: UIHelpers.extraSmallPadding,
              ),
            ],
            GoalText(
              label,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: labelColor ?? ColorName.whiteColor, fontWeight: labelWeight, fontSize: labelSize),
            )
          ],
        ),
      ),
    );
  }
}
