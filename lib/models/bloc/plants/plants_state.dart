part of 'plants_cubit.dart';

@freezed
class PlantsState with _$PlantsState {
  const factory PlantsState.idle() = Idle;

  const factory PlantsState.fetchLoading() = FetchLoading;
  const factory PlantsState.fetchLoaded(List<Plant> plants) = FetchLoaded;
  const factory PlantsState.fetchLoadingError(String reason) =
      FetchLoadingError;

  const factory PlantsState.searchLoading() = SearchLoading;
  const factory PlantsState.searchLoaded(List<Plant> plants) = SearchLoaded;
  const factory PlantsState.searchLoadingError(String reason) =
      SearchLoadingError;

  const factory PlantsState.updateExisting(List<Plant> plants) = UpdateExisting;
  const factory PlantsState.updateExistingError(String reason) =
      UpdateExistingError;
}
