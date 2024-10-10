import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project/core/view/padding.dart';
import 'package:project/theme/text_style/text_style.dart';

class XSearchBar extends StatelessWidget {
  final String hintText;
  final String icon;
  final EdgeInsets? padding;
  final Function()? onTap;
  final Color? color;
  const XSearchBar(
      {super.key,
      this.hintText = "Search",
      this.icon = "assets/icons/ic_search.svg",
      this.padding,
      this.onTap,
      this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: padding,
        padding: const EdgeInsets.symmetric(
            horizontal: XPadding.medium, vertical: XPadding.large),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color ?? Theme.of(context).cardColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              offset: const Offset(0, 0),
              spreadRadius: 1.0,
              blurRadius: 5.0,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            XTextMedium(
              text: hintText,
            ),
            SvgPicture.asset(
              icon,
              colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
            )
          ],
        ),
      ),
    );
  }
}
