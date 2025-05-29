import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../core/data/services/navigation_service.dart';
import '../core/data/services/theme_service.dart';
import '../core/utils/auth_guards.dart';
import '../features/active_payment_link/presentation/active_payment_link_screen.dart';
import '../features/add_hisab/presentation/add_hisab_screen.dart';
import '../features/allocation_details/presentation/allocation_details_screen.dart';
import '../features/approvals/presentation/approvals_screen.dart';
import '../features/attendance/presentation/attendance_screen.dart';
import '../features/bill_details/presentation/bill_details_screen.dart';
import '../features/bill_history/presentation/bill_history_screen.dart';
import '../features/bill_notation/presentation/bill_notation_screen.dart';
import '../features/change_password/presentation/change_password_screen.dart';
import '../features/check_in_hand/presentation/check_in_hand_screen.dart';
import '../features/distributor/presentation/distributor_screen.dart';
import '../features/export_ledger/presentation/export_ledger_screen.dart';
import '../features/finalized_reference/presentation/finalized_reference_screen.dart';
import '../features/forgot_password/presentation/forgot_password_screen.dart';
import '../features/godown_allocation_details/presentation/godown_allocation_details_screen.dart';
import '../features/godown_bill_details/presentation/godown_bill_details_screen.dart';
import '../features/new_reference/presentation/new_reference_screen.dart';
import '../features/owner_bill_details/presentation/owner_bill_details_screen.dart';
import '../features/home/presentation/home_screen.dart';
import '../features/ledger/presentation/ledger_screen.dart';
import '../features/login/presentation/login_screen.dart';
import '../features/paid_reference/presentation/paid_reference_screen.dart';
import '../features/past_allocation/presentation/past_allocation_screen.dart';
import '../features/past_allocation_details/presentation/past_allocation_details_screen.dart';
import '../features/profile/presentation/profile_screen.dart';
import '../features/recent_bills/presentation/recent_bills_screen.dart';
import '../features/sales_return/presentation/sr_screen.dart';
import '../features/security/presentation/security_screen.dart';
import '../features/settings/presentation/settings_screen.dart';
import '../features/view_bill/presentation/view_bill_screen.dart';
import '../features/view_hisab/presentation/view_hisab_screen.dart';
import '../features/past_sales_return/presentation/past_sr_screen.dart';
import '../features/no_internet/presentation/no_internet_screen.dart';
import '../features/owner_salesman_selection/presentation/owner_salesman_selection_screen.dart';
import '../features/outstanding/presentation/outstanding_screen.dart';
import '../features/reference_details/presentation/reference_details_screen.dart';
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
        path: AppRoutes.homePath,
        page: ChangePasswordScreenRoute.page,
        guards: [AuthGuard()],
      // initial: true
        ),
    AutoRoute(
        path: AppRoutes.explorePath,
        page: ForgotPasswordScreenRoute.page,
        guards: [AuthGuard()],
        // initial: true
        ),

    AutoRoute(
        path: AppRoutes.myDhanPath,
        page: HomeScreenRoute.page,
        guards: [AuthGuard()],
        // initial: true
        ),

   AutoRoute(
        path: AppRoutes.financialPlanPath,
        page: FinancialPlanScreenRoute.page,
        guards: [AuthGuard()],
        // initial: true
        ),

    RedirectRoute(path: '*', redirectTo: AppRoutes.loginPath),
      ];
}

// -> flutter pub get
// -> flutter packages pub run build_runner watch --delete-conflicting-outputs (It will remain watching if there are any changes in this file)
// -> flutter packages pub run build_runner build --delete-conflicting-outputs (It will run only once and exit after completion)
// ->flutter run -d chrome --web-browser-flag "--disable-web-security"
