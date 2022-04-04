import 'package:flutter/material.dart';
import 'package:garden/models/utilities/extensions/datetime_extension.dart';
import 'package:garden/ui/ui_helper.dart';

class PlantingDateView extends StatelessWidget {
  final DateTime value;
  final void Function() onEdit;
  const PlantingDateView({Key? key, required this.value, required this.onEdit})
      : super(key: key);

  final BorderRadius _tileBorderRadius =
      const BorderRadius.all(Radius.circular(30.0));

  @override
  Widget build(BuildContext context) {
    final ColorScheme _colorScheme = UIHelper.instance.getColorScheme(context);
    final TextTheme _textTheme = UIHelper.instance.getTextTheme(context);

    return ListTile(
      shape: RoundedRectangleBorder(
          borderRadius: _tileBorderRadius,
          side: BorderSide(color: _colorScheme.primary)),
      leading: Text(
        value.yearMonthNameDayTwelveHours(),
        style: _textTheme.bodyText1,
      ),
      trailing: Icon(
        Icons.edit,
        color: _colorScheme.primary,
      ),
      onTap: onEdit,
    );
  }
}
