import 'package:floor/floor.dart';

@entity
class PlantType {
  @PrimaryKey(autoGenerate: true)
  int? id;
  String title;

  PlantType({this.id, required this.title});
}
