import 'dart:io';
import 'package:flutter/material.dart';
import 'package:project/component/appbar/xapp_bar.dart';
import 'package:project/core/base/base_builder.dart';
import 'package:project/core/view/padding.dart';
import 'package:project/data/fake_data.dart';
import 'package:project/feature/message/message_provider.dart';
import 'package:project/route.dart';
import 'package:project/feature/message/component/message_trending.dart';
import 'package:project/feature/message/component/story_trending.dart';
import 'package:project/theme/text_style/text_style.dart';
import 'package:project/utils/constant/image_constant.dart';

List<StroyTrendingModel> storyTrendingItem = [];
List<StroyTrendingModel> ownStory = [];

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
    File? file = ownStory.lastOrNull?.file;
    return BaseBuilder<MessageProvider>(
      builder: (provider, _) => Padding(
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
            Row(
              children: [
                GestureDetector(
                  onTap: () => provider.imagePicker(context),
                  child: _buildStoryItem(),
                ),
                _buildOwnStory(file: file, context: context),
                // Expanded(
                //   child: StoryTrending(
                //     stroyTrendingItem: storyTrendingItem,
                //     onTap: (id) {},
                //   ),
                // )
              ],
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
      ),
    );
  }

  Widget _buildStoryItem() {
    return Container(
      width: 65,
      height: 65,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          width: 4,
          color: const Color(0xffF9F6F4),
        ),
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(ImageConstant.default_image_network),
        ),
      ),
      child: const Stack(
        alignment: Alignment.topRight,
        children: [
          Icon(Icons.add_circle),
        ],
      ),
    );
  }

  Widget _buildOwnStory({required File? file, required BuildContext context}) {
    if (file != null) {
      return GestureDetector(
        onTap: () => AppRoutes.gotoStoryView(args: ownStory, context: context),
        child: Container(
          width: 65,
          height: 65,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              width: 4,
              color: const Color(0xffF9F6F4),
            ),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: FileImage(file),
            ),
          ),
        ),
      );
    }
    return const SizedBox.shrink();
  }
}
