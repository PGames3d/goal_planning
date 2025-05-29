import 'package:flutter/material.dart';

import '../../../../core/utils/common_utils.dart';
import '../../../../core/utils/constants/app_strings.dart';
import '../../../../core/utils/constants/ui_helpers.dart';
import '../../../../gen/colors.gen.dart';

class CustomBottomNavigation extends StatelessWidget {
  final int index;
  final Function(int) onTap;
  final List<BottomNavigationBarItem> items;
  const CustomBottomNavigation({super.key,
  this.index = 0,
  required this.onTap,
    required this.items
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(UIHelpers.defaultPadding),
        topRight: Radius.circular(UIHelpers.defaultPadding),
      ),
      child: BottomNavigationBar(
        items: items,
        backgroundColor: Theme.of(context).cardColor,
        selectedItemColor: CommonUtils.getTextColor(context)  ,
        unselectedItemColor: ColorName.lightGrey,
        elevation: 160,
        currentIndex: index,
        showUnselectedLabels: true,
        selectedLabelStyle: const TextStyle(fontSize: 10,fontWeight: FontWeight.w600),
        unselectedLabelStyle: const TextStyle(fontSize: 10),
        landscapeLayout: BottomNavigationBarLandscapeLayout.centered ,
        showSelectedLabels: true,
        onTap: onTap,
      ),
    );
  }
}
