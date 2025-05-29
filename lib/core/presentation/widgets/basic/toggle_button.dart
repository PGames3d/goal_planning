import '../../../../gen/colors.gen.dart';
import 'package:flutter/material.dart';

class GoalToggleButton extends StatelessWidget {
  ValueChanged<bool>? onChanged;
  bool? colorValue;

  GoalToggleButton({super.key, this.onChanged, this.colorValue = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Transform.scale(
          alignment: Alignment.center,
          scale: 0.7,
          child: Switch(
              activeColor: colorValue == true
                  ? ColorName.lightGreenButtonColor
                  : ColorName.redColor,
              inactiveTrackColor: ColorName.whiteColor,
              activeTrackColor: ColorName.whiteColor,
              trackOutlineColor: WidgetStateColor.resolveWith((states) =>
                  colorValue == true
                      ? ColorName.lightGreenButtonColor
                      : ColorName.redColor),
              inactiveThumbColor: ColorName.redColor,
              value: colorValue == false ? false : true,
              onChanged: onChanged),
        ),
      ],
    );
  }
}
