import 'dart:convert';
import 'package:goal_planning/core/utils/is_null_or_empty.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'local_repository.dart';

class SecuredLocalRepository implements LocalRepository {
  SecuredLocalRepository(this._prefs);

  // Allows easy mocking for testing
  final FlutterSecureStorage _prefs;

  @override
  Future<void> reset() async {
    await _prefs.deleteAll();
    return;
  }

  @override
  Future<void> resetForUser(String? userId) async {
    return;
  }

  @override
  Future<void> saveString(String key, [String? value]) async {
    if (value != null) {
      await _prefs.write(key: key, value: value);
    } else {
      await _prefs.delete(key: key);
    }
    return;
  }

  @override
  Future<String?> getString(String key) async {
    return await _prefs.read(key: key);
  }

  // * MARK: Bool Handler

  @override
  Future<void> saveBool(String key, [bool? value]) async {
    if (value != null) {
      await _prefs.write(key: key, value: value ? "1" : "0");
    } else {
      await _prefs.delete(key: key);
    }
    return;
  }

  @override
  Future<bool> getBool(String key) async {
    return (await _prefs.read(key: key) ?? "0") == "1";
  }

  // * MARK: Int Handler

  @override
  Future<int?> getInt(String key) async {
    return int.tryParse(await _prefs.read(key: key) ?? '');
  }

  @override
  void saveInt(String key, [int? value]) async {
    if (value != null) {
      await _prefs.write(key: key, value: value.toString());
    } else {
      await _prefs.delete(key: key);
    }
    return;
  }

  // * MARK: Object Handler

  @override
  Future<void> saveObject(String key, [Map<String, dynamic>? object]) async {
    if (object != null) {
      return await _prefs.write(
          key: key, value: const JsonEncoder().convert(object));
    } else {
      return await _prefs.delete(key: key);
    }
  }

  @override
  Future<Map<String, dynamic>?> getObject(String key) async {
    final String? stringObject = await _prefs.read(key: key);
    if (stringObject.emptyIfNullString.isEmpty) return null;
    return const JsonDecoder().convert(stringObject!) as Map<String, dynamic>;
  }

  @override
  Future<void> clearData() async {
    await _prefs.deleteAll();
    return;
  }

  @override
  Future<bool> containsKey(String key) async {
    return await _prefs.containsKey(key: key);
  }
}
