import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetWorkInfo {
  Future<bool> get isConnected;
}

class NetWrokInfoImpl extends NetWorkInfo {
  
  final InternetConnectionChecker _internetConnectionChecker;

  NetWrokInfoImpl(this._internetConnectionChecker);

  @override
  Future<bool> get isConnected => _internetConnectionChecker.hasConnection;
}
