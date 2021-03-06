import 'package:flutter/material.dart';
import 'package:garden/models/utilities/language/language_en.dart';
import 'package:garden/models/utilities/language/language_fr.dart';
import 'package:garden/models/utilities/language/languages.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate<Languages> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => [
        EnumLanguage.english.localeValue(),
        EnumLanguage.french.localeValue()
      ].contains(locale.languageCode);

  @override
  Future<Languages> load(Locale locale) {
    return _locale(locale);
  }

  Future<Languages> _locale(Locale locale) async {
    switch (locale.languageCode.toLowerCase()) {
      case 'fr':
        return LanguageFr();
      default:
        return LanguageEn();
    }
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate old) => false;
}
