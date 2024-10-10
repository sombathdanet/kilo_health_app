import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project/component/button/xicon_button.dart';
import 'package:project/theme/text_style/text_style.dart';

class XProFileAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final String thumnail;
  final String icon;
  final EdgeInsets padding;
  final VoidCallback onTap;
  const XProFileAppBar({
    super.key,
    this.height = kToolbarHeight,
    this.thumnail =
        "https://i.pinimg.com/236x/90/58/78/905878bb896b1ee7025112714a06d104.jpg",
    this.icon =
        "https://i.pinimg.com/564x/64/7b/a3/647ba397be45bb84bad1283a25b63463.jpg",
    this.padding = EdgeInsets.zero,
    required this.onTap,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        scrolledUnderElevation: 0.0,
        toolbarHeight: preferredSize.height,
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        // title: XImageProvider(

        //   path: thumnail,
        //   fit: BoxFit.fill,
        // ),
        actions: [
          GestureDetector(
            onTap: onTap,
            child: SizedBox(
              height: 30,
              width: 30,
              child: SvgPicture.asset(
                "assets/icons/ic_notification.svg",
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class XNavAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final List<Widget>? actions;
  final String title;
  final void Function()? onPressed;
  final Color backgroundColor;
  final EdgeInsets padding;
  final bool isNavBack;
  final Color titleColor;
  const XNavAppBar({
    super.key,
    this.actions,
    this.height = kToolbarHeight,
    this.title = "",
    this.onPressed,
    this.backgroundColor = Colors.transparent,
    this.padding = EdgeInsets.zero,
    this.isNavBack = false,
    this.titleColor = Colors.grey,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      padding: padding,
      child: AppBar(
        backgroundColor: backgroundColor,
        scrolledUnderElevation: 0.0,
        toolbarHeight: preferredSize.height,
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        title: Row(
          children: [
            isNavBack
                ? XIconButton(
                    onPressed: onPressed,
                    iconData: Icons.arrow_back_ios_new_rounded,
                  )
                : const SizedBox.shrink(),
            XTextLarge(
              text: title,
              color: titleColor,
            ),
          ],
        ),
        actions: actions,
      ),
    );
  }
}
