import 'package:flutter/material.dart';

import 'goal_text.dart';

class GoalExpansionList extends StatefulWidget {
  final String title;
  final Widget body;
  bool? isExpanded;
  final Widget? subTitle;

  GoalExpansionList(
      {super.key,
      this.subTitle,
      required this.title,
      required this.body,
      this.isExpanded});

  @override
  State<GoalExpansionList> createState() => _GoalExpansionListState();
}

class _GoalExpansionListState extends State<GoalExpansionList> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
      children: [
        ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GoalText(
                    widget.title,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.w500),
                  ),
                  widget.subTitle ?? const SizedBox(),
                ],
              ),
            );
          },
          body: widget.body,
          isExpanded: widget.isExpanded ?? _isExpanded,
        ),
      ],
    );
  }
}
