import 'package:flutter/material.dart';
import 'package:goal_planning/core/extensions/localization_extension.dart';
import 'package:goal_planning/core/utils/constants/constants.dart';
import 'package:goal_planning/features/financial_plan/presentation/widgets/expansion_item_card.dart';

import '../../../../core/presentation/widgets/basic/goal_text.dart';
import '../../../../gen/colors.gen.dart';

class PhasedInvestmentPlan extends StatelessWidget {
  const PhasedInvestmentPlan({super.key,required this.phase, required this.goalValue,required this.firstYear, required this.lastYear});
  final String goalValue;
  final String firstYear;
  final String lastYear;
  final String phase;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SingleChildScrollView(
      physics : const NeverScrollableScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:  UIHelpers.defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: UIHelpers.smallMargin,),
            GoalText("${context.loc.goal}: \u20B9$goalValue",style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w400, fontSize: 14) ,),
            const SizedBox(height: UIHelpers.smallMargin,),
            Container(
              width: double.infinity,
              height: 10,
              decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: ColorName.unselectedColor
            ),),
            const SizedBox(height: UIHelpers.extraSmallMargin,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GoalText(firstYear,style: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.normal,fontSize: 10, color: ColorName.goalYearRange) ,),
                GoalText(lastYear,style: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.normal,fontSize: 10, color: ColorName.goalYearRange) ,),
              ],
            ),
            const SizedBox(height: UIHelpers.smallMargin,),
            GoalText(context.loc.phasedInvestment,style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w400, fontSize: 14) ,),
            const SizedBox(height: UIHelpers.smallMargin,),
            ExpansionItemCard(
              phase: phase,
              sip: "3.56 Lakh/month" ,
              totalInvestment: "1.2 Cr",
            )
          ],
        ),
      ),
    );
  }
}
