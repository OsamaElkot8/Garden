import 'package:floor/floor.dart';
import 'package:garden/models/entities/plant/plant_type.dart';

@dao
abstract class PlantsTypesDao {
  @Query("SELECT * FROM plants_types")
  Future<List<PlantType>> getAllPlantsTypes();

  @Query(
      "INSERT OR IGNORE INTO plants_types(title) VALUES ('alpines'), ('aquatic'), ('bulbs'), ('succulents'), ('carnivorous'), ('climbers'), ('ferns'), ('grasses'), ('trees')")
  Future<void> insertAllPlantsTypes();
}
