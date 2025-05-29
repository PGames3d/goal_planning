import 'package:flutter/material.dart';
import 'package:goal_planning/core/extensions/localization_extension.dart';

import '../../../utils/constants/app_strings.dart';
import 'goal_text.dart';

class GoalPermissionWidget extends StatelessWidget {
  const GoalPermissionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Center(
        child: GoalText(
          context.loc.seeHowInvest,
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
