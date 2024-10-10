import 'package:flutter/material.dart';
import 'package:project/component/xlist_veritical.dart';
import 'package:project/core/view/padding.dart';
import 'package:project/feature/message/component/status_activity.dart';
import 'package:project/theme/text_style/text_style.dart';
import 'package:project/theme/text_style/xfont_size.dart';

class MessageTrendingModel {
  final String id;
  final String thumnail;
  final String name;
  final String messsage;
  final bool isRead;

  MessageTrendingModel({
    required this.id,
    required this.thumnail,
    required this.name,
    required this.messsage,
    required this.isRead,
  });
}

class MessageTrending extends StatelessWidget {
  final List<MessageTrendingModel> messageTrendingItems;
  final EdgeInsets padding;
  final Function()? onTap;
  final Color color;
  const MessageTrending({
    super.key,
    required this.messageTrendingItems,
    this.padding = EdgeInsets.zero,
    this.onTap,
    this.color = const Color(0xffF9F6F4),
  });

  @override
  Widget build(BuildContext context) {
    return XListVeritical(
        items: messageTrendingItems,
        margin: padding,
        content: (context, it, index) {
          return GestureDetector(
            onTap: onTap,
            child: _buildItem(
              it: it,
              context: context,
            ),
          );
        });
  }

  Widget _buildItem({
    required MessageTrendingModel it,
    required BuildContext context,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: XPadding.medium,
        horizontal: XPadding.medium,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildProfile(context: context, it: it),
          StatusActivity(
            isActive: it.isRead,
            size: 12,
          )
        ],
      ),
    );
  }

  Widget _buildProfile({
    required MessageTrendingModel it,
    required BuildContext context,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(right: XPadding.medium),
          height: 60,
          width: 60,
          child: CircleAvatar(
            backgroundImage: NetworkImage(it.thumnail),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: XPadding.extraSmall,
            ),
            XTextMedium(
              text: it.name,
              fontSize: XFontSize.extramedium,
            ),
            const SizedBox(
              height: XPadding.small,
            ),
            XTextMedium(
              text: it.messsage,
              fontWeight: FontWeight.w400,
            )
          ],
        ),
      ],
    );
  }
}
