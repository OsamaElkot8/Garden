import 'package:flutter/material.dart';
import 'package:garden/models/entities/plant/plant.dart';
import 'package:garden/models/utilities/extensions/datetime_extension.dart';
import 'package:garden/models/utilities/extensions/string_extension.dart';
import 'package:garden/ui/ui_helper.dart';

class PlantView extends StatelessWidget {
  final Plant plant;
  const PlantView({Key? key, required this.plant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Expanded(
            child: _plantNameShortsView(context),
          ),
          const SizedBox(
            width: 10.0,
          ),
          Expanded(flex: 3, child: _plantInformationView(context))
        ],
      ),
    );
  }

  Widget _plantNameShortsView(BuildContext context) {
    ColorScheme _colorScheme = UIHelper.instance.getColorScheme(context);
    TextTheme _textTheme = UIHelper.instance.getTextTheme(context);
    String _shorts = plant.name.shorts();

    return CircleAvatar(
      backgroundColor: _colorScheme.secondary,
      child: Text(
        _shorts,
        style: _textTheme.headline4,
      ),
    );
  }

  Widget _plantInformationView(BuildContext context) {
    TextTheme _textTheme = UIHelper.instance.getTextTheme(context);
    String _name = plant.name;
    String _type = plant.type;
    String _date = plant.plantingDate.yearMonthNameDayTwelveHours();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          _name,
          style: _textTheme.headline4,
        ),
        const SizedBox(
          height: 5.0,
        ),
        Text(
          _type,
          style: _textTheme.bodyText1,
        ),
        const SizedBox(
          height: 5.0,
        ),
        Text(
          _date,
          style: _textTheme.bodyText1,
        )
      ],
    );
  }
}
