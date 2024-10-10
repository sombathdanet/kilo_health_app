import 'package:flutter/material.dart';
import 'package:project/core/view/padding.dart';
import 'package:project/theme/text_style/text_style.dart';
import 'package:project/theme/text_style/xfont_size.dart';

class NotificationTrendingModel {
  final String id;
  final String title;
  final String subtitle;
  final String date;
  NotificationTrendingModel(
      {required this.id,
      required this.title,
      required this.subtitle,
      required this.date});
}

class NotificationTrending extends StatelessWidget {
  final NotificationTrendingModel items;
  const NotificationTrending({
    super.key,
    required this.items,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 1),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        border: Border(
          bottom: BorderSide(color: Theme.of(context).colorScheme.secondary, width: 1),
        ),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: XPadding.extraLarge,
        horizontal: XPadding.extraLarge,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: XPadding.extraSmall,
              right: XFontSize.extralarg,
            ),
            child: Image.asset(
              height: 25,
              width: 25,
              color: Theme.of(context).primaryColor,
              "assets/icons/logo health.png",
            ),
          ),
          _buildText(items: items)
        ],
      ),
    );
  }

  Widget _buildText({required NotificationTrendingModel items}) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          XTextMedium(
            text: items.title,
            fontSize: XFontSize.extramedium,
            fontWeight: FontWeight.w400,
            overflow: null,
          ),
          const SizedBox(
            height: XPadding.extraSmall,
          ),
          XTextMedium(
            text: items.date,
            fontSize: XFontSize.medium,
            fontWeight: FontWeight.w400,
          )
        ],
      ),
    );
  }
}
