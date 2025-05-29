import 'package:flutter/material.dart';
import 'package:goal_planning/core/extensions/localization_extension.dart';
import '../../../../core/presentation/widgets/basic/custom_checkbox.dart';
import '../../../../core/presentation/widgets/basic/goal_text.dart';
import '../../../../core/utils/common_utils.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../core/utils/constants/ui_helpers.dart';

class ExpansionItemCard extends StatelessWidget {
  ExpansionItemCard(
      {super.key,
      required this.phase,
      required this.totalInvestment,
      required this.sip});

  final String phase;
  final String totalInvestment;
  final String sip;

  final ValueNotifier<bool> isExpansionChanged = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    final cardColor = theme.cardColor;
    final isDarkMode = theme.brightness == Brightness.dark;

    // Cached text color for header elements.
    final headerTextColor = CommonUtils.getTextColor(context, color: cardColor);

    // Header section with checkbox, road info, and expansion arrow.
    Widget buildHeader() {
      return Container(
        padding: const EdgeInsets.symmetric(
          horizontal: UIHelpers.smallPadding,
          vertical: UIHelpers.smallPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GoalText(
                  phase,
                  style: textTheme.titleSmall?.copyWith(
                      color: ColorName.textColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 11.46),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                ValueListenableBuilder<bool>(
                  valueListenable: isExpansionChanged,
                  builder: (context, expanded, child) {
                    return AnimatedRotation(
                      duration: Duration(milliseconds: expanded ? 300 : 100),
                      curve: Curves.easeInOut,
                      turns: expanded ? -0.50 : 0,
                      child: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: headerTextColor,
                      ),
                    );
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GoalText(
                  "${context.loc.totalInvestment}: \u20B9$totalInvestment",
                  style: textTheme.bodySmall?.copyWith(
                      color: headerTextColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 11.46),
                ),
                GoalText(
                  "${context.loc.sip}: \u20B9$sip",
                  style: textTheme.bodySmall?.copyWith(
                      color: headerTextColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 11.46),
                ),
              ],
            ),
          ],
        ),
      );
    }

    // Expansion section that shows child items.
    Widget buildExpansion() {
      return ValueListenableBuilder<bool>(
        valueListenable: isExpansionChanged,
        builder: (context, expanded, child) {
          return AnimatedSize(
            alignment: Alignment.centerLeft,
            duration: Duration(milliseconds: expanded ? 300 : 100),
            curve: Curves.easeInOut,
            child: expanded
                ? Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: UIHelpers.smallPadding,
                      vertical: UIHelpers.smallPadding,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GoalText(
                          context.loc.equity,
                          style: textTheme.bodySmall?.copyWith(
                              color: headerTextColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 11.46),
                        ),
                        const SizedBox(height: UIHelpers.smallMargin,),
                        Wrap(
                                      children: List.generate(2, (index) {
                        return Text("data");
                                      }),
                                    ),

                        const SizedBox(height: UIHelpers.smallMargin,),
                        GoalText(
                          context.loc.debt,
                          style: textTheme.bodySmall?.copyWith(
                              color: headerTextColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 11.46),
                        ),
                      ],
                    ),
                  )
                : const SizedBox.shrink(),
          );
        },
      );
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        border: Border.all(color: ColorName.borderColor, width: 0.5),
      ),
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        onTap: () {
          isExpansionChanged.value = !isExpansionChanged.value;
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildHeader(),
            buildExpansion(),
          ],
        ),
      ),
    );
  }
}
