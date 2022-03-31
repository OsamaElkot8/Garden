import 'package:flutter/material.dart';
import 'package:garden/models/utilities/extensions/datetime_extension.dart';
import 'package:garden/ui/ui_helper.dart';

class PlantingDateView extends StatelessWidget {
  final DateTime value;
  final void Function() onEdit;
  const PlantingDateView({Key? key, required this.value, required this.onEdit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ColorScheme _colorScheme = UIHelper.instance.getColorScheme(context);
    final TextTheme _textTheme = UIHelper.instance.getTextTheme(context);

    return ListTile(
      leading: Text(
        value.yearMonthNameDayTwelveHours(),
        style: _textTheme.bodyText1,
      ),
      trailing: IconButton(
        icon: Icon(
          Icons.edit,
          color: _colorScheme.primary,
        ),
        onPressed: onEdit,
      ),
    );
  }
}
