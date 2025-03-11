// import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';

// class Store {
//   SharedPreferences? _prefs;

//   static final Store _instance = Store._internal();

//   factory Store() => _instance;

//   Store._internal();

//   Future<void> _initializePrefs() async {
//     _prefs ??= await SharedPreferences.getInstance();
//   }

//   Future<void> _insert(Map<String, dynamic> data) async {
//     await _initializePrefs();
//     data.forEach((key, value) {
//       _prefs?.setString(key, value.toString());
//     });
//   }

//   Future<void> _set(String key, dynamic value) async {
//     await _initializePrefs();

//     Map<String, dynamic> data = {
//       "value": value,
//       "type": "${value.runtimeType}",
//     };

//     _prefs?.setString(key, json.encode(data));
//   }

//   Future<dynamic> _get(String key) async {
//     await _initializePrefs();

//     String? jsonString = _prefs?.getString(key);
//     if (jsonString == null) return null;

//     Map<String, dynamic> data;
//     try {
//       data = json.decode(jsonString);
//     } catch (e) {
//       return null;
//     }

//     switch (data["type"]) {
//       case "String":
//         return data["value"];
//       case "int":
//         return int.tryParse(data["value"]);
//       case "double":
//         return double.tryParse(data["value"]);
//       case "bool":
//         return data["value"] == "true";
//       default:
//         return null;
//     }
//   }

//   Future<void> _remove(String key) async {
//     await _initializePrefs();
//     _prefs?.remove(key);
//   }

//   static Future<void> insert(Map<String, dynamic> data) async =>
//       _instance._insert(data);
//   static Future<void> set(String key, dynamic value) async =>
//       _instance._set(key, value);
//   static Future<dynamic> get(String key) async => _instance._get(key);
//   static Future<void> remove(String key) async => _instance._remove(key);
// }
