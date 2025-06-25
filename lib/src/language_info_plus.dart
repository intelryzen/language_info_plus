import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:language_info_plus/src/model/language_model.dart';
import 'package:language_info_plus/src/resource/english_names.dart';

abstract class LanguageInfoPlus {
  static final List<Language> _languages = [];
  static final Map<String, String> _localizedNames = {};

  static Locale get _deviceLocale =>
      WidgetsBinding.instance.platformDispatcher.locale;

  static bool get isLocalizationSupported => _localizedNames.isNotEmpty;

  static String _getAssetPath(String languageCode) {
    return 'packages/language_info_plus/assets/localized_names/$languageCode.json';
  }

  /// Initialize localized names based on the device's language
  static Future<void> _initializeLocalizedName() async {
    try {
      final String assetPath = _getAssetPath(_deviceLocale.languageCode);
      final String jsonString = await rootBundle.loadString(assetPath);
      _localizedNames.clear();
      _localizedNames.addAll(Map<String, String>.from(json.decode(jsonString)));
      return;
    } catch (_) {}
  }

  /// Returns a list of all available languages.
  static List<Language> get languages {
    if (_languages.isEmpty) {
      englishNames.forEach((code, name) {
        _languages.add(
          Language.fromMap(
            {"code": code, "name": name},
            localizedName: _localizedNames[code],
          ),
        );
      });
    }
    return _languages;
  }

  /// The current device locale derived from WidgetsBinding.instance.platformDispatcher.locale.
  static Locale get deviceLocale => _deviceLocale;

  /// Attempts to match the device's language code to a Language. Returns null if not found.
  static Language get deviceLanguage {
    final languageCode = _deviceLocale.languageCode;
    return getLanguageByCode(languageCode)!;
  }

  /// Fetches a Language by its Language code (e.g., "en", "ko", "zh", "zh-TW"). Returns null if not found.
  static Language? getLanguageByCode(String languageCode) {
    final String? name = englishNames[languageCode];
    if (name == null) {
      return null;
    }
    return Language.fromMap(
      {
        "name": name,
        "code": languageCode,
      },
      localizedName: _localizedNames[languageCode],
    );
  }
}

/// Loads localized language names based on the device’s language. Must be called before accessing localizedName.
/// It is recommended to call this function in the main function before running the app.
Future<void> initializeLanguage() async {
  await LanguageInfoPlus._initializeLocalizedName();
}
