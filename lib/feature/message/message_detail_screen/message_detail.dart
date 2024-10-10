import 'package:flutter/material.dart';
import 'package:project/component/button/xicon_button.dart';
import 'package:project/component/xlist_veritical.dart';
import 'package:project/core/view/padding.dart';
import 'package:project/data/fake_data.dart';
import 'package:project/feature/message/component/chat.dart';
import 'package:project/feature/search_screen/component/search_textfield.dart';

class MessageDetailScreen extends StatelessWidget {
  const MessageDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: XPadding.extraLarge),
        child: _buildBody(context),
      ),
      floatingActionButton: _buildFloatingButton(context),
    );
  }

  Widget _buildBody(context) {
    return XListVeritical(
      items: FakeData.messageItem,
      content: (context, it, index) {
        return it.isSender
            ? ChatDisplay(
                messageDetailModel: it,
                chatType: ChatType.end,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              )
            : ChatDisplay(
                messageDetailModel: it,
                chatType: ChatType.start,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              );
      },
    );
  }

  Widget _buildFloatingButton(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: XPadding.extraLarge),
      child: Row(
        children: [
          XIconButton(iconData: Icons.filter),
          XIconButton(iconData: Icons.mic),
          Expanded(child: SearchTextField()),
          XIconButton(iconData: Icons.send),
        ],
      ),
    );
  }
}
