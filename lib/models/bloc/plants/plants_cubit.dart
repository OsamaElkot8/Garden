import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:garden/models/bloc/closable_cubit.dart';
import 'package:garden/models/entities/plant/plant.dart';
import 'package:garden/repository/local/dao/plants/plants.dart';
import 'package:garden/repository/local/database/local_database.dart';
import 'package:garden/repository/local/local_constants.dart';
import 'package:garden/repository/local/response/failure/database_failure.dart';
import 'package:garden/repository/local/response/failure/failure.dart';
import 'package:garden/repository/local/response/success/success.dart';

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

      Either<Failure, Success<List<Plant>>> _result =
          await _fetchPlants(lastPlantRecordId: _lastPlantRecordId);

      _result.fold(
          (Failure failure) => emit(FetchLoadingError(failure.message)),
          (Success<List<Plant>> successResponse) =>
              emit(FetchLoaded(successResponse.data!)));
    } catch (e) {
      emit(FetchLoadingError(e.toString()));
    }
  }

  Future<void> searchPlants({required String name}) async {
    try {
      emit(const SearchLoading());

      Either<Failure, Success<List<Plant>>> _result =
          await _searchPlants(name: name);

      _result.fold(
          (Failure failure) => emit(SearchLoadingError(failure.message)),
          (Success<List<Plant>> successResponse) =>
              emit(SearchLoaded(successResponse.data!)));
    } catch (e) {
      emit(SearchLoadingError(e.toString()));
    }
  }

  Future<void> fetchedPlantUpdateExisting({required List<Plant> plants}) async {
    try {
      Either<Failure, Success> _result = await _updatePlants(plants: plants);

      _result.fold(
          (Failure failure) => emit(UpdateExistingError(failure.message)),
          (Success successResponse) => emit(UpdateExisting(plants)));
    } catch (e) {
      emit(UpdateExistingError(e.toString()));
    }
  }

  Future<void> fetchedPlantsAddAll({required List<Plant> plants}) async {
    try {
      Either<Failure, Success<List<int>>> _result =
          await _addPlants(plants: plants);

      _result
          .fold((Failure failure) => emit(ExistingAddAllError(failure.message)),
              (Success<List<int>> successResponse) {
        final List<int> _plantsIds = successResponse.data!;
        for (int _index = 0; _index < _plantsIds.length; _index++) {
          plants[_index].id = _plantsIds[_index];
        }
        emit(ExistingAddAll(plants));
      });
    } catch (e) {
      emit(ExistingAddAllError(e.toString()));
    }
  }

  Future<Either<Failure, Success>> _updatePlants(
      {required List<Plant> plants}) async {
    try {
      int _success = await (await _plantsDao).updatePlants(plants);
      if (_success == LocalConstants.successResponseCode) {
        return Right(Success());
      } else {
        return Left(DatabaseFailure(message: LocalConstants.errorUpdatePlants));
      }
    } catch (e) {
      return Left(DatabaseFailure(message: e.toString()));
    }
  }

  Future<Either<Failure, Success<List<int>>>> _addPlants(
      {required List<Plant> plants}) async {
    try {
      List<int> _result = await (await _plantsDao).insertPlants(plants);
      return Right(Success<List<int>>(data: _result));
    } catch (e) {
      return Left(DatabaseFailure(message: e.toString()));
    }
  }

  Future<Either<Failure, Success<List<Plant>>>> _fetchPlants(
      {required int lastPlantRecordId}) async {
    try {
      List<Plant> _plants =
          await (await _plantsDao).getPlants(lastPlantRecordId);
      return Right(Success<List<Plant>>(data: _plants));
    } catch (e) {
      return Left(DatabaseFailure(message: e.toString()));
    }
  }

  Future<Either<Failure, Success<List<Plant>>>> _searchPlants(
      {required String name}) async {
    try {
      List<Plant> _plants = await (await _plantsDao).searchPlants(name);
      return Right(Success<List<Plant>>(data: _plants));
    } catch (e) {
      return Left(DatabaseFailure(message: e.toString()));
    }
  }

  Future<PlantsDao> get _plantsDao async {
    final _database = await $FloorLocalDatabase
        .databaseBuilder(LocalConstants.databaseName)
        .build();
    final PlantsDao _plantsDao = _database.plantsDao;
    return _plantsDao;
  }
}
