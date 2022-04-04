import 'package:flutter/material.dart';
import 'package:garden/models/entities/plant/plant_type.dart';
import 'package:garden/repository/local/dao/plants/plants_types.dart';
import 'package:garden/repository/local/database/local_database.dart';
import 'package:garden/repository/local/local_constants.dart';
import 'package:garden/ui/components/drop_downs/default_drop_down.dart';
import 'package:garden/ui/ui_helper.dart';

class PlantTypesDropDown extends StatefulWidget {
  final String? value;
  final void Function(String?)? onChanged;
  const PlantTypesDropDown(
      {Key? key, required this.value, required this.onChanged})
      : super(key: key);

  @override
  State<PlantTypesDropDown> createState() => _PlantTypesDropDownState();
}

class _PlantTypesDropDownState extends State<PlantTypesDropDown> {
  late Future<List<PlantType>> _types;

  @override
  void initState() {
    _initializeTypes();
    super.initState();
  }

  void _initializeTypes() => _types = _searchPlantsTypes();

  Future<List<PlantType>> _searchPlantsTypes() async {
    final _database = await $FloorLocalDatabase
        .databaseBuilder(LocalConstants.databaseName)
        .build();
    final PlantsTypesDao _plantsTypesDao = _database.plantsTypesDao;
    List<PlantType> _types = await _plantsTypesDao.getAllPlantsTypes();
    return _types;
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme _textTheme = UIHelper.instance.getTextTheme(context);

    return FutureBuilder<List<PlantType>>(
      future: _types,
      builder: (BuildContext context, AsyncSnapshot<List<PlantType>> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const Center(
              child: CircularProgressIndicator(),
            );
          default:
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              List<PlantType> _systemTypes = snapshot.data!;
              return DefaultDropDown<String>(
                value: widget.value,
                items: _systemTypes.map((PlantType value) {
                  return DropdownMenuItem<String>(
                    value: value.title,
                    child: Text(
                      value.title,
                      style: _textTheme.bodyText1,
                    ),
                  );
                }).toList(),
                onChanged: (String? value) {
                  widget.onChanged?.call(value);
                },
              );
            }
        }
      },
    );
  }
}
