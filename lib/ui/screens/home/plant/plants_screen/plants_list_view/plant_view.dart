import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garden/main.dart';
import 'package:garden/models/bloc/plants/plants_cubit.dart';
import 'package:garden/models/entities/plant/plant.dart';
import 'package:garden/models/utilities/extensions/datetime_extension.dart';
import 'package:garden/models/utilities/extensions/string_extension.dart';
import 'package:garden/ui/screens/home/plant/plant_manager/plant_manager_screen.dart';
import 'package:garden/ui/screens/home/plant/plant_manager/plant_manager_screen_arguments_enum.dart';
import 'package:garden/ui/ui_helper.dart';

class PlantView extends StatelessWidget {
  final Plant plant;
  const PlantView({Key? key, required this.plant}) : super(key: key);

  final EdgeInsets _cardPadding = const EdgeInsets.symmetric(vertical: 8.0);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _cardOnPressed(context),
      child: Card(
        child: Padding(
          padding: _cardPadding,
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
        ),
      ),
    );
  }

  void _cardOnPressed(BuildContext context) {
    Navigator.pushNamed(context, PlantManagerScreen.id, arguments: {
      PlantManagerScreenArgument.screenTitle:
          appLocalizations(context).updatePlant,
      PlantManagerScreenArgument.onSaved: (
          {required String name,
          required String type,
          required String date}) async {
        Plant _plant = Plant(id: plant.id, name: name, type: type, date: date);
        _fetchedPlantUpdateExisting(context, plants: <Plant>[_plant]);
      },
      PlantManagerScreenArgument.plant: plant,
    });
  }

  void _fetchedPlantUpdateExisting(BuildContext context,
      {required List<Plant> plants}) {
    PlantsCubit _plantsCubit = context.read<PlantsCubit>();
    _plantsCubit.fetchedPlantUpdateExisting(plants: plants);
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
      crossAxisAlignment: CrossAxisAlignment.start,
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
