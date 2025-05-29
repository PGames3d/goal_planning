// * Refactor for a per-user basis if needed
abstract class LocalRepository {
  /// Removes all values
  Future<void> reset();

  /// Removes all values
  Future<void> resetForUser(String? userId);

  /// Removes all data
  Future<void> clearData();

  Future<void> saveString(String key, String? value);
  Future<String?> getString(String key);

  Future<void> saveBool(String key, bool? value);
  Future<bool?> getBool(String key);

  void saveInt(String key, int? value);
  Future<int?> getInt(String key);

  Future<void> saveObject(String key, Map<String, dynamic>? object);

  Future<Map<String, dynamic>?> getObject(String key);

  Future<bool> containsKey(String key);
}
