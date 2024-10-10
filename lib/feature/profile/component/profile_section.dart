import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project/theme/text_style/text_style.dart';
import 'package:project/theme/text_style/xfont_size.dart';

class ProfileSection extends StatelessWidget {
  final String iconPath;
  final String title;
  final String subtitle;
  const ProfileSection({
    super.key,
    required this.iconPath,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          iconPath,
          height: 30,
          width: 30,
        ),
        XTextSmall(
          text: title,
          fontSize: XFontSize.small,
          color: const Color(0xff407BFF),
        ),
        XTextMedium(
          text: subtitle,
          color: const Color(0xff407BFF),
        ),
      ],
    );
  }
}
