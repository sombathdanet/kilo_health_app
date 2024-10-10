import 'package:project/core/network/network_config.dart';

class HomeEndPoint {
  static const getHomeGrid =
      "${NetWorkConfig.front}/${NetWorkConfig.blog}/api/${NetWorkConfig.version}/posts/blog";
  static const getGridDetail =
      "${NetWorkConfig.front}/${NetWorkConfig.blog}/api/${NetWorkConfig.version}/posts/blog/";

  static const getSlider =
      "${NetWorkConfig.front}/${NetWorkConfig.blog}/api/${NetWorkConfig.version}/info";
}
