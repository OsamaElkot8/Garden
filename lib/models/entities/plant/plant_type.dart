import 'package:floor/floor.dart';

@entity
class PlantType {
  @PrimaryKey(autoGenerate: true)
  late int id;
  String title;

  PlantType({required this.id, required this.title});
}
