import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:garden/models/bloc/closable_cubit.dart';
import 'package:garden/models/entities/plant/plant.dart';
import 'package:garden/ui/ui_constants.dart';

part 'plants_cubit.freezed.dart';
part 'plants_state.dart';

class PlantsCubit extends ClosableCubit<PlantsState> {
  PlantsCubit({PlantsState? initialState})
      : super(initialState ?? const Idle());

  int _page = 1;
  bool isFetching = false;

  Future<void> fetchPlants() async {
    try {
      emit(const Loading());
      // final MoviesApiClient _moviesApiClient = MoviesApiClient();
      // final MoviesApiResponse _result = await _moviesApiClient
      //     .getNowPlayingMovies(apiKey: NetworkConstants.apiKey, page: _page);

      if (true) {
        emit(const Loaded(<Plant>[]));
        _page++;
      } else {
        emit(const LoadingError(UiConstants.stringEmpty));
      }
    } catch (e) {
      emit(LoadingError(e.toString()));
    }
  }
}
