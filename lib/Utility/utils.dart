import 'dart:convert';
import 'package:flutterinterviewdemo/Model/UserData.dart';
import 'package:gson/gson.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefUtils {
  SharedPreferences _preferences;
  Gson gson = new Gson();
  String get keyUsers => "keyUsers";

  Future<void> init() async {
    _preferences ??= await SharedPreferences.getInstance();
  }

  void clearPreferenceAndDB() async {
    _preferences.clear();
  }

  Future<void> saveUsers(List<UserData> users) async {
    _preferences = await SharedPreferences.getInstance();
    _preferences.setString(keyUsers, json.encode(users));
  }

  Future<List<UserData>> getUsersData() async {
    _preferences = await SharedPreferences.getInstance();
    var locJson = json.decode(_preferences.getString(keyUsers));
    return locJson != null
        ? (locJson as List).map((i) => UserData.fromJson(i)).toList()
        : null;
  }
}
