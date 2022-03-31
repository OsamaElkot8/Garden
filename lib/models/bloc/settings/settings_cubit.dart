import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:garden/models/bloc/closable_cubit.dart';
import 'package:garden/models/entities/settings/settings.dart';
import 'package:garden/models/utilities/settings/settings_service.dart';

part 'settings_cubit.freezed.dart';
part 'settings_state.dart';

class SettingsCubit extends ClosableCubit<SettingsState> {
  SettingsCubit({SettingsState? initialState})
      : super(initialState ?? const Idle());

  Future<void> fetchSettings() async {
    try {
      emit(const Loading());
      final Settings _result = await SettingsService.instance.fetchSettings();
      emit(Loaded(_result));
    } catch (e) {
      emit(LoadingError(e.toString()));
    }
  }
}
