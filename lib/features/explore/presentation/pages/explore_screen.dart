import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goal_planning/core/extensions/localization_extension.dart';

import '../../../../core/presentation/widgets/app_bar/custom_sliver_app_bar.dart';
import '../../../../core/presentation/widgets/basic/drawer/mobile_drawer.dart';
import '../../../../core/presentation/widgets/basic/goal_normal_button.dart';
import '../../../../core/presentation/widgets/basic/goal_text.dart';
import '../../../../core/utils/constants/ui_helpers.dart';
import '../../../../core/utils/goal_responsive.dart';
import '../../../../gen/colors.gen.dart';
import '../bloc/explore_bloc.dart';

@RoutePage()
class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController _customScrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExploreBloc(),
      child: BlocConsumer<ExploreBloc, ExploreState>(
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
                  return GoalResponsive(
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
