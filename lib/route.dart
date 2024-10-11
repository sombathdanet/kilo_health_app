import 'package:flutter/material.dart';
import 'package:project/feature/desboard/desboard_screen.dart';
import 'package:project/feature/health/presentation/detail/health_detail.dart';
import 'package:project/feature/message/message_detail_screen/message_detail.dart';
import 'package:project/feature/health/presentation/search_screen.dart/search_screen.dart';
import 'package:project/feature/health/presentation/submit_screen/onsubmit_screen.dart';

class AppRoutes {
  static const String desboard = '/';
  static const String healthDetail = '/healthDetail';
  static const String searchScreen = "/searchScreen";
  static const String messageDetailScreen = "/MessageDetailScreen";
  static const String seachPopScreen = "/seachPopScreen";
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
