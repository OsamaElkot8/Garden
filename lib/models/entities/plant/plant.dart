import 'package:floor/floor.dart';
import 'package:intl/intl.dart';

@entity
class Plant {
  @PrimaryKey(autoGenerate: true)
  late int id;
  String name, type, date;

  Plant(
      {required this.id,
      required this.name,
      required this.type,
      required this.date});

  DateTime get plantingDate => DateFormat('yyyy-MM-dd HH:mm:ss').parse(date);
}
