abstract class NetWorkInterFace {
  Future<dynamic> get(
      {required String path, Map<String, dynamic>? queryParameters});
}
