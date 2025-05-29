import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goal_planning/core/extensions/localization_extension.dart';
import 'package:goal_planning/core/presentation/widgets/basic/goal_svg.dart';

import '../../../../core/presentation/widgets/app_bar/custom_sliver_app_bar.dart';
import '../../../../core/presentation/widgets/basic/drawer/mobile_drawer.dart';
import '../../../../core/presentation/widgets/basic/goal_normal_button.dart';
import '../../../../core/presentation/widgets/basic/goal_text.dart';
import '../../../../core/utils/constants/ui_helpers.dart';
import '../../../../core/utils/goal_responsive.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/colors.gen.dart';
import '../bloc/financial_plan_bloc.dart';
import '../widgets/growth_project_chart.dart';
import '../widgets/phased_investment_plan.dart';
@RoutePage()
class FinancialPlanScreen extends StatefulWidget {
  const FinancialPlanScreen({super.key});

  @override
  State<FinancialPlanScreen> createState() => _FinancialPlanScreenState();
}

class _FinancialPlanScreenState extends State<FinancialPlanScreen> with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController _customScrollController = ScrollController();
  TabController? _tabController;
  int _currentTabIndex = 0;

  final PageController _pageController = PageController();
  List<String> _titles = [];
  List<String> _phases = [];
  List<String> _phaseStartYear = [];
  List<String> _phaseEndYear = [];


  @override
  void dispose() {
    _tabController?.removeListener(_handleTabSelection);
    _tabController?.dispose();
    _pageController.dispose();
    super.dispose();
  }

  /// Update the TabController only when the number of tabs changes.
  void _updateTabControllerIfNeeded(List<String> newTitles) {
    // Only update if controller does not exist or the number of tabs has changed.
    if (_tabController == null || newTitles.length != _tabController!.length) {
      if (_tabController != null) {
        _tabController!.removeListener(_handleTabSelection);
        _tabController!.dispose();
      }
      _tabController = TabController(length: newTitles.length, vsync: this);
      _tabController!.addListener(_handleTabSelection);
    }
    // Update the titles regardless.
    _titles = newTitles;
  }


  void _handleTabSelection() {
    if (_tabController != null && _tabController!.indexIsChanging) {
      _currentTabIndex = _tabController!.index;
      _pageController.jumpToPage(_currentTabIndex);
    }
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _updateTabControllerIfNeeded([
        context.loc.phase1Lbl,
        context.loc.phase2Lbl,
        context.loc.phase3Lbl,
      ]);
      _phases = [
        context.loc.phase1,
        context.loc.phase2,
        context.loc.phase3,
      ];
      _phaseStartYear = [
        "2025",
        "2027",
        "2029",
      ];

      _phaseEndYear = [
        "2027",
        "2029",
        "2030",
      ];
      setState(() {

      });
    },);
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    ///Column widget for home goal calculations
    buildColumn({required String label,required String value}){
      return  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GoalText(label,style: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w400, fontSize: 8, color: theme.colorScheme.primary),),
          const SizedBox(height: 2,),
          GoalText(value,style: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w400, fontSize: 8))
        ],
      );
    }


    return BlocProvider(
      create: (context) => FinancialPlanBloc(),
      child: BlocConsumer<FinancialPlanBloc, FinancialPlanState>(
        listener: (context, state) {


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
                                title: context.loc.goalPlanning,
                                isBack: true,
                              ),

                              SliverToBoxAdapter(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: UIHelpers.defaultMargin,vertical: UIHelpers.smallMargin),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      GoalText(context.loc.investmentGrowth,style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold,) ,),
                                      GoalText(context.loc.seeHowInvest,style: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.normal, color: ColorName.subTitleColor) ,),
                                      const SizedBox(height: UIHelpers.smallMargin,),
                                      ///Add Chart here
                                      GrowthProjectChart(),


                                      ///Home goal calculations
                                      const SizedBox(height: UIHelpers.smallMargin,),
                                      GoalText(context.loc.homeGoalCalculations,style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w400, fontSize: 14) ,),
                                      const SizedBox(height: UIHelpers.smallMargin,),
                                      Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: UIHelpers.smallMargin),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8),
                                          color: ColorName.containerBackground,
                                          border: Border.all(color: ColorName.borderColor, width: 0.5),
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            buildColumn(label: context.loc.requiredSip,value: "2.72 Lakh"),
                                            goalSvg(context, path: Assets.icons.rightArrow,isSelected: true),
                                            buildColumn(label: context.loc.inflationAdj,value: "2.72 Lakh"),
                                            goalSvg(context, path: Assets.icons.minus,isSelected: true),
                                            buildColumn(label: context.loc.futureValue,value: "2.72 Lakh"),
                                            goalSvg(context, path: Assets.icons.equal,isSelected: true),
                                            buildColumn(label: context.loc.shortfall,value: "2.72 Lakh")
                                          ],
                                        ),
                                      ),



                                    ],
                                  ),
                                ),
                              ),

                              ///Phase investment plan
                              if(_tabController!=null)...[
                              SliverPersistentHeader(
                                pinned: true,
                                delegate: _SliverAppBarDelegate(
                                  child: TabBar(
                                    dividerColor: Colors.transparent,
                                    isScrollable: false,
                                    unselectedLabelColor:  ColorName.unselectedColor,
                                    labelColor: ColorName.whiteColor,
                                    controller: _tabController,
                                    indicator: UnderlineTabIndicator(
                                      borderSide: BorderSide(width: 1, color: theme.colorScheme.primary),
                                      insets: const EdgeInsets.symmetric(vertical: 8, horizontal: 12.0),
                                    ),
                                    indicatorSize: TabBarIndicatorSize.label,
                                    tabs: List.generate(
                                      _titles.length,
                                          (index) => Tab(
                                        key: ValueKey(_titles[index]),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  if(index!=0)
                                                  goalSvg(context, path: Assets.icons.lockKey ,colorFilter: ColorFilter.mode(index == _currentTabIndex ? ColorName.whiteColor : ColorName.unselectedColor, BlendMode.srcIn)),
                                                  const SizedBox(width: 8), // spacing between icon and text
                                                  Text(_titles[index],style: const TextStyle(fontWeight: FontWeight.w400,fontSize: 10),),
                                                ],
                                              ),
                                      ),
                                    ),
                                    onTap: (index) {
                                      _pageController.jumpToPage(index);
                                    },
                                  ),
                                ),
                              ),
                              SliverFillRemaining(
                                child: PageView(
                                  controller: _pageController,
                                  onPageChanged: (index) {
                                    _currentTabIndex = index;
                                    if (_tabController != null && mounted) {
                                      _tabController!.animateTo(index);
                                      setState(() {
                                      });
                                    }
                                  },
                                  children: List.generate(
                                    _titles.length,
                                        (index) => PhasedInvestmentPlan(
                                          goalValue: "1.2 Cr",
                                          firstYear: _phaseStartYear[index],
                                          lastYear: _phaseEndYear[index],
                                          phase: _phases[index],
                                        ),
                                  ),
                                ),
                              )
                               ]
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


class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;

  _SliverAppBarDelegate({required TabBar child}) : _tabBar = child;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(covariant _SliverAppBarDelegate oldDelegate) {
    return _tabBar != oldDelegate._tabBar;
  }

}

