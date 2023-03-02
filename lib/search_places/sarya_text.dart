import 'package:flutter/material.dart';

class SaryaText extends StatelessWidget {
  /// Base text widget for sarya_ui
  const SaryaText({
    Key? key,
    required this.text,
    this.style,
    this.maxLines,
    this.overflow,
    this.textAlign = TextAlign.start,
  }) : super(key: key);

  /// Text for [SaryaText]
  final String text;

  /// TextStyle for [SaryaText]
  final TextStyle? style;

  /// Max lines for [SaryaText]
  final int? maxLines;

  /// Text overflow for [SaryaText]
  final TextOverflow? overflow;

  /// Text align for [SaryaText]
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
    );
  }
}
