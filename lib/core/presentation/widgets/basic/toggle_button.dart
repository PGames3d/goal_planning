import 'package:kias/gen/colors.gen.dart';
import 'package:flutter/material.dart';

class KiaToggleButton extends StatelessWidget {
  ValueChanged<bool>? onChanged;
  bool? colorValue;

  KiaToggleButton({super.key, this.onChanged, this.colorValue = false});

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
