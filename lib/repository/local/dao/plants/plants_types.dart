import 'package:floor/floor.dart';
import 'package:garden/models/entities/plant/plant_type.dart';

@dao
abstract class PlantsTypesDao {
  @Query("SELECT * FROM PlantType")
  Future<List<PlantType>> getAllPlantsTypes();

  @insert
  Future<List<int>> insertAllPlantsTypes(List<PlantType> plantsTypes);
}
