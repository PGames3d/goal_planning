import 'dart:io';

import 'package:flutter/material.dart';


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
  final VoidCallback? checkInAction;
  final VoidCallback? infoAction;
  final VoidCallback? pastAction;
  final VoidCallback? hisabAction;
  final VoidCallback? locationAction;
  final VoidCallback? viewBillAction;
  final VoidCallback? exportLedgerAction;
  final VoidCallback? pastSRAction;
  final VoidCallback? exportExcelAction;
  final VoidCallback? exportPDFAction;

  const CustomSliverAppBar({
    super.key,
    this.scaffoldKey,
    required this.title,
    this.titleStyle,
    this.isBack = true,
    this.hisabAction,
    this.checkInAction,
    this.infoAction,
    this.pastAction,
    this.locationAction,
    this.viewBillAction,
    this.exportLedgerAction,
    this.pastSRAction,
    this.exportExcelAction,
    this.exportPDFAction,
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
          child: goalSvg(context, path: Assets.icons.hamburger,
              boxFit: BoxFit.fitWidth
          ),
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: GoalText(
              title,
              style: titleStyle ?? Theme.of(context).textTheme.titleSmall, // Custom text style
            ),
          ),
        ],
      ),
      centerTitle: true, // Center the title
      actions: [
        ///past allocation
        if(pastAction!=null)...[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0),
            child: InkWell(
              onTap: () {
                ///perform action for past action button
                pastAction?.call();
              },
              borderRadius: const BorderRadius.all(Radius.circular(30)),
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: goalSvg(context, path: Assets.icons.past),
              ),
            ),
          ),],

        ///check in hand
        if(checkInAction!=null)...[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0),
            child: InkWell(
              onTap: () {
                ///perform action for past action button
                checkInAction?.call();
              },
              borderRadius: const BorderRadius.all(Radius.circular(30)),
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: goalSvg(context, path: Assets.icons.outstandingBill),
              ),
            ),
          ),],

        ///past allocation info
        if(infoAction!=null)...[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0),
            child: InkWell(
              onTap: () {
                ///perform action for past allocation action button
                infoAction?.call();
              },
              borderRadius: const BorderRadius.all(Radius.circular(30)),
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: goalSvg(context, path: Assets.icons.pastAllocationsInfo),
              ),
            ),
          ),],


        ///past SR action
        if(pastSRAction!=null)...[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0),
            child: InkWell(
              onTap: () {
                ///perform action for past SR action button
                pastSRAction?.call();
              },
              borderRadius: const BorderRadius.all(Radius.circular(30)),
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: goalSvg(context, path: Assets.icons.pastAllocations),
              ),
            ),
          ),],


        ///location action
        if(locationAction!=null)...[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0),
            child: InkWell(
              onTap: () {
                ///perform action for location action button
                locationAction?.call();
              },
              borderRadius: const BorderRadius.all(Radius.circular(30)),
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: goalSvg(context, path: Assets.icons.location,),
              ),
            ),
          ),],



        ///hisab and past hisab
        if(hisabAction!=null)...[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0),
            child: InkWell(
              onTap: () {
                ///perform action for hisab action button
                hisabAction?.call();
              },
              borderRadius: const BorderRadius.all(Radius.circular(30)),
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: goalSvg(context, path: Assets.icons.recent,),
              ),
            ),
          ),],

        ///view bill
        if(viewBillAction!=null)...[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0),
            child: InkWell(
              onTap: () {
                ///perform action for view bill action button
                viewBillAction?.call();
              },
              borderRadius: const BorderRadius.all(Radius.circular(30)),
              child: const Padding(
                padding: EdgeInsets.all(3.0),
                child: Icon(Icons.newspaper_rounded),
              ),
            ),
          ),],

        ///export ledger
        if(exportLedgerAction!=null)...[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: InkWell(
              onTap: () {
                ///perform action for export ledger action button
                exportLedgerAction?.call();
              },
              borderRadius: const BorderRadius.all(Radius.circular(30)),
              child: goalSvg(context, path: Assets.icons.ledger),
            ),
          ),],


        ///export excel
        if(exportExcelAction!=null)...[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0),
            child: InkWell(
              onTap: () {
                ///perform action for export excel action button
                exportExcelAction?.call();
              },
              borderRadius: const BorderRadius.all(Radius.circular(30)),
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: goalSvg(context, path: Assets.icons.excel,isWithoutFilter: true),
              ),
            ),
          ),],

        ///export PDF
        if(exportPDFAction!=null)...[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0),
            child: InkWell(
              onTap: () {
                ///perform action for export PDF action button
                exportPDFAction?.call();
              },
              borderRadius: const BorderRadius.all(Radius.circular(30)),
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: goalSvg(context, path: Assets.icons.pdf,isWithoutFilter: true),
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
