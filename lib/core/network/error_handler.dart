import 'package:dio/dio.dart';
import 'package:project/core/network/failure.dart';
import 'package:project/core/network/network_execption.dart';

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      // dio error so its an error from response of the API or from dio itself
      failure = _handleError(error);
    } else {
      // default error
      failure = NetworkErrorType.DEFAULT.getFailure();
    }
  }
}

Failure _handleError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionError:
      return NetworkErrorType.NO_INTERNET_CONNECTION.getFailure();
    case DioExceptionType.connectionTimeout:
      return NetworkErrorType.CONNECT_TIMEOUT.getFailure();
    case DioExceptionType.sendTimeout:
      return NetworkErrorType.SEND_TIMEOUT.getFailure();
    case DioExceptionType.receiveTimeout:
      return NetworkErrorType.RECIEVE_TIMEOUT.getFailure();
    case DioExceptionType.badResponse:
      if (error.response != null &&
          error.response?.statusCode != null &&
          error.response?.statusMessage != null) {
        return Failure(error.response?.statusCode ?? 0,
            error.response?.statusMessage ?? "");
      } else {
        return NetworkErrorType.DEFAULT.getFailure();
      }
    case DioExceptionType.cancel:
      return NetworkErrorType.CANCEL.getFailure();
    default:
      return NetworkErrorType.DEFAULT.getFailure();
  }
}
