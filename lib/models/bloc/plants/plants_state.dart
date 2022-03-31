part of 'plants_cubit.dart';

@freezed
class PlantsState with _$PlantsState {
  const factory PlantsState.idle() = Idle;
  const factory PlantsState.loading() = Loading;
  const factory PlantsState.loaded(List<Plant> plants) = Loaded;
  const factory PlantsState.loadingError(String reason) = LoadingError;
}
