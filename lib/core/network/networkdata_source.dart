import 'dart:async';
import 'package:dio/dio.dart';
import 'package:project/core/network/error_handler.dart';
import 'package:project/core/network/network_config.dart';
import 'package:project/core/network/network_interface.dart';

class NetWorkDataSource extends NetWorkInterFace {
  late Dio _dio;

  NetWorkDataSource._() {
    _dio = Dio(BaseOptions(
        baseUrl: NetWorkConfig.baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        responseType: ResponseType.json))
      ..interceptors.addAll(
        [LogInterceptor()],
      );
  }
  static final instance = NetWorkDataSource._();

  @override
  Future<dynamic> get({
    required String path,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200) {
        return response.data;
      }
      throw ErrorHandler.handle(response);
    } on DioException catch (e) {
      throw ErrorHandler.handle(e);
    }
  }
}
