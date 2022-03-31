import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:garden/models/bloc/closable_cubit.dart';
import 'package:garden/models/entities/plant/plant.dart';
import 'package:garden/repository/local/dao/plants/plants.dart';
import 'package:garden/repository/local/database/local_database.dart';
import 'package:garden/repository/local/local_constants.dart';

part 'plants_cubit.freezed.dart';
part 'plants_state.dart';

class PlantsCubit extends ClosableCubit<PlantsState> {
  PlantsCubit({PlantsState? initialState})
      : super(initialState ?? const Idle());

  bool isFetching = false;

  Future<void> fetchPlants({int? lastPlantRecordId}) async {
    try {
      emit(const FetchLoading());
      // in case of getting first 10 elements  _lastPlantRecordId should be -1 (lastPlantRecordId == null)
      final int _lastPlantRecordId = lastPlantRecordId ?? -1;

      List<Plant> _plants =
          await _fetchPlants(lastPlantRecordId: _lastPlantRecordId);

      // if (true) {
      emit(FetchLoaded(_plants));
      // } else {
      //   emit(const LoadingError(UiConstants.stringEmpty));
      // }
    } catch (e) {
      emit(FetchLoadingError(e.toString()));
    }
  }

  Future<void> searchPlants({required String name}) async {
    try {
      emit(const SearchLoading());

      List<Plant> _plants = await _searchPlants(name: name);

      // if (true) {
      emit(SearchLoaded(_plants));
      // } else {
      //   emit(const LoadingError(UiConstants.stringEmpty));
      // }
    } catch (e) {
      emit(SearchLoadingError(e.toString()));
    }
  }

  Future<void> fetchedPlantUpdateExisting({required List<Plant> plants}) async {
    try {
      final int _result = await _updatePlants(plants: plants);

      // if (true) {
      emit(UpdateExisting(plants));
      // } else {
      //   emit(const UpdateExistingError(UiConstants.stringEmpty));
      // }

    } catch (e) {
      emit(UpdateExistingError(e.toString()));
    }
  }

  Future<void> fetchedPlantsAddAll({required List<Plant> plants}) async {
    try {
      List<int> _plantsIds = await _addPlants(plants: plants);

      // if (true) {
      for (int _index = 0; _index < _plantsIds.length; _index++) {
        plants[_index].id = _plantsIds[_index];
      }
      emit(ExistingAddAll(plants));
      // } else {
      //   emit(const FetchLoadingError(UiConstants.stringEmpty));
      // }
    } catch (e) {
      emit(ExistingAddAllError(e.toString()));
    }
  }

  Future<int> _updatePlants({required List<Plant> plants}) async =>
      await (await _plantsDao).updatePlants(plants);

  Future<List<int>> _addPlants({required List<Plant> plants}) async =>
      await (await _plantsDao).insertPlants(plants);

  Future<List<Plant>> _fetchPlants({required int lastPlantRecordId}) async =>
      await (await _plantsDao).getPlants(lastPlantRecordId);

  Future<List<Plant>> _searchPlants({required String name}) async =>
      await (await _plantsDao).searchPlants(name);

  Future<PlantsDao> get _plantsDao async {
    final _database = await $FloorLocalDatabase
        .databaseBuilder(LocalConstants.databaseName)
        .build();
    final PlantsDao _plantsDao = _database.plantsDao;
    return _plantsDao;
  }
}
