import 'package:flutter/material.dart';
import 'package:kias/application/app_router.dart';
import 'package:kias/core/data/services/locator.dart';
import 'package:kias/core/data/services/theme_service.dart';
import 'package:kias/core/extensions/localization_extension.dart';
import 'package:kias/core/presentation/widgets/basic/kia_cached_image_network.dart';
import 'package:kias/core/presentation/widgets/basic/kia_logo.dart';
import 'package:kias/core/presentation/widgets/basic/kia_svg.dart';
import 'package:kias/core/presentation/widgets/basic/kia_text.dart';
import 'package:kias/core/utils/common_utils.dart';
import 'package:kias/core/utils/enums/enums.dart';
import 'package:kias/core/utils/helper/user_data_helper.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../../gen/colors.gen.dart';
import '../../../../data/services/navigation_service.dart';
import '../../../../repository/secured_local_repository.dart';
import '../../../../utils/constants/app_constants.dart';
import '../../../../utils/constants/ui_helpers.dart';

class MobileDrawer extends StatefulWidget {
  const MobileDrawer({super.key, this.scaffoldKey});
  final GlobalKey<ScaffoldState>? scaffoldKey;
  @override
  State<MobileDrawer> createState() => _MobileDrawerState();
}

class _MobileDrawerState extends State<MobileDrawer> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Drawer(
      elevation: 3,
      backgroundColor: theme.cardColor,
      child: FutureBuilder<UserData>(
          future: CommonUtils.loadUserData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: KiaText("Error: ${snapshot.error}"));
          } else if (snapshot.hasData) {
            final loginModel = snapshot.data?.loginModel;
            final userType = snapshot.data!.userType;
            return ListView(
              children: [
                // Close button
                Padding(
                  padding: const EdgeInsets.only(
                    top: UIHelpers.mediumMargin,
                    right: UIHelpers.mediumMargin,
                  ),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(30),
                      onTap: () =>
                          widget.scaffoldKey?.currentState?.closeDrawer(),
                      child: const Icon(Icons.close),
                    ),
                  ),
                ),
                // Logo
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: UIHelpers.defaultMargin),
                  child: KiaLogo(height: 100),
                ),
                // Divider line
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: UIHelpers.defaultMargin),
                  child: Opacity(
                    opacity: 0.2,
                    child: Container(
                      height: 2,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary,
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                // Profile header
                Padding(
                  padding: const EdgeInsets.all(UIHelpers.defaultMargin),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: theme.colorScheme.primary.withOpacity(0.5),
                              blurRadius: 50.0,
                              spreadRadius: 3.0,
                            ),
                          ],
                        ),
                        child: KiaCachedImageNetwork(
                          height: 60,
                          width: 60,
                          fit: BoxFit.cover,
                          isCircular: true,
                          border: Border.all(color: ColorName.whiteColor,
                              width: 2,
                              strokeAlign: 1),
                          imageURL:
                          "https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg",
                        ),
                      ),
                      const SizedBox(width: UIHelpers.defaultMargin),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            KiaText(loginModel?.userDetail?.name??"",
                                style: theme.textTheme.titleMedium),
                            KiaText(loginModel?.userDetail?.code??"",
                                style: theme.textTheme.bodySmall),
                            KiaText(
                              userType.name.capitalizeFirst(),
                              style: theme.textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // Menu Items Section
                menuItem(
                  context,
                  title: context.loc.myProfile,
                  icon: Assets.icons.myProfile,
                  onAction: () =>
                      NavigationService.kiaPush(
                          context, const ProfileScreenRoute()),
                ),
                menuItem(
                  context,
                  title: context.loc.ledger,
                  icon: Assets.icons.ledger,
                  onAction: () =>
                      NavigationService.kiaPush(
                          context, const LedgerScreenRoute()),
                ),
                menuItem(
                  context,
                  title: context.loc.attendance,
                  icon: Assets.icons.attendance,
                  onAction: () =>
                      NavigationService.kiaPush(
                          context, const AttendanceScreenRoute()),
                ),
                FutureBuilder<List<Widget>>(
                  future: getPages(context, userType: userType),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Shimmer.fromColors(
                        baseColor: ColorName.greyColor,
                        highlightColor: ColorName.whiteColor,
                        child: Container(
                          height: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Center(child: KiaText("Error: ${snapshot.error}"));
                    } else if (snapshot.hasData) {
                      return Column(children: snapshot.data!);
                    } else {
                      return const Center(child: KiaText(
                          "No menu items available."));
                    }
                  },
                ),
                menuItem(
                  context,
                  title: context.loc.changePassword,
                  icon: Assets.icons.lock,
                  onAction: () =>
                      NavigationService.kiaPush(
                          context, const ChangePasswordScreenRoute()),
                ),
                menuItem(
                  context,
                  title: context.loc.share,
                  icon: Assets.icons.share,
                  onAction: () {
                    // Implement share action.
                  },
                ),
                menuItem(
                  context,
                  title: context.loc.settings,
                  icon: Assets.icons.settings,
                  onAction: () {
                    NavigationService.kiaPush(
                      context,
                      SettingsScreenRoute(
                          themeService: locator<ThemeService>()),
                    );
                  },
                ),
                menuItem(
                  context,
                  title: context.loc.logOut,
                  icon: Assets.icons.logout,
                  onAction: () async {
                    await CommonUtils.logout(context);
                  },
                ),
              ],
            );
          }
          return const Center(child: KiaText("No data available."));
        }
      ),
    );
  }


  Future<List<Widget>> getPages(BuildContext context, {required UserType userType}) async {
    switch (userType) {
      case UserType.salesman:
        return [
          menuItem(
            context,
            title: context.loc.activePaymentLinks,
            icon: Assets.icons.paymentLinks,
            onAction: () => NavigationService.kiaPush(context, const ActivePaymentLinkScreenRoute()),
          ),
        ];
      case UserType.godownkeeper:
        return [
          menuItem(
            context,
            title: context.loc.finalizedRef,
            icon: Assets.icons.finalizeRef,
            onAction: () => NavigationService.kiaPush(context,  FinalizedReferenceScreenRoute(isFromDrawer: true)),
          ),
          menuItem(
            context,
            title: context.loc.paidRef,
            icon: Assets.icons.recent,
            onAction: () => NavigationService.kiaPush(context,  PaidReferenceScreenRoute(isFromDrawer: true)),
          ),
        ];
      case UserType.owner:
        return [];
      case UserType.deliveryman:
        return [
          menuItem(
            context,
            title: context.loc.activePaymentLinks,
            icon: Assets.icons.paymentLinks,
            onAction: () => NavigationService.kiaPush(context, const ActivePaymentLinkScreenRoute()),
          ),
        ];
      case UserType.seniorManager:
        return [
          menuItem(
            context,
            title: context.loc.finalizedRef,
            icon: Assets.icons.newSupply,
            onAction: () => NavigationService.kiaPush(context,  FinalizedReferenceScreenRoute(isFromDrawer: true)),
          ),
          menuItem(
            context,
            title: context.loc.paidRef,
            icon: Assets.icons.recent,
            onAction: () => NavigationService.kiaPush(context,  PaidReferenceScreenRoute(isFromDrawer: true)),
          ),
        ];
      case UserType.manager:
      case UserType.cashier:
      return [
        menuItem(
          context,
          title: context.loc.finalizedRef,
          icon: Assets.icons.newSupply,
          onAction: () => NavigationService.kiaPush(context,  FinalizedReferenceScreenRoute(isFromDrawer: true)),
        ),
        menuItem(
          context,
          title: context.loc.paidRef,
          icon: Assets.icons.recent,
          onAction: () => NavigationService.kiaPush(context,  PaidReferenceScreenRoute(isFromDrawer: true)),
        ),
      ];
      case UserType.supplyManager:
        return [
          menuItem(
            context,
            title: context.loc.addVehicle,
            icon: Assets.icons.vehicle,
            onAction: () => NavigationService.kiaPush(context,  FinalizedReferenceScreenRoute(isFromDrawer: true)),
          ),
        ];
      case UserType.admin:
      case UserType.accountant:
        return [];
    }
  }

  ListTile menuItem(
      BuildContext context, {
        required String title,
        required String icon,
        double height = 24,
        double width = 24,
        required Function() onAction,
      }) {
    return ListTile(
      dense: true,
      title: KiaText(title, style: Theme.of(context).textTheme.titleMedium),
      leading: Padding(
        padding: const EdgeInsets.only(left: UIHelpers.defaultMargin),
        child: SizedBox(
          height: height,
          width: width,
          child: kiaSvg(context, path: icon, isSelected: true),
        ),
      ),
      onTap: onAction,
    );
  }
}
