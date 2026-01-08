// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Fox Luna`
  String get appName {
    return Intl.message('Fox Luna', name: 'appName', desc: '', args: []);
  }

  /// `Add`
  String get btnAdd {
    return Intl.message('Add', name: 'btnAdd', desc: '', args: []);
  }

  /// `Back`
  String get btnBack {
    return Intl.message('Back', name: 'btnBack', desc: '', args: []);
  }

  /// `Cancel`
  String get btnCancel {
    return Intl.message('Cancel', name: 'btnCancel', desc: '', args: []);
  }

  /// `Create`
  String get btnCreate {
    return Intl.message('Create', name: 'btnCreate', desc: '', args: []);
  }

  /// `Delete`
  String get btnDelete {
    return Intl.message('Delete', name: 'btnDelete', desc: '', args: []);
  }

  /// `Done`
  String get btnDone {
    return Intl.message('Done', name: 'btnDone', desc: '', args: []);
  }

  /// `Edit`
  String get btnEdit {
    return Intl.message('Edit', name: 'btnEdit', desc: '', args: []);
  }

  /// `Next`
  String get btnNext {
    return Intl.message('Next', name: 'btnNext', desc: '', args: []);
  }

  /// `OK`
  String get btnOk {
    return Intl.message('OK', name: 'btnOk', desc: '', args: []);
  }

  /// `Remove`
  String get btnRemove {
    return Intl.message('Remove', name: 'btnRemove', desc: '', args: []);
  }

  /// `Save`
  String get btnSave {
    return Intl.message('Save', name: 'btnSave', desc: '', args: []);
  }

  /// `Skip`
  String get btnSkip {
    return Intl.message('Skip', name: 'btnSkip', desc: '', args: []);
  }

  /// `Submit`
  String get btnSubmit {
    return Intl.message('Submit', name: 'btnSubmit', desc: '', args: []);
  }

  /// `Update`
  String get btnUpdate {
    return Intl.message('Update', name: 'btnUpdate', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ja'),
      Locale.fromSubtags(languageCode: 'vi'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
