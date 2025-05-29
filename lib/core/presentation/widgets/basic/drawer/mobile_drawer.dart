import 'package:flutter/material.dart';
import '../../../../utils/constants/ui_helpers.dart';
import '../goal_svg.dart';
import '../goal_text.dart';

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
      child: Text("Drawer"),
    );
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
      title: GoalText(title, style: Theme.of(context).textTheme.titleMedium),
      leading: Padding(
        padding: const EdgeInsets.only(left: UIHelpers.defaultMargin),
        child: SizedBox(
          height: height,
          width: width,
          child: goalSvg(context, path: icon, isSelected: true),
        ),
      ),
      onTap: onAction,
    );
  }
}
