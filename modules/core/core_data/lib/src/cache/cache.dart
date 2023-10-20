import 'dart:convert';

import 'package:core_dependency/core_dependency.dart';

abstract class CacheBehavior {
  Future save(String key, dynamic value);

  Future<T?> read<T>(String key);

  Future<void> remove(String key);
}

class Cache implements CacheBehavior {
  @override
  Future save(String key, dynamic value) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    if (value is int) {
      sharedPreferences.setInt(key, value);
    } else if (value is double) {
      sharedPreferences.setDouble(key, value);
    } else if (value is bool) {
      sharedPreferences.setBool(key, value);
    } else if (value is String) {
      sharedPreferences.setString(key, value);
    } else if (value is DateTime) {
      sharedPreferences.setString(key, value.toString());
    } else {
      sharedPreferences.setString(key, json.encode(value));
    }
  }

  @override
  Future<T?> read<T>(String key) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final dynamic value;
    final type = T.toString();
    if (type.contains('int')) {
      value = sharedPreferences.getInt(key);
    } else if (type.contains('double')) {
      value = sharedPreferences.getDouble(key);
    } else if (type.contains('bool')) {
      value = sharedPreferences.getBool(key);
    } else if (type.contains('DateTime')) {
      value = DateTime.tryParse(sharedPreferences.getString(key) ?? '');
    } else {
      value = sharedPreferences.getString(key);
    }
    return value;
  }

  @override
  Future<void> remove(String key) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove(key);
  }
}
