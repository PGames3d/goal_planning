import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class KiaResponsive extends StatelessWidget {
  const KiaResponsive({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
  });

  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 850;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width <= 1200 &&
      MediaQuery.of(context).size.width >= 850;

  static bool isTabletLandscape(BuildContext context) =>
      MediaQuery.of(context).size.shortestSide <= 1200 &&
      MediaQuery.of(context).size.shortestSide >= 850 &&
      MediaQuery.of(context).size.width > MediaQuery.of(context).size.height;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width > 1200;

  static bool showSideDrawer(BuildContext context) {
    return KiaResponsive.isMobile(context) ||
        KiaResponsive.isTablet(context);
  }

  static bool isPlatformMobile() {
    return !kIsWeb;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    // If our width is more than 1100 then we consider it a desktop
    if (size.width >= 1100) {
     return desktop ?? mobile;

    }
    // If width it less then 1100 and more then 850 we consider it as tablet
     else if (size.width >= 850) {
     return tablet ?? mobile;
    }
    // Or less then that we called it mobile
    else {
      return mobile;
    }
  }
}
