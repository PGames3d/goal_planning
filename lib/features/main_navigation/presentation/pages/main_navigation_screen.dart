import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goal_planning/core/extensions/localization_extension.dart';
import 'package:goal_planning/features/explore/presentation/pages/explore_screen.dart';
import 'package:goal_planning/features/financial_plan/presentation/pages/financial_plan_screen.dart';
import 'package:goal_planning/features/home/presentation/pages/home_screen.dart';
import 'package:goal_planning/features/my_dhan/presentation/pages/my_dhan_screen.dart';

import '../../../../core/presentation/widgets/app_bar/custom_sliver_app_bar.dart';
import '../../../../core/presentation/widgets/basic/drawer/mobile_drawer.dart';
import '../../../../core/presentation/widgets/basic/goal_loader.dart';
import '../../../../core/presentation/widgets/basic/goal_normal_button.dart';
import '../../../../core/presentation/widgets/basic/goal_svg.dart';
import '../../../../core/presentation/widgets/basic/goal_text.dart';
import '../../../../core/utils/constants/ui_helpers.dart';
import '../../../../core/utils/goal_responsive.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/colors.gen.dart';
import '../bloc/main_navigation_bloc.dart';
import '../widgets/custom_bottom_navigation.dart';
@RoutePage()
class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainNavigationBloc(HomeInitialState())..add(InitialEvent()),
      child: BlocConsumer<MainNavigationBloc, MainNavigationState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            bottomNavigationBar: BlocConsumer<MainNavigationBloc, MainNavigationState>(
              listener: (context, state) {
                if (state is BottomNavigationState) {
                  _currentIndex = state.index;
                }
              },
              builder: (context, state) {
                return CustomBottomNavigation(
                  index: _currentIndex,
                  items: getBottomNavigationItems( _currentIndex),
                  onTap: (index) {
                    _currentIndex = index;
                    context.read<MainNavigationBloc>().add(BottomNavigationEvent(index));
                  },
                );
              },
            ),
            body: SafeArea(
              child: LayoutBuilder(
                builder: (ctx, constraints) {
                  return GoalResponsive(
                    mobile: BlocConsumer<MainNavigationBloc, MainNavigationState>(
                      listener: (context, state) {
                        if (state is BottomNavigationState) {
                          _currentIndex = state.index;
                          _pageController.animateToPage(
                            _currentIndex,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      builder: (context, state) {
                        final pages = [
                          const HomeScreen(),
                          const ExploreScreen(),
                          const MyDhanScreen(),
                          const FinancialPlanScreen(),
                        ];
                        if(state is InitialEvent) {
                          return const Stack(
                            children: [
                              GoalLoader(),
                            ],
                          );
                        }

                        return PageView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          controller: _pageController,
                          itemCount: pages.length,
                          itemBuilder: (context, index) {
                            return pages[index];
                          },
                        );

                      },
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }

  List<BottomNavigationBarItem> getBottomNavigationItems(int index) {
    return <BottomNavigationBarItem>[
      customNavigationItem(context.loc.home,currentIndex: 0, selectedIndex: index,path: Assets.icons.home),
      customNavigationItem(context.loc.explore,currentIndex: 1, selectedIndex: index,path: Assets.icons.explore),
      customNavigationItem(context.loc.myDhan,currentIndex: 2, selectedIndex: index,path: Assets.icons.myDhan),
      customNavigationItem(context.loc.financialPlan,currentIndex: 2, selectedIndex: index,path: Assets.icons.financialPlan),
    ];
  }


  BottomNavigationBarItem customNavigationItem(String name,{required String path, required int currentIndex, required int selectedIndex}){
    return BottomNavigationBarItem(
      activeIcon: goalSvg(context, path: path,isSelected: true),
      icon:goalSvg(context, path: path),
      label: name,
    );
  }
}
