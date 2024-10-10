import 'package:flutter/material.dart';
import 'package:project/theme/text_style/xfont_size.dart';

class XTextExtraLarge extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final Color color;
  final double fontSize;
  final EdgeInsets padding;
  final TextOverflow? overflow;
  const XTextExtraLarge({
    super.key,
    required this.text,
    this.fontWeight = FontWeight.w600,
    this.color = const Color(0xff606060),
    this.fontSize = XFontSize.extralarg,
    this.padding = const EdgeInsets.all(0),
    this.overflow = TextOverflow.ellipsis,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontWeight: fontWeight,
          fontSize: fontSize,
          overflow: overflow,
        ),
      ),
    );
  }
}

class XTextLarge extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final Color color;
  final double fontSize;
  final EdgeInsets padding;
  final TextOverflow overflow;
  const XTextLarge({
    super.key,
    required this.text,
    this.fontWeight = FontWeight.w600,
    this.color = const Color(0xff606060),
    this.fontSize = XFontSize.large,
    this.padding = const EdgeInsets.all(0),
    this.overflow = TextOverflow.ellipsis,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontWeight: fontWeight,
          fontSize: fontSize,
          overflow: overflow,
        ),
      ),
    );
  }
}

class XTextMedium extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final Color? color;
  final double fontSize;
  final EdgeInsets padding;
  final TextOverflow? overflow;
  final int? maxLine;
  const XTextMedium({
    super.key,
    required this.text,
    this.fontWeight = FontWeight.w600,
    this.color,
    this.fontSize = XFontSize.medium,
    this.padding = const EdgeInsets.all(0),
    this.overflow = TextOverflow.ellipsis,
    this.maxLine,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(
        maxLines: maxLine,
        text,
        style: TextStyle(
          color: color ?? Theme.of(context).colorScheme.secondary,
          fontWeight: fontWeight,
          fontSize: fontSize,
          overflow: overflow,
        ),
      ),
    );
  }
}

class XTextSmall extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final Color color;
  final double fontSize;
  final EdgeInsets padding;
  final TextOverflow? overflow;
  const XTextSmall({
    super.key,
    required this.text,
    this.fontWeight = FontWeight.w400,
    this.color = const Color(0xff777777),
    this.fontSize = XFontSize.small,
    this.padding = const EdgeInsets.all(0),
    this.overflow = TextOverflow.ellipsis,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontWeight: fontWeight,
          fontSize: fontSize,
          overflow: overflow,
        ),
      ),
    );
  }
}
