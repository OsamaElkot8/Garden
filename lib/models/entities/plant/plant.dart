import 'package:floor/floor.dart';
import 'package:intl/intl.dart';

@entity
class Plant {
  @PrimaryKey(autoGenerate: true)
  int? id;
  String name, date, type;

  Plant({this.id, required this.name, required this.type, required this.date});

  DateTime get plantingDate => DateFormat('yyyy-MM-dd HH:mm:ss').parse(date);
}
