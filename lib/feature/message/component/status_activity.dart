import 'package:flutter/material.dart';

class StatusActivity extends StatelessWidget {
  final bool isActive;
  final double size;
  const StatusActivity({super.key, required this.isActive, this.size = 15});

  @override
  Widget build(BuildContext context) {
    return isActive
        ? Container(
            height: size,
            width: size,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 2,
                  color: Colors.white,
                ),
                color: Theme.of(context).primaryColor),
          )
        : const SizedBox.shrink();
  }
}
