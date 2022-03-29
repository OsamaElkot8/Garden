import 'package:garden/models/enums/plant/plant_type.dart';

class Plant {
  late int id;
  String? name;
  DateTime? date;
  PlantType? type;

  Plant({required this.id, this.name, this.type, this.date});
}
