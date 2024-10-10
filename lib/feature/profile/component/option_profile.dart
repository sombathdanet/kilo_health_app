import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project/component/button/xicon_button.dart';
import 'package:project/core/view/padding.dart';
import 'package:project/theme/text_style/text_style.dart';

class OptionProfile extends StatelessWidget {
  final String iconPath;
  final String title;
  const OptionProfile({super.key, required this.iconPath, required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: XTextLarge(text: title),
      leading: Container(
        padding: const EdgeInsets.all(XPadding.medium),
        decoration: BoxDecoration(
            shape: BoxShape.circle, color: Colors.blue.withOpacity(0.1)),
        child: SvgPicture.asset(
          iconPath,
        ),
      ),
      trailing: const XIconButton(iconData: Icons.arrow_forward_ios_rounded),
    );
  }
}
