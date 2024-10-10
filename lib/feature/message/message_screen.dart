import 'package:flutter/material.dart';
import 'package:project/component/appbar/xapp_bar.dart';
import 'package:project/core/view/padding.dart';
import 'package:project/data/fake_data.dart';
import 'package:project/route.dart';
import 'package:project/feature/message/component/message_trending.dart';
import 'package:project/feature/message/component/story_trending.dart';
import 'package:project/theme/text_style/text_style.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(context: context),
    );
  }

  XProFileAppBar _buildAppBar() {
    return XProFileAppBar(
      onTap: () {},
      padding: const EdgeInsets.symmetric(horizontal: XPadding.extraLarge),
    );
  }

  Widget _buildBody({
    required BuildContext context,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: XPadding.extraLarge),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: XPadding.medium,
          ),
          const XTextExtraLarge(
            text: "Emergency consult with your recommended doctor",
            overflow: null,
          ),
          const SizedBox(
            height: XPadding.medium,
          ),
          StoryTrending(
            stroyTrendingItem: FakeData.storyTrendingItem,
            onTap: (id) {},
          ),
          const SizedBox(
            height: XPadding.medium,
          ),
          const XTextLarge(text: "All Message"),
          const SizedBox(
            height: XPadding.medium,
          ),
          Expanded(
            child: MessageTrending(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
              onTap: () => Navigator.of(context)
                  .pushNamed(AppRoutes.messageDetailScreen),
              messageTrendingItems: FakeData.messagetrending,
              padding: const EdgeInsets.only(bottom: XPadding.large),
            ),
          )
        ],
      ),
    );
  }
}
