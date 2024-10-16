import 'dart:io';

import 'package:flutter/material.dart';
import 'package:project/feature/desboard/desboard_screen.dart';
import 'package:project/feature/health/presentation/detail/health_detail.dart';
import 'package:project/feature/message/component/story_trending.dart';
import 'package:project/feature/message/message_detail_screen/message_detail.dart';
import 'package:project/feature/health/presentation/search_screen.dart/search_screen.dart';
import 'package:project/feature/health/presentation/submit_screen/onsubmit_screen.dart';
import 'package:project/feature/message/stories_edit_screen/storie_edit_screen.dart';
import 'package:project/feature/message/story_view/component/page_view_builder.dart';

class AppRoutes {
  static const String desboard = '/';
  static const String healthDetail = '/healthDetail';
  static const String searchScreen = "/searchScreen";
  static const String messageDetailScreen = "/MessageDetailScreen";
  static const String seachPopScreen = "/seachPopScreen";
  static const String stroyEditScreen = "/storyEditScreen";
  static const String storyViewScreen = "/storyViewScreen";

  static void gotoEditStoryScreen(File file, BuildContext context) =>
      Navigator.of(context).pushNamed(stroyEditScreen);

  static void gotoStoryView({
    required List<StroyTrendingModel> args,
    required BuildContext context,
  }) {
    Navigator.of(context).pushNamed(
      storyViewScreen,
      arguments: args,
    );
  }
}

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.seachPopScreen:
        final args = settings.arguments as String?;
        return MaterialPageRoute(
          builder: (_) => SubmitSearchScreen(
            qurey: args,
          ),
        );
      case AppRoutes.desboard:
        return MaterialPageRoute(
          builder: (_) => const DesBoardScreen(),
        );
      case AppRoutes.healthDetail:
        final args = settings.arguments as String?;
        return MaterialPageRoute(
          builder: (_) => HeathDetail(
            id: args,
          ),
        );
      case AppRoutes.searchScreen:
        return MaterialPageRoute(
          builder: (_) => const SearchScreen(),
        );
      case AppRoutes.messageDetailScreen:
        return MaterialPageRoute(
          builder: (_) => const MessageDetailScreen(),
        );
      case AppRoutes.stroyEditScreen:
        final file = settings.arguments as File;
        return MaterialPageRoute(
          builder: (_) => StoryEditScreen(file: file),
        );
      case AppRoutes.storyViewScreen:
        final args = settings.arguments as List<StroyTrendingModel>;
        return MaterialPageRoute(
          builder: (_) => StoryViewScreen(
            storytrendingItme: args,
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
