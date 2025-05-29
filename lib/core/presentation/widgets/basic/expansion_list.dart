import 'package:flutter/material.dart';

import 'kia_text.dart';

class KiaExpansionList extends StatefulWidget {
  final String title;
  final Widget body;
  bool? isExpanded;
  final Widget? subTitle;

  KiaExpansionList(
      {super.key,
      this.subTitle,
      required this.title,
      required this.body,
      this.isExpanded});

  @override
  State<KiaExpansionList> createState() => _KiaExpansionListState();
}

class _KiaExpansionListState extends State<KiaExpansionList> {
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
                  KiaText(
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
