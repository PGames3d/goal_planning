import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import '../../../application/app_routes.dart';

class NavigationService {
  NavigationService._();

  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  /// Get the AutoRouter instance safely
  static StackRouter? get _router {
    final context = navigatorKey.currentContext;
    if (context == null) return null;
    try {
      return AutoRouter.of(context);
    } catch (e) {
      debugPrint('AutoRouter not found: $e');
      return null;
    }
  }

  static Future<T?> goalPush<T>(BuildContext context, PageRouteInfo<dynamic> location) async {
    return _router?.push<T?>(location);
  }

  static void goalGo(BuildContext context, PageRouteInfo<dynamic> location) {
    _router?.navigate(location);
  }

  static Future<T?> goalPushNamed<T>(BuildContext context, String name) async {
    return _router?.pushNamed<T?>(name);
  }

  static void goalReplace(BuildContext context, PageRouteInfo<dynamic> location) {
    _router?.replace(location);
  }

  static void goalReplaceNamed(BuildContext context, String name) {
    _router?.replaceNamed(name);
  }

  static dynamic pop(BuildContext context, {bool? result, Map<String, dynamic>? resultMap}) {
    if (_router?.canPop() ?? false) {
      if (result != null) {
        return _router?.maybePop(result);
      } else if (resultMap != null) {
        return _router?.maybePop(resultMap);
      } else {
        return _router?.maybePop();
      }
    } else {
      goalPushNamed(context, AppRoutes.homePath);
      return null;
    }
  }

  static void goalReplaceAll(BuildContext context, PageRouteInfo<dynamic> location) {
    _router?.replaceAll([location]);
  }
}
