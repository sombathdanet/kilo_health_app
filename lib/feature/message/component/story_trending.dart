import 'package:flutter/material.dart';
import 'package:project/core/view/padding.dart';
import 'package:project/feature/message/component/status_activity.dart';

class StroyTrendingModel {
  final String id;
  final String thumnail;
  final String name;
  final bool isOnline;

  StroyTrendingModel({
    required this.id,
    required this.thumnail,
    required this.name,
    required this.isOnline,
  });
}

class StoryTrending extends StatelessWidget {
  final List<StroyTrendingModel> stroyTrendingItem;
  final Function(String) onTap;
  const StoryTrending({
    super.key,
    required this.stroyTrendingItem,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => const SizedBox(
                width: XPadding.medium,
              ),
          itemCount: stroyTrendingItem.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => onTap(stroyTrendingItem[index].id),
              child: _buildStoryItem(
                context: context,
                storyItem: stroyTrendingItem[index],
              ),
            );
          }),
    );
  }

  Widget _buildStoryItem({
    required BuildContext context,
    required StroyTrendingModel storyItem,
  }) {
    return Container(
      width: 70,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          width: 4,
          color: const Color(0xffF9F6F4),
        ),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(storyItem.thumnail),
        ),
      ),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          StatusActivity(
            isActive: storyItem.isOnline,
          )
        ],
      ),
    );
  }
}
