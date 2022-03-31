import 'package:flutter/material.dart';

class UiConstants {
  static const Color colorPrimary = Color(0xff0C3A69);
  static const Color colorSecondary = Colors.grey;
  static const Color colorOnSecondary = Color(0xffeeeeee);
  static const Color colorBackground = Colors.white;
  static const Color colorError = Colors.red;
  static const Color colorTransparent = Colors.transparent;
  static const Color colorAppBarBackground = Color(0xff0C3A69);
  static const Color colorAppBarTitleText = Colors.white;
  static const Color colorAppBarIcon = Colors.white;
  static const Color colorFloatingActionButtonBackground = Color(0xff0C3A69);
  static const Color colorFloatingActionButtonExtendedText = Colors.white;
  static const Color colorInputDecorationHintStyleColor = Colors.grey;
  static const Color colorInputDecorationHintIconColor = Colors.grey;
  static const Color colorInputDecorationBorderSide = Color(0xff0C3A69);
  static const Color colorSubtitle1 = Colors.black;
  static const Color colorHeadline2 = Color(0xff0C3A69);
  static const Color colorHeadline4 = Color(0xff0C3A69);
  static const Color colorInputDecorationHelperStyle = Colors.grey;
  static const Color colorTextButtonTextStyle = Colors.white;

  static const TextStyle textStyleHeadline2 = TextStyle(
      color: colorHeadline2,
      fontSize: 30.0,
      fontFamily: 'PTSans',
      fontWeight: FontWeight.w500);
  static const TextStyle textStyleHeadline3 = TextStyle(
      color: Colors.black,
      fontSize: 22.0,
      fontFamily: 'PTSans',
      fontWeight: FontWeight.bold);
  static const TextStyle textStyleHeadline4 = TextStyle(
      color: colorHeadline4,
      fontSize: 16.0,
      fontFamily: 'PTSans',
      fontWeight: FontWeight.bold);
  static const TextStyle textStyleBodyText1 = TextStyle(
      color: Colors.black, fontFamily: 'PTSans', fontWeight: FontWeight.w600);
  static const TextStyle textStyleBodyText2 = TextStyle(
      color: colorPrimary, fontFamily: 'PTSans', fontWeight: FontWeight.w600);
  static const TextStyle textStyleSubtitle1 = TextStyle(
      color: colorSubtitle1,
      fontFamily: 'PTSans',
      fontWeight: FontWeight.w600,
      fontSize: 12.0);
  static const TextStyle textStyleInputDecorationHelperStyle = TextStyle(
      color: colorInputDecorationHelperStyle,
      fontFamily: 'PTSans',
      fontWeight: FontWeight.w600,
      fontSize: 12.0);
  static const TextStyle textStyleInputDecorationHintStyle = TextStyle(
      color: colorInputDecorationHintStyleColor,
      fontFamily: 'PTSans',
      fontWeight: FontWeight.w600);
  static const TextStyle textStyleAppBarTitleTextStyle = TextStyle(
      color: colorAppBarTitleText,
      fontSize: 16.0,
      fontFamily: 'PTSans',
      fontWeight: FontWeight.bold);
  static const TextStyle textStyleFloatingActionButtonExtendedTextStyle =
      TextStyle(
          color: colorFloatingActionButtonExtendedText,
          fontSize: 14.0,
          fontFamily: 'PTSans',
          fontWeight: FontWeight.bold);
  static const TextStyle textStyleTextButton = TextStyle(
      color: colorTextButtonTextStyle,
      fontSize: 16.0,
      fontFamily: 'PTSans',
      fontWeight: FontWeight.bold);
  static const TextStyle textStyleOutlinedButton = TextStyle(
      color: colorPrimary,
      fontSize: 16.0,
      fontFamily: 'PTSans',
      fontWeight: FontWeight.bold);

  static const Radius _radiusTextButtonCorners = Radius.circular(50.0);
  static const Radius _radiusInputDecoration = Radius.circular(30.0);

  static const OutlinedBorder outlinedBorderTextButtonShape =
      RoundedRectangleBorder(
          borderRadius: BorderRadius.all(_radiusTextButtonCorners));

  static const InputBorder inputBorderInputDecoration = OutlineInputBorder(
    borderRadius: BorderRadius.all(_radiusInputDecoration),
    borderSide: BorderSide(
      color: colorInputDecorationBorderSide,
      width: 1.0,
    ),
  );

  static const EdgeInsets edgeInsetsDefaultPaddingButton =
      EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0);

  static const String stringEmpty = '';
  static const String stringSpace = ' ';
  static const String stringExclamationMark = '!';
  static const String stringColonSymbol = ':';
  static const String stringNewLine = '\n';
  static const String stringLeftCurleyBrace = '{';
  static const String stringRightCurleyBrace = '}';
  static const String stringSlashSymbol = '/';

  static const bool booleanAppBarCenterTitle = true;

  static const String stringDefaultImagePlaceholderPath =
      'assets/images/image_placeholder.png';
}
