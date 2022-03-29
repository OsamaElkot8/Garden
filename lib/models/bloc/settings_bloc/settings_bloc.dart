import 'package:garden/models/bloc/closable_bloc.dart';
import 'package:garden/models/bloc/settings_bloc/settings_bloc_event.dart';
import 'package:garden/models/bloc/settings_bloc/settings_bloc_state.dart';
import 'package:garden/models/utilities/settings.dart';

class SettingsBloc extends ClosableBloc<SettingsBlocEvent, SettingsBlocState> {
  SettingsBloc({SettingsBlocState? initialState})
      : super(initialState ?? SettingsIdle()) {
    on<SettingsFetch>((event, emit) async {
      try {
        emit(SettingsLoading());
        final Settings _result =
            await Settings.getSettingsFromSharedPreferences();
        emit(SettingsLoaded(_result));
      } catch (e) {
        emit(SettingsLoadingError(reason: e.toString()));
      }
    });
  }
}
