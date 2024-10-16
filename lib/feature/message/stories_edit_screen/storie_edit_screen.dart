import 'dart:io';
import 'package:flutter/material.dart';
import 'package:project/core/view/padding.dart';
import 'package:project/feature/message/component/story_trending.dart';
import 'package:project/feature/message/message_screen.dart';
import 'package:project/theme/text_style/text_style.dart';
import 'package:video_player/video_player.dart';

class StoryEditScreen extends StatefulWidget {
  final File file;
  const StoryEditScreen({super.key, required this.file});

  @override
  State<StoryEditScreen> createState() => _StoryEditScreenState();
}

class _StoryEditScreenState extends State<StoryEditScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(widget.file)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.file.path.endsWith('.jpg')) {
      return SafeArea(
          child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: Center(
          child: Image.file(widget.file),
        ),
        floatingActionButton: _buildFloatingButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ));
    }
    return Container(
      color: Colors.red,
    );
  }

  Widget _buildFloatingButton() {
    final model = StroyTrendingModel(
      id: "1",
      isOnline: false,
      name: "",
      file: widget.file,
      isHasStory: true,
      thumnail: '',
    );
    return ElevatedButton(
      onPressed: () {
        ownStory.add(model);
        Navigator.pop(context);
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          XTextMedium(
            text: "Share",
            color: Colors.white,
          ),
          SizedBox(
            width: XPadding.medium,
          ),
          Icon(Icons.arrow_forward, color: Colors.white),
        ],
      ),
    );
  }
}
