import 'package:flutter/material.dart';
import 'package:project/core/view/padding.dart';
import 'package:project/data/model.dart';
import 'package:project/theme/text_style/text_style.dart';

enum ChatType {
  start,
  end,
}

class ChatDisplay extends StatelessWidget {
  final MessageDetailModel messageDetailModel;
  final ChatType chatType;
  final Color color;
  const ChatDisplay({
    super.key,
    required this.messageDetailModel,
    required this.chatType,
    this.color = const Color(0xffF9F6F4),
  });

  @override
  Widget build(BuildContext context) {
    switch (chatType) {
      case ChatType.start:
        return _buildStart(messageDetailModel: messageDetailModel);
      case ChatType.end:
        return _buildEnd(messageDetailModel: messageDetailModel);
    }
  }

  Widget _buildStart({
    required MessageDetailModel messageDetailModel,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          child: CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(messageDetailModel.thumnail),
          ),
        ),
        const SizedBox(
          width: XPadding.large,
        ),
        _buildFlexibleText(),
      ],
    );
  }

  Widget _buildEnd({
    required MessageDetailModel messageDetailModel,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        _buildFlexibleText(),
        const SizedBox(
          width: XPadding.large,
        ),
        SizedBox(
          child: CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(messageDetailModel.thumnail),
          ),
        ),
      ],
    );
  }

  Widget _buildFlexibleText() {
    return messageDetailModel.message.length > 30
        ? Expanded(
            child: Container(
              margin: messageDetailModel.isSender
                  ? const EdgeInsets.only(left: 50)
                  : const EdgeInsets.only(right: 50),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: color,
              ),
              child: XTextMedium(
                padding: const EdgeInsets.all(XPadding.medium),
                text: messageDetailModel.message,
                overflow: null,
              ),
            ),
          )
        : Container(
            margin: messageDetailModel.isSender
                ? const EdgeInsets.only(left: 50)
                : const EdgeInsets.only(right: 50),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: color,
            ),
            child: XTextMedium(
              padding: const EdgeInsets.all(XPadding.medium),
              text: messageDetailModel.message,
              overflow: null,
            ),
          );
  }
}
