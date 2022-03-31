import 'dart:async';

import 'package:floor/floor.dart';
import 'package:garden/models/entities/plant/plant.dart';
import 'package:garden/models/entities/plant/plant_type.dart';
import 'package:garden/repository/local/dao/plants/plants.dart';
import 'package:garden/repository/local/dao/plants/plants_types.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'local_database.g.dart';

@Database(version: 1, entities: [Plant, PlantType])
abstract class LocalDatabase extends FloorDatabase {
  PlantsDao get plantsDao;
  PlantsTypesDao get plantsTypesDao;
}
