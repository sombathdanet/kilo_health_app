import 'package:flutter/material.dart';
import 'package:project/feature/message/component/story_trending.dart';

class StoryViewItem extends StatefulWidget {
  final StroyTrendingModel storyViewItem;
  const StoryViewItem({super.key, required this.storyViewItem});

  @override
  State<StoryViewItem> createState() => _StoryViewItemState();
}

class _StoryViewItemState extends State<StoryViewItem>
    with TickerProviderStateMixin {
  late List<AnimationController> _controllers;
  late List<Animation<double>> _animations;
  final int _numberOfIndicators = 5; // Number of progress indicators
  bool _loadingComplete = false; // To track loading state

  AnimationController find(){
    
  }

  @override
  void initState() {
    super.initState();

    _controllers = List.generate(_numberOfIndicators, (index) {
      AnimationController controller = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 1), // Duration for each animation
      )..addListener(() {
          setState(() {});
        });

      // Start the animation after a delay based on the index
      Future.delayed(Duration(seconds: index * 2), () {
        controller.forward().then((_) {
          // After completing this animation, check if more animations are left

          if (index < _numberOfIndicators - 1) {
            _controllers[index + 1].forward(); // Start the next animation
          } else {
            setState(() {
              _loadingComplete = true; // All animations complete
            });
          }
        });
      });

      return controller;
    });
  }

  @override
  void dispose() {
    // Dispose of all AnimationControllers
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Multiple LinearProgressIndicators'),
      ),
      body: Row(
        children: List.generate(_numberOfIndicators, (index) {
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 1),
              child: LinearProgressIndicator(
                borderRadius: BorderRadius.circular(10),
                value: _controllers[index].value, // Set the progress value
                minHeight: 10, // Height of the progress indicator
              ),
            ),
          );
        }),
      ),
    );
  }
}
