import 'package:shared_preferences/shared_preferences.dart';

/// A service class that provides a clean API for working with SharedPreferences.
/// This class handles all the common operations for storing and retrieving data.
class SharedPrefService {
  static SharedPreferences? _prefs;
  static SharedPrefService? _instance;

  /// Private constructor to prevent direct instantiation
  SharedPrefService._();

  /// Factory constructor to ensure a single instance of SharedPrefService
  factory SharedPrefService() {
    _instance ??= SharedPrefService._();
    return _instance!;
  }

  /// Initialize SharedPreferences instance
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Getters
  /// Generic method to read a value of type T from SharedPreferences
  /// Supports: bool, int, double, String, and `List<String>`
  T? read<T>(String key) {
    if (_prefs == null) return null;
    
    try {
      switch (T) {
        case const (bool):
          return _prefs!.getBool(key) as T?;
        case const (int):
          return _prefs!.getInt(key) as T?;
        case const (double):
          return _prefs!.getDouble(key) as T?;
        case const (String):
          return _prefs!.getString(key) as T?;
        case const (List<String>):
          return _prefs!.getStringList(key) as T?;
        default:
          throw UnsupportedError('Type ${T.toString()} is not supported');
      }
    } catch (e) {
      return null;
    }
  }

  // Generic write method that handles all supported types
  /// Writes a value of type T to SharedPreferences
  /// Supports: bool, int, double, String, and `List<String>`
  Future<bool> write<T>(String key, T value) async {
    if (_prefs == null) return false;

    try {
      switch (T) {
        case const (bool):
          return await _prefs!.setBool(key, value as bool);
        case const (int):
          return await _prefs!.setInt(key, value as int);
        case const (double):
          return await _prefs!.setDouble(key, value as double);
        case const (String):
          return await _prefs!.setString(key, value as String);
        case const (List<String>):
          return await _prefs!.setStringList(key, value as List<String>);
        default:
          throw UnsupportedError('Type ${T.toString()} is not supported for writing');
      }
    } catch (e) {
      return false;
    }
  }

  /// Removes an entry from persistent storage
  /// Returns true if the key was removed successfully, false otherwise
  Future<bool> remove(String key) async {
    if (_prefs == null) return false;
    try {
      return await _prefs!.remove(key);
    } catch (e) {
      return false;
    }
  }

  /// Checks if the persistent storage contains the given key
  /// Returns true if the key exists, false otherwise
  bool containsKey(String key) {
    if (_prefs == null) return false;
    try {
      return _prefs!.containsKey(key);
    } catch (e) {
      return false;
    }
  }

  /// Clears all data from SharedPreferences
  /// Returns true if the operation was successful, false otherwise
  Future<bool> clear() async {
    if (_prefs == null) return false;
    try {
      return await _prefs!.clear();
    } catch (e) {
      return false;
    }
  }

  /// Gets all keys stored in SharedPreferences
  Set<String>? getKeys() => _prefs?.getKeys();
}