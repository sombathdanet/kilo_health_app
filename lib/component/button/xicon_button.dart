import 'package:flutter/material.dart';

class XIconButton extends StatelessWidget {
  final IconData iconData;
  final Function()? onPressed;
  final Color color;
  const XIconButton(
      {super.key,
      this.onPressed,
      required this.iconData,
      this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      constraints: BoxConstraints.tight(const Size(30, 30)),
      alignment: Alignment.center,
      iconSize: 25,
      color: color,
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      icon: Icon(iconData),
    );
  }
}
