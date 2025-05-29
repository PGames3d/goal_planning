import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../gen/colors.gen.dart';
Widget goalSvg(BuildContext context, {
  required String path,
  bool? isSelected,
  double? height,
  double? width,
  BoxFit? boxFit,
  ColorFilter? colorFilter,
  bool? isWithoutFilter,
}) {
  // Get the theme's brightness
  var themeBrightness = Theme.of(context).brightness;

  // If the item is selected, decide color based on theme brightness
  Color filterColor = (isSelected ?? false)
      ? (themeBrightness == Brightness.dark
      ? ColorName.whiteColor
      : Theme.of(context).colorScheme.primary)
      : ColorName.lightGrey;

  if(isWithoutFilter ?? false){
    return SvgPicture.asset(
      path,
      height: height,
      width: width,
      fit: boxFit ?? BoxFit.none,
    );
  }else{
    // if (defaultTargetPlatform == TargetPlatform.android) {
    //   // Recreate AndroidView when theme color changes
    //   final viewKey = ValueKey("$path-${filterColor.value}");
    //   return SizedBox(
    //     height: height ?? 24,
    //     width: width ?? 24,
    //     child: AbsorbPointer(
    //       child: AndroidView(
    //         key: viewKey,
    //         viewType: 'vector_view',
    //         creationParams: {
    //           'drawable': _extractFileName(path),
    //           'color': _colorToHex(filterColor),
    //           'width': width ?? 24,
    //           'height': height ?? 24,
    //         },
    //         creationParamsCodec: const StandardMessageCodec(),
    //       ),
    //     ),
    //   );
    // }



    return SvgPicture.asset(
      path,
      height: height,
      width: width,
      fit: boxFit ?? BoxFit.none,
      colorFilter:colorFilter ?? ColorFilter.mode(filterColor, BlendMode.srcIn),
    );


  }

}


String _extractFileName(String fullPath) {
  final lastSegment = fullPath.split('/').last;         // allocation.svg
  final nameWithoutExtension = lastSegment.split('.').first; // allocation
  return nameWithoutExtension;
}


String _colorToHex(Color color) {
  return '#${color.value.toRadixString(16).padLeft(8, '0').toUpperCase()}';
}

