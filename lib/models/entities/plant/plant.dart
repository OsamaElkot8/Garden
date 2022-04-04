import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';
import 'package:intl/intl.dart';

@entity
class Plant extends Equatable {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String name, date, type;

  const Plant(
      {this.id, required this.name, required this.type, required this.date});

  DateTime get plantingDate => DateFormat('yyyy-MM-dd HH:mm:ss').parse(date);

  @override
  List<Object?> get props => [id, name, date, type];
}
