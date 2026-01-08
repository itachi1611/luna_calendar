import 'dart:async';

import 'package:get_storage/get_storage.dart';

import '../../models/storage_exception.dart';

/// Storage keys used throughout the application
enum StorageKey {
  /// Key for first launch
  firstLaunch('FIRST_LAUNCH'),

  /// Key for storing user theme preference
  themeMode('THEME_MODE'),

  /// Key for storing user locale
  locale('LOCALE');

  final String key;
  const StorageKey(this.key);
}

/// A service class for handling persistent storage operations
///
/// This class provides type-safe methods to read/write various data types (String, int, double, Map and List)
/// to the device's local storage using GetStorage.
class StorageService {
  // Private constructor
  StorageService._();

  // Singleton instance
  static final StorageService _instance = StorageService._();

  // Factory constructor to return the same instance
  factory StorageService() => _instance;

  // GetStorage instance
  final GetStorage _storage = GetStorage('fox');

  /// Initialize storage service
  ///
  /// Must be called before using any storage operations
  Future<void> init() async {
    await GetStorage.init();
  }

  // Clear the entire storage box
  Future<void> clearStorage() async {
    try {
      await _storage.erase();
    } catch (e) {
      throw StorageException('Failed to clear storage', e);
    }
  }

  // Clear a specific key
  Future<void> clearKey(StorageKey storageKey) async {
    try {
      await _storage.remove(storageKey.key);
    } catch (e) {
      throw StorageException('Failed to clear key: ${storageKey.key}', e);
    }
  }

  Future<void> get clearAllKey async {
    try {
      for (var key in StorageKey.values) {
        await clearKey(key);
      }
    } catch (e) {
      throw StorageException('Failed to clear all keys', e);
    }
  }

  /// Write data to storage with type safety
  Future<void> write<T>(StorageKey storageKey, T data) async {
    try {
      return await _storage.write(storageKey.key, data);
    } catch(e) {
      throw StorageException('Failed to write value for key: ${storageKey.key}', e);
    }
  }

  /// Read data from storage with type safety
  Future<T?> read<T>(StorageKey storageKey, T? defaultValue) async {
    try {
      return _storage.read<T>(storageKey.key) ?? defaultValue;
    } catch(e) {
      throw StorageException('Failed to read value for key: ${storageKey.key}', e);
    }
  }

  /// Check if a key exists in storage
  bool hasKey(StorageKey storageKey) {
    return _storage.hasData(storageKey.key);
  }
}