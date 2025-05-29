import 'package:flutter/material.dart';

class KiaRichText extends StatelessWidget {
  const KiaRichText(
      {super.key,
      required this.text,
      this.overflow = TextOverflow.ellipsis,
      this.maxLines = 1,
      this.textAlign = TextAlign.start});

  final List<TextSpan> text;
  final TextOverflow overflow;
  final int maxLines;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return RichText(
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
        text: TextSpan(
            children: text,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(fontWeight: FontWeight.w400)));
  }
}
