
import '../../../../gen/colors.gen.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/ui_helpers.dart';

class GoalPopupMenuButton extends StatelessWidget {
  final List<String> menuItems;
  final List<String> menuTexts;
  final Function(String)? onSelected;
  final Widget? iconWidget;
  final Offset? offSet;

  const GoalPopupMenuButton({
    super.key,
    required this.menuItems,
    this.offSet,
    this.iconWidget,
    required this.menuTexts,
    this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: iconWidget,
      itemBuilder: (BuildContext context) {
        return List.generate(menuItems.length, (index) {
          return PopupMenuItem<String>(
            value: menuItems[index],
            height: UIHelpers.defaultMargin,
            child: SizedBox(
              width: 140,
              child: Text(
                menuTexts[index],
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(fontWeight: FontWeight.w500),
              ),
            ),
          );
        });
      },
      elevation: 1,
      color: ColorName.whiteColor,
      offset: offSet ?? const Offset(-20, 30),

      /// left side value will adjust right to left alignment and right side value will adjust top to bottom
      onSelected: onSelected,
    );
  }
}
