import 'package:flutter/material.dart';
import 'package:garden/models/entities/settings/settings.dart';
import 'package:garden/models/utilities/language/languages.dart';
import 'package:garden/models/utilities/settings/settings_manager.dart';
import 'package:garden/models/utilities/shared_preferences/shared_preferences.dart';

class SettingsService extends SettingsManager {
  static final SettingsService instance = SettingsService._internal();

  factory SettingsService() {
    return instance;
  }

  SettingsService._internal();

  @override
  Settings defaultSettings() {
    Locale _locale = Locale(EnumLanguage.english.localeValue());
    ThemeMode _theme = ThemeMode.light;
    return Settings(locale: _locale, theme: _theme);
  }

  @override
  Future<Settings> fetchSettings() async {
    Locale _locale = await SharedPreferences.instance.getLocale();
    ThemeMode _theme = await SharedPreferences.instance.getTheme();
    return Settings(locale: _locale, theme: _theme);
  }
}
