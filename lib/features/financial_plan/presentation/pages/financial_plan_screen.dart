import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goal_planning/core/extensions/localization_extension.dart';

import '../../../../core/presentation/widgets/app_bar/custom_sliver_app_bar.dart';
import '../../../../core/presentation/widgets/basic/drawer/mobile_drawer.dart';
import '../../../../core/presentation/widgets/basic/kia_normal_button.dart';
import '../../../../core/presentation/widgets/basic/kia_text.dart';
import '../../../../core/utils/constants/ui_helpers.dart';
import '../../../../core/utils/kia_responsive.dart';
import '../../../../gen/colors.gen.dart';
import '../bloc/financial_plan_bloc.dart';
@RoutePage()
class FinancialPlanScreen extends StatefulWidget {
  const FinancialPlanScreen({super.key});

  @override
  State<FinancialPlanScreen> createState() => _FinancialPlanScreenState();
}

class _FinancialPlanScreenState extends State<FinancialPlanScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController _customScrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FinancialPlanBloc(),
      child: BlocConsumer<FinancialPlanBloc, FinancialPlanState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            key: _scaffoldKey,
            drawer: MobileDrawer(
              scaffoldKey: _scaffoldKey,

            ),
            body: SafeArea(
              child: LayoutBuilder(
                builder: (ctx, constraints) {
                  return KiaResponsive(
                      mobile: Stack(
                        children: [
                          CustomScrollView(
                            controller: _customScrollController,
                            slivers: [
                              CustomSliverAppBar(
                                scaffoldKey: _scaffoldKey,
                                title: context.loc.billDetails,
                                isBack: true,
                                viewBillAction: (){

                                },
                              ),

                              ///bill details UI
                              SliverToBoxAdapter(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: UIHelpers.defaultPadding),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10)),
                                          border: Border.all(
                                              color: ColorName.lightGrey
                                                  .withOpacity(0.1),
                                              width: 2),
                                        ),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(
                                                  UIHelpers.smallPadding),
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                                children: [
                                                  KiaText(
                                                    "Koshaliya Kirana Store",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleSmall,
                                                  ),
                                                  KiaNormalButton(
                                                      isIconButton: true, label: context.loc.call, onAction: (){

                                                  }
                                                  )
                                                ],
                                              ),
                                            ),

                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: UIHelpers.smallPadding,
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ));
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
