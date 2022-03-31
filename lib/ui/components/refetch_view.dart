import 'package:flutter/material.dart';
import 'package:garden/ui/ui_helper.dart';

class ReFetchView extends StatelessWidget {
  final String error;
  final void Function()? refreshOnPressed;
  const ReFetchView({Key? key, required this.error, this.refreshOnPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme _textTheme = UIHelper.instance.getTextTheme(context);
    ColorScheme _colorScheme = UIHelper.instance.getColorScheme(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: refreshOnPressed,
          icon: Icon(
            Icons.refresh,
            color: _colorScheme.primary,
          ),
        ),
        const SizedBox(height: 15),
        Text(error,
            style: _textTheme.bodyText1!.copyWith(color: _colorScheme.error),
            textAlign: TextAlign.center),
      ],
    );
  }
}
