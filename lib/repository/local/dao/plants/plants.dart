import 'package:floor/floor.dart';
import 'package:garden/models/entities/plant/plant.dart';

@dao
abstract class PlantsDao {
  @Query(
      "SELECT * FROM Plant where id > :lastPlantRecordId order by id limit 10")
  Future<List<Plant>> getPlants(int lastPlantRecordId);

  @Query("SELECT * FROM Plant where name like :plantName")
  Future<List<Plant>> searchPlants(String plantName);

  @insert
  Future<List<int>> insertPlants(List<Plant> plant);

  @update
  Future<int> updatePlants(List<Plant> plant);

  @Query("DELETE FROM Plant")
  Future<void> deleteAllPlants();

  @Query("UPDATE sqlite_sequence SET seq = 0 WHERE name=\"Plant\"")
  Future<void> resetPlantsAutoIncrement();

  Future<void> clearPlantsTable() async {
    await deleteAllPlants();
    await resetPlantsAutoIncrement();
  }
}
