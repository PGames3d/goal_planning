import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/constants/ui_helpers.dart';
import '../../../../gen/assets.gen.dart';

class KiaLogo extends StatelessWidget {
  double? height = UIHelpers.extralargeIconHeight;
  double? width = UIHelpers.extralargeIconHeight;
  BoxFit? fit;
  KiaLogo(
      {super.key,
      this.width = UIHelpers.extralargeIconHeight,
      this.height = UIHelpers.extralargeIconHeight,
      this.fit = BoxFit.fill});
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Assets.images.logo.path,
      height: height,
      width: width,
      fit: fit!,
    );
  }
}
