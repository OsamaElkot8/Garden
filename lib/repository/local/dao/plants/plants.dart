import 'package:floor/floor.dart';
import 'package:garden/models/entities/plant/plant.dart';

@dao
abstract class PlantsDao {
  @Query(
      "SELECT * FROM plants where id > :lastPlantRecordId order by id limit 10")
  Future<List<Plant>> getPlants(int lastPlantRecordId);

  @Query("SELECT * FROM plants where name like '%:plantName%'")
  Future<List<Plant>> searchPlants(String plantName);

  @insert
  Future<List<int>> insertPlants(List<Plant> plant);

  @update
  Future<int> updatePlants(List<Plant> plant);
}
