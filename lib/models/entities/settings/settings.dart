import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Settings extends Equatable {
  late Locale locale;
  late ThemeMode theme;

  Settings({required this.locale, required this.theme});

  @override
  // TODO: implement props
  List<Object?> get props => [locale, theme];
}
