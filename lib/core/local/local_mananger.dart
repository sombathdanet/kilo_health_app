import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageManageer {
  Future<SharedPreferences> getSp() async => SharedPreferences.getInstance();

  LocalStorageManageer._();

  static final instance = LocalStorageManageer._();

  Future<bool> setString(String key, String value) async {
    final pref = await getSp();
    return pref.setString(key, value);
  }

  Future<bool> setStringList(String key, List<String> value) async {
    final pref = await getSp();
    return pref.setStringList(key, value);
  }

  Future<List<String>> getStringList(String key) async {
    final pref = await getSp();
    return pref.getStringList(key) ?? [];
  }

  Future<String> getString(String key) async {
    final pref = await getSp();
    return pref.getString(key) ?? "";
  }

  void removeByKey(String key) async {
    final pref = await getSp();
    pref.remove(key);
  }

  void setBool(String key, bool value) async {
    final pref = await getSp();
    pref.setBool(key, value);
  }

  Future<bool> getbool(String key) async {
    final pref = await getSp();
    return pref.getBool(key) ?? false;
  }
}
