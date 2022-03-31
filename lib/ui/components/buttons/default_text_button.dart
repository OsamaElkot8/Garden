import 'package:flutter/material.dart';
import 'package:garden/ui/ui_constants.dart';
import 'package:garden/ui/ui_helper.dart';

class DefaultTextButton extends StatelessWidget {
  final double _buttonElevation = 0.0;
  final double _minWidth = 100.0;
  final double _minHeight = 42.0;
  final String text;
  final void Function()? onPressed;
  final TextStyle? textStyle;
  final Color? backGroundColor;
  const DefaultTextButton(
      {Key? key,
      required this.text,
      this.onPressed,
      this.textStyle,
      this.backGroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ColorScheme _colorScheme = UIHelper.instance.getColorScheme(context);
    final TextTheme _textTheme = UIHelper.instance.getTextTheme(context);

    return MaterialButton(
      onPressed: onPressed,
      disabledColor: _colorScheme.onSecondary,
      child: Text(
        text,
        style: textStyle ?? _textTheme.button,
      ),
      color: (backGroundColor ?? _colorScheme.primary),
      shape: UiConstants.outlinedBorderTextButtonShape,
      height: _minHeight,
      minWidth: _minWidth,
      padding: UiConstants.edgeInsetsDefaultPaddingButton,
      elevation: _buttonElevation,
      disabledElevation: _buttonElevation,
    );
  }
}
