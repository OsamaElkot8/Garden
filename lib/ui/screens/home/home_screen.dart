import 'package:flutter/material.dart';
import 'package:garden/repository/local/dao/plants/plants_types.dart';
import 'package:garden/repository/local/database/local_database.dart';
import 'package:garden/repository/local/local_constants.dart';
import 'package:garden/ui/screens/home/plant/plants_screen/plants_screen.dart';

class HomeScreen extends StatelessWidget {
  static const String id = 'homeScreen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _setUpAfterBuild(context);
    return const Scaffold(
      body: SafeArea(
        child: PlantsScreen(),
      ),
    );
  }

  _setUpAfterBuild(BuildContext context) {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _addPlantsTypes();
    });
  }

  Future<void> _addPlantsTypes() async {
    final _database = await $FloorLocalDatabase
        .databaseBuilder(LocalConstants.databaseName)
        .build();
    final PlantsTypesDao _plantsTypesDao = _database.plantsTypesDao;
    _plantsTypesDao.insertAllPlantsTypes();
  }
}
