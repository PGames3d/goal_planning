import 'package:auto_route/auto_route.dart';

import '../core/data/services/navigation_service.dart';
import '../core/utils/auth_guards.dart';
import '../features/explore/presentation/pages/explore_screen.dart';
import '../features/financial_plan/presentation/pages/financial_plan_screen.dart';
import '../features/home/presentation/pages/home_screen.dart';
import '../features/my_dhan/presentation/pages/my_dhan_screen.dart';
import '../features/main_navigation/presentation/pages/main_navigation_screen.dart';
import 'app_routes.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Page,Route')
class AppRouter extends RootStackRouter {
  AppRouter() : super(navigatorKey: NavigationService.navigatorKey);
  @override
  List<AutoRoute> get routes => [
        //HomeScreen is generated as HomeRoute because
        //of the replaceInRouteName property
        // AutoRoute(
        //     path: AppRoutes.loginPath,
        //     page: LoginScreenRoute.page,
        //     // guards: [AuthGuard()],
        //     keepHistory: false,
        //     initial: false),

    AutoRoute(
      path: AppRoutes.mainNavigationPath,
      page: MainNavigationScreenRoute.page,
      guards: [AuthGuard()],
      initial: true
    ),

    AutoRoute(
        path: AppRoutes.homePath,
        page: HomeScreenRoute.page,
        guards: [AuthGuard()],
      // initial: true
        ),
    AutoRoute(
        path: AppRoutes.explorePath,
        page: ExploreScreenRoute.page,
        guards: [AuthGuard()],
        // initial: true
        ),

    AutoRoute(
        path: AppRoutes.myDhanPath,
        page: MyDhanScreenRoute.page,
        guards: [AuthGuard()],
        // initial: true
        ),

   AutoRoute(
        path: AppRoutes.financialPlanPath,
        page: FinancialPlanScreenRoute.page,
        guards: [AuthGuard()],
        // initial: true
        ),

    RedirectRoute(path: '*', redirectTo: AppRoutes.homePath),
      ];
}

// -> flutter pub get
// -> flutter packages pub run build_runner watch --delete-conflicting-outputs (It will remain watching if there are any changes in this file)
// -> flutter packages pub run build_runner build --delete-conflicting-outputs (It will run only once and exit after completion)
// ->flutter run -d chrome --web-browser-flag "--disable-web-security"
