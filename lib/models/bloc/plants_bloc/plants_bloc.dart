import 'package:garden/models/bloc/closable_bloc.dart';
import 'package:garden/models/bloc/plants_bloc/plants_bloc_event.dart';
import 'package:garden/models/bloc/plants_bloc/plants_bloc_state.dart';

class PlantsBloc extends ClosableBloc<PlantsBlocEvent, PlantsBlocState> {
  PlantsBloc({PlantsBlocState? initialState})
      : super(initialState ?? PlantsIdle()) {
    on<PlantsFetch>((event, emit) async {
      try {
        emit(PlantsLoading());
        // final MoviesApiClient _moviesApiClient = MoviesApiClient();
        // final MoviesApiResponse _result = await _moviesApiClient
        //     .getNowPlayingMovies(apiKey: NetworkConstants.apiKey, page: _page);

        if (true) {
          emit(PlantsLoaded([]));
          _page++;
        } else {
          emit(PlantsLoadingError(reason: ''));
        }
      } catch (e) {
        emit(PlantsLoadingError(reason: e.toString()));
      }
    });
  }
  int _page = 1;
  bool isFetching = false;
}
