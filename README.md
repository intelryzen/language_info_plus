# Language Info Plus Flutter Package

[![pub package](https://img.shields.io/pub/v/language_info_plus.svg)](https://pub.dev/packages/language_info_plus)
[![Score](https://img.shields.io/pub/points/language_info_plus?label=Score&logo=dart)](https://pub.dev/packages/language_info_plus/score)
[![Platform](https://img.shields.io/badge/Platform-Android%20|%20iOS%20|%20macOS%20|%20Web%20|%20Windows%20|%20Linux%20-blue.svg?logo=flutter)](https://pub.dev/packages/language_info_plus)
![GitHub stars](https://img.shields.io/github/stars/intelryzen/language_info_plus)
![GitHub forks](https://img.shields.io/github/forks/intelryzen/language_info_plus)
![GitHub issues](https://img.shields.io/github/issues/intelryzen/language_info_plus)
![GitHub pull requests](https://img.shields.io/github/issues-pr/intelryzen/language_info_plus)

`language_info_plus` is a Flutter package designed to provide a comprehensive list of world languages with localized names and ISO 639-1 codes. It helps developers display language information customized to the user's device locale.

<img src="https://github.com/intelryzen/language_info_plus/blob/main/screenshots/demo.png?raw=true" alt="demo" width="250"/>

---

## Features

- **Extensive Language Data**: Access a wide range of languages with their ISO codes and English names.
- **Localization**: Optionally load localized language names based on the device's locale.
- **Easy Integration**: Simplified APIs to access all languages, the device language, or retrieve a language by its code.
- **Optional Initialization**: Call `initializeLanguage()` in your app's `main()` to load localized language names.

---

## Quick Start

### Optional: Initialize Localized Language Names
If you want to use the `localizedName` field for languages, initialize it first by loading the appropriate JSON file based on the device's locale.

```dart
import 'package:language_info_plus/language_info_plus.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // IMPORTANT: Call this to load localized language names, if needed.
  await initializeLanguage();

  runApp(const MyApp());
}
```
### Basic Usage
```dart
// Getting all available languages
List<Language> languages = LanguageInfoPlus.languages;
print('Total languages: ${languages.length}');

// Getting the device locale
Locale deviceLocale = LanguageInfoPlus.deviceLocale;
print('Device Locale: ${deviceLocale.toString()}');

// Getting the device language (based on locale)
Language deviceLanguage = LanguageInfoPlus.deviceLanguage;
print('Device Language: ${deviceLanguage.name}');

// Fetching a specific language by ISO 639-1 code
Language? languageEN = LanguageInfoPlus.getLanguageByCode('en');
print('Language Name: ${languageEN?.name}');
print('Localized Name: ${languageEN?.localizedName ?? "N/A"}');
```
---
## Public API
The `language_info_plus` library provides a set of static methods and properties through the `LanguageInfoPlus` class:
| **API**                                        | **Return Type**       | **Description**                                                                                      |
|------------------------------------------------|------------------------|------------------------------------------------------------------------------------------------------|
| `LanguageInfoPlus.languages`                      | `List<Language>`        | Returns a list of all available languages.                                                         |
| `LanguageInfoPlus.deviceLocale`                   | `Locale`               | The current device locale derived from `WidgetsBinding.instance.platformDispatcher.locale`.           |
| `LanguageInfoPlus.deviceLanguage`                  | `Language`             | Matches the device’s language code to a `Language`.       |
| `LanguageInfoPlus.getLanguageByCode(String languageCode)` | `Language?`             | Fetches a `Language` by its ISO 639-1 code (e.g., “en”, “ko”). Returns `null` if not found.          |
| `initializeLanguage()`                    | `Future<void>`         | Loads localized language names. Must be called **before** accessing `localizedName`. Recommended in main(). |

---
## Language Model
Each language is represented by the `Language` class with the following properties:
| **Property**     | **Type**        | **Description**                                                                   |
|------------------|-----------------|-----------------------------------------------------------------------------------|
| `code`          | `String`        | ISO 639-1 code (e.g., `en`, `ko`).                                                |
| `name`          | `String`        | English name of the language (e.g., `English`, `Korean`).                         |
| `localizedName` | `String?`       | Localized name of the language (e.g., `한국어`). Nullable if not initialized.       |

**Example usage of** `Language`:
```dart
// Assuming the device locale's language is zh.
final language = LanguageInfoPlus.getLanguageByCode('en');
if (language != null) {
  print('Code: ${language.code}'); // en
  print('Name: ${language.name}'); // English
  print('Localized Name: ${language.localizedName ?? "No localized name loaded"}'); // 英语
}
```

---
## Contributions
Contributions are welcome! Please open **[issues](https://github.com/intelryzen/language_info_plus/issues)** and **[pull requests](https://github.com/intelryzen/language_info_plus/pulls)** to improve this package.

---
