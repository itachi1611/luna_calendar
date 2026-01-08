import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:luna_calendar/services/db/storage_service.dart';

part 'app_state.dart';

/// Manages the global application state including locale and theme preferences.
class AppCubit extends Cubit<AppState> {
  late final StorageService _storage;
  
  /// Creates an instance of [AppCubit] with default state.
  AppCubit() : super(const AppState()) {
    _storage = StorageService();
  }

  /// Initializes the cubit by loading saved preferences.
  /// Should be called right after the app starts.
  Future<void> init() async {
    try {
      // Load saved locale if exists, otherwise use default
      if (_storage.hasKey(StorageKey.locale)) {
        final savedLocale = await _storage.read<String>(StorageKey.locale, 'en');
        if (savedLocale != null) {
          emit(state.copyWith(locale: Locale(savedLocale)));
          return;
        }
      }
      
      // Set default locale
      await _updateLocale(const Locale('en', ''));
    } catch (e) {
      debugPrint('Error initializing AppCubit: $e');
      // Fallback to default locale in case of error
      emit(state.copyWith(locale: const Locale('en', '')));
    }
  }

  /// Updates the application locale and saves it to storage.
  /// [newLocale] The new locale to set.
  Future<void> updateLocale(Locale newLocale) async {
    if (state.locale?.languageCode == newLocale.languageCode) return;
    
    try {
      await _updateLocale(newLocale);
    } catch (e) {
      debugPrint('Failed to update locale: $e');
      rethrow;
    }
  }

  /// Internal method to update locale and persist it.
  Future<void> _updateLocale(Locale locale) async {
    await _storage.write(StorageKey.locale, locale.languageCode);
    emit(state.copyWith(locale: locale));
  }
}
