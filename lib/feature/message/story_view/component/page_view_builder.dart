import 'package:flutter/material.dart';
import 'package:project/feature/message/component/story_trending.dart';
import 'package:project/feature/message/story_view/story_view_screeen.dart';

class StoryViewScreen extends StatelessWidget {
  final List<StroyTrendingModel> storytrendingItme;
  const StoryViewScreen({super.key, required this.storytrendingItme});

  @override
  Widget build(BuildContext context) {
    return StoryViewItem(
      storyViewItem: storytrendingItme[0],
    );
  }
}
