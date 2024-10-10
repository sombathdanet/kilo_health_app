import 'package:project/core/network/network_config.dart';

class SearchEndPoint {
  static const searchEndPoint =
      "${NetWorkConfig.front}/${NetWorkConfig.blog}/api/${NetWorkConfig.version}/posts/search";

  static const searchKey = "keyword";
  static const page = "page";
  static const size = "size";

  static const getCategory =
      "${NetWorkConfig.front}/${NetWorkConfig.blog}/api/${NetWorkConfig.version}/categories";
}
