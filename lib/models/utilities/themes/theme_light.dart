import 'package:flutter/material.dart';
import 'package:garden/ui/ui_constants.dart';

ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: UiConstants.colorPrimary,
    scaffoldBackgroundColor: UiConstants.colorBackground,
    colorScheme: const ColorScheme.light(
        primary: UiConstants.colorPrimary,
        secondary: UiConstants.colorSecondary,
        onSecondary: UiConstants.colorOnSecondary,
        background: UiConstants.colorBackground,
        error: UiConstants.colorError),
    textTheme: const TextTheme(
      bodyText1: UiConstants.textStyleBodyText1,
      bodyText2: UiConstants.textStyleBodyText2,
      subtitle1: UiConstants.textStyleSubtitle1,
      headline2: UiConstants.textStyleHeadline2,
      headline3: UiConstants.textStyleHeadline3,
      headline4: UiConstants.textStyleHeadline4,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: UiConstants.inputBorderInputDecoration,
      focusedBorder: UiConstants.inputBorderInputDecoration,
      hintStyle: UiConstants.textStyleInputDecorationHintStyle,
      helperStyle: UiConstants.textStyleInputDecorationHelperStyle,
      prefixIconColor: UiConstants.colorInputDecorationHintIconColor,
    ),
    appBarTheme: const AppBarTheme(
        backgroundColor: UiConstants.colorAppBarBackground,
        titleTextStyle: UiConstants.textStyleAppBarTitleTextStyle,
        iconTheme: IconThemeData(color: UiConstants.colorAppBarIcon),
        centerTitle: UiConstants.booleanAppBarCenterTitle),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: UiConstants.colorFloatingActionButtonBackground,
        extendedTextStyle:
            UiConstants.textStyleFloatingActionButtonExtendedTextStyle));
