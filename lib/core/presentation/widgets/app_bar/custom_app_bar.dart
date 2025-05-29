import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kias/core/presentation/widgets/basic/kia_svg.dart';
import 'package:kias/core/utils/constants/constants.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../gen/colors.gen.dart';
import '../../../data/services/navigation_service.dart';
import '../basic/kia_text.dart';

// Custom AppBar widget
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final String title;
  final TextStyle? titleStyle;
  final Color iconColor;
  final bool isBack;
  final bool isPastAction;

  const CustomAppBar({
    super.key,
    this.scaffoldKey,
    required this.title,
    this.titleStyle,
    this.isBack = true,
    this.isPastAction = false,
    this.iconColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0, // Remove shadow if desired
      leading: isBack?
      ///used for back button
      InkWell(onTap: (){
        NavigationService.pop(context);
      },
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          child: Icon(Platform.isAndroid ? Icons.arrow_back_rounded : Icons.arrow_back_ios_new_rounded, color: ColorName.greyColor,) )
      :
      ///use for open drawer
      InkWell(
        onTap: () {
          scaffoldKey?.currentState?.openDrawer(); // Open drawer
        },
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: kiaSvg(context, path: Assets.icons.hamburger,
          boxFit: BoxFit.fitWidth
          ),
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          KiaText(
            title,
            style: titleStyle ?? Theme.of(context).textTheme.titleSmall, // Custom text style
          ),
        ],
      ),
      centerTitle: true, // Center the title
      actions: [
        ///past allocation
        if(isPastAction)...[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 1.0),
            child: InkWell(
              onTap: () {
               ///perform action for past action button
              },
              borderRadius: const BorderRadius.all(Radius.circular(30)),
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: kiaSvg(context, path: Assets.icons.past),
              ),
            ),
          ),],


        ///right side padding
        const SizedBox(width: UIHelpers.mediumPadding,)
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0); // Custom height for AppBar
}
