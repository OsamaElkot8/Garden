import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Settings extends Equatable {
  final Locale locale;
  final ThemeMode theme;

  const Settings({required this.locale, required this.theme});

  @override
  List<Object?> get props => [locale, theme];
}
