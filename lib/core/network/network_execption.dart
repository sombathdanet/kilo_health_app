// ignore_for_file: constant_identifier_names
import 'package:project/core/network/failure.dart';
import 'package:project/utils/resource/app_string.dart';

enum NetworkErrorType {
  SUCCESS,
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTORISED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  CONNECT_TIMEOUT,
  CANCEL,
  RECIEVE_TIMEOUT,
  SEND_TIMEOUT,
  CACHE_ERROR,
  NO_INTERNET_CONNECTION,
  DEFAULT
}

extension DataSourceExtension on NetworkErrorType {
  getFailure() {
    switch (this) {
      case NetworkErrorType.SUCCESS:
        return Failure(
          ResponseCode.SUCCESS,
          ResponseMessage.SUCCESS,
        );
      case NetworkErrorType.NO_CONTENT:
        return Failure(
          ResponseCode.NO_CONTENT,
          ResponseMessage.NO_CONTENT,
        );
      case NetworkErrorType.BAD_REQUEST:
        return Failure(
          ResponseCode.BAD_REQUEST,
          ResponseMessage.BAD_REQUEST,
        );
      case NetworkErrorType.FORBIDDEN:
        return Failure(
          ResponseCode.FORBIDDEN,
          ResponseMessage.FORBIDDEN,
        );
      case NetworkErrorType.UNAUTORISED:
        return Failure(
          ResponseCode.UNAUTORISED,
          ResponseMessage.UNAUTORISED,
        );
      case NetworkErrorType.NOT_FOUND:
        return Failure(
          ResponseCode.NOT_FOUND,
          ResponseMessage.NOT_FOUND,
        );
      case NetworkErrorType.INTERNAL_SERVER_ERROR:
        return Failure(
          ResponseCode.INTERNAL_SERVER_ERROR,
          ResponseMessage.INTERNAL_SERVER_ERROR,
        );
      case NetworkErrorType.CONNECT_TIMEOUT:
        return Failure(
          ResponseCode.CONNECT_TIMEOUT,
          ResponseMessage.CONNECT_TIMEOUT,
        );
      case NetworkErrorType.CANCEL:
        return Failure(
          ResponseCode.CANCEL,
          ResponseMessage.CANCEL,
        );
      case NetworkErrorType.RECIEVE_TIMEOUT:
        return Failure(
          ResponseCode.RECIEVE_TIMEOUT,
          ResponseMessage.RECIEVE_TIMEOUT,
        );
      case NetworkErrorType.SEND_TIMEOUT:
        return Failure(
          ResponseCode.SEND_TIMEOUT,
          ResponseMessage.SEND_TIMEOUT,
        );
      case NetworkErrorType.CACHE_ERROR:
        return Failure(
          ResponseCode.CACHE_ERROR,
          ResponseMessage.CACHE_ERROR,
        );
      case NetworkErrorType.NO_INTERNET_CONNECTION:
        return Failure(
          ResponseCode.NO_INTERNET_CONNECTION,
          ResponseMessage.NO_INTERNET_CONNECTION,
        );
      case NetworkErrorType.DEFAULT:
        return Failure(
          ResponseCode.DEFAULT,
          ResponseMessage.DEFAULT,
        );
    }
  }
}

class ResponseCode {
  static const int SUCCESS = 200; // success with data
  static const int NO_CONTENT = 201; // success with no data (no content)
  static const int BAD_REQUEST = 400; // failure, API rejected request
  static const int UNAUTORISED = 401; // failure, user is not authorised
  static const int FORBIDDEN = 403; //  failure, API rejected request
  static const int INTERNAL_SERVER_ERROR = 500; // failure, crash in server side
  static const int NOT_FOUND = 404; // failure, not found

  // local status code
  static const int CONNECT_TIMEOUT = -1;
  static const int CANCEL = -2;
  static const int RECIEVE_TIMEOUT = -3;
  static const int SEND_TIMEOUT = -4;
  static const int CACHE_ERROR = -5;
  static const int NO_INTERNET_CONNECTION = -6;
  static const int DEFAULT = -7;
}



class ResponseMessage {
  static const String SUCCESS = AppStrings.success;
  static const String NO_CONTENT = AppStrings.success;
  static const String BAD_REQUEST = AppStrings.strBadRequestError;
  static const String UNAUTORISED = AppStrings.strUnauthorizedError;
  static const String FORBIDDEN = AppStrings.strForbiddenError;
  static const String INTERNAL_SERVER_ERROR = AppStrings.strInternalServerError;
  static const String NOT_FOUND = AppStrings.strNotFoundError;

  static const String CONNECT_TIMEOUT = AppStrings.strTimeoutError;
  static const String CANCEL = AppStrings.strDefaultError;
  static const String RECIEVE_TIMEOUT = AppStrings.strTimeoutError;
  static const String SEND_TIMEOUT = AppStrings.strTimeoutError;
  static const String CACHE_ERROR = AppStrings.strCacheError;
  static const String NO_INTERNET_CONNECTION = AppStrings.strNoInternetError;
  static const String DEFAULT = AppStrings.strDefaultError;
}