import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

extension ResponsiveText on Text {
  Widget responsive() => (maxLines != null)
      ? AutoSizeText(
          data!,
          style: style,
          maxLines: maxLines,
          minFontSize: 2,
          textAlign: textAlign,
          textDirection: textDirection,
          locale: locale,
          softWrap: softWrap,
          semanticsLabel: semanticsLabel,
        )
      : FittedBox(fit: BoxFit.scaleDown, child: this);
}

extension ResponsiveTextStyle on BuildContext {
  TextStyle get h1 => TextStyle(fontSize: 36, fontWeight: FontWeight.w700);

  TextStyle get h2 => TextStyle(fontSize: 32, fontWeight: FontWeight.w600);

  TextStyle get h3 => TextStyle(fontSize: 30, fontWeight: FontWeight.w600);

  TextStyle get h4 => TextStyle(fontSize: 24, fontWeight: FontWeight.w500);

  TextStyle get h5 => TextStyle(fontSize: 20, fontWeight: FontWeight.w500);

  TextStyle get h6 => TextStyle(fontSize: 18, fontWeight: FontWeight.w500);

  TextStyle get bodyBase => TextStyle(fontSize: 16, fontWeight: FontWeight.w400);

  TextStyle get subtitle => TextStyle(fontSize: 14, fontWeight: FontWeight.w400);

  TextStyle get caption => TextStyle(fontSize: 12, fontWeight: FontWeight.w300);

  TextStyle get lead => TextStyle(fontSize: 10, fontWeight: FontWeight.w200);
}
