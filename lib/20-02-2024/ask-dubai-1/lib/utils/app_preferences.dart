import 'dart:async';

import 'package:local/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AppPreference {
  static late SharedPreferences _prefs;

  static Future initMySharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }

  void clearSharedPreferences() {
    _prefs.clear();
    return;
  }

  static Future setString(String key, String value) async {
    await _prefs.setString(key, value);
  }

  static String getString(String key) {
    final String? value = _prefs.getString(key);
    return value ?? "";
  }

  static Future setBoolean(String key, {required bool value}) async {
    await _prefs.setBool(key, value);
  }

  static bool getBoolean(String key) {
    final bool? value = _prefs.getBool(key);
    return value ?? true;
  }

  static Future setLong(String key, double value) async {
    await _prefs.setDouble(key, value);
  }

  static double getLong(String key) {
    final double? value = _prefs.getDouble(key);
    return value ?? 0.0;
  }

  static Future setInt(String key, int value) async {
    await _prefs.setInt(key, value);
  }

  static int getInt(String key) {
    final int? value = _prefs.getInt(key);
    return value ?? 0;
  }

  static Future setUserToken(String token) async {
    await _prefs.setString(Constants.keyToken, token);
  }

  // static Future setUser(User? user) async {
  //   user?.jwtToken = "";
  //   await _prefs.setString(Constants.keyUser, jsonEncode(user));
  // }

  static String? getUserToken() {
    return _prefs.get(Constants.keyToken) as String?;
  }

  // static User? getUser() {
  //   return User.fromJson(jsonDecode(_prefs.get(Constants.keyUser) as String? ?? ""));
  // }

  static bool isUserLogin() {
    final String? getToken = getUserToken();
    return getToken != null && getToken.isNotEmpty;
  }
}
