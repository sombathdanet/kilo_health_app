import 'package:flutter/material.dart';
import 'package:project/core/local/local_mananger.dart';
import 'package:project/theme/theme_color.dart';

class ThemeProvider with ChangeNotifier {
  late ThemeMode _themeMode = ThemeMode.system;
  final ThemeData _darkTheme = AppTheme.darkTheme;
  final ThemeData _lightTheme = AppTheme.lightTheme;

  ThemeMode get themeMode => _themeMode;
  ThemeData get dartkThem => _darkTheme;
  ThemeData get lightScheme => _lightTheme;
  late bool _isDarkTheme = false;

  ThemeProvider() {
    _loadTheme();
  }

  bool get isDartkThem => _isDarkTheme;

  void _loadTheme() async {
    _isDarkTheme = await LocalStorageManageer.instance.getbool("ThemeKey");
    _themeMode = _isDarkTheme ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  void chnageTheme() {
    _isDarkTheme = !_isDarkTheme;
    LocalStorageManageer.instance.setBool("ThemeKey", _isDarkTheme);
    _themeMode = _isDarkTheme ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
