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
    resolver.next(true);

  }
}
