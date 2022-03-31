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

  void fetchedPlantsAddAll({required List<Plant> plants}) {
    try {
      emit(FetchLoaded(plants));
    } catch (e) {
      emit(FetchLoadingError(e.toString()));
    }
  }

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
