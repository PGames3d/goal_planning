import 'dart:io';

import 'package:flutter/material.dart';
import 'package:goal_planning/gen/fonts.gen.dart';


import '../../../../gen/assets.gen.dart';
import '../../../../gen/colors.gen.dart';
import '../../../data/services/navigation_service.dart';
import '../../../utils/constants/ui_helpers.dart';
import '../basic/goal_svg.dart';
import '../basic/goal_text.dart';

// Custom AppBar widget
class CustomSliverAppBar extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final String title;
  final TextStyle? titleStyle;
  final Color iconColor;
  final bool isBack;

  const CustomSliverAppBar({
    super.key,
    this.scaffoldKey,
    required this.title,
    this.titleStyle,
    this.isBack = true,
    this.iconColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      pinned: false,
      elevation: 0, // Remove shadow if desired
      leading: isBack?
      ///used for back button
      InkWell(onTap: (){
        NavigationService.pop(context);
      },
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          child: Icon(Platform.isAndroid ? Icons.arrow_back_rounded : Icons.arrow_back_ios_new_rounded, color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black) )
          :
      ///use for open drawer
      InkWell(
        onTap: () {
          scaffoldKey?.currentState?.openDrawer(); // Open drawer
        },
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: goalSvg(context, path: Assets.icons.hamburger,
              boxFit: BoxFit.fitWidth
          ),
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: GoalText(
              title,
              style: titleStyle ?? Theme.of(context).textTheme.titleMedium?.copyWith( fontWeight: FontWeight.w400,fontSize: 18,height: 22,), // Custom text style
            ),
          ),
        ],
      ),
      centerTitle: true, // Center the title
      actions: [

        ///right side padding
        const SizedBox(width: UIHelpers.mediumPadding,)
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0); // Custom height for AppBar
}
