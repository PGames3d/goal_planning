import 'package:flutter/material.dart';

class KiaText extends StatelessWidget {
  const KiaText(
    this.text, {
    super.key,
    this.style,
    this.fontSize = 12,
    this.fontWeight = FontWeight.w400,
    this.fontColor,
    this.overflow = TextOverflow.ellipsis,
    this.maxLines = 1,
    this.textAlign,
    this.softWrap,
    this.decoration,
    this.textScaler = 1.0,
  });

  final String text;
  final TextDecoration? decoration;
  final TextStyle? style;
  final int fontSize;
  final FontWeight fontWeight;
  final Color? fontColor;
  final TextOverflow overflow;
  final int maxLines;
  final TextAlign? textAlign;
  final bool? softWrap;
  final double textScaler;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      textAlign: textAlign,
      softWrap: softWrap ?? false,
      style: style ??
          TextStyle(
            decoration: decoration ?? TextDecoration.none,
            fontSize: fontSize.toDouble(),
            color: fontColor ?? Theme.of(context).textTheme.bodyMedium?.color,
            fontWeight: fontWeight,
          ),
      textScaler: TextScaler.linear(textScaler) ,
      maxLines: maxLines,
    );
  }
}
