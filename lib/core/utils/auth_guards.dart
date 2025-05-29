import 'package:auto_route/auto_route.dart';

import '../../application/app_router.dart';
import '../../application/app_routes.dart';
import '../data/services/locator.dart';
import '../repository/secured_local_repository.dart';
import 'constants/app_constants.dart';

class AuthGuard extends AutoRouteGuard {
  AuthGuard();

  @override
  Future<void> onNavigation(
      NavigationResolver resolver, StackRouter router) async {
    /// Fetch stored user authentication data **without unnecessary `await` delays**
    final securedLocalRepo = locator<SecuredLocalRepository>();
    final Future<bool> isLoggedInFuture = securedLocalRepo.getBool(AppConstants.isLogin);
    final Future<String?> distributorCodeFuture = securedLocalRepo.getString(AppConstants.distributorCode);

    /// Simultaneously fetch data instead of waiting sequentially
    final List<dynamic> results = await Future.wait([isLoggedInFuture, distributorCodeFuture]);
    final bool loggedIn = results[0] as bool;
    final String distributorCode = results[1] as String? ?? "";

    final bool isAuthRoute = resolver.route.path == AppRoutes.loginPath ||
        resolver.route.path == AppRoutes.distributorPath;
    final bool isForgotPwd = resolver.route.path == AppRoutes.forgotPwdPath;

    if (distributorCode.isNotEmpty) {
      if (!loggedIn) {
        if (isForgotPwd) {
          resolver.next(true);
          return;
        }else if (isAuthRoute) {
          resolver.redirect(const LoginScreenRoute());
          return;
        }
      } else { // loggedIn is true
        if (isAuthRoute) {
          // TODO: For production, you might consider redirecting to SecurityScreenRoute.
          resolver.redirect(const HomeScreenRoute());
          // resolver.redirect(const SecurityScreenRoute());
          return;
        }
      }
    }

// Proceed if already logged in or if on an authentication route
    resolver.next(loggedIn || isAuthRoute);

  }
}
