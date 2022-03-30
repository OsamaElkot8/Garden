import 'package:garden/models/entities/plant/plant.dart';
import 'package:garden/repository/local/local_constants.dart';

abstract class PlantsBlocState {}

class PlantsIdle extends PlantsBlocState {}

class PlantsLoading extends PlantsBlocState {}

class PlantsLoaded extends PlantsBlocState {
  final List<Plant> plants;
  PlantsLoaded(this.plants);
}

class PlantsLoadingError extends PlantsBlocState {
  String? reason;
  PlantsLoadingError({this.reason = LocalConstants.keyError});
}
