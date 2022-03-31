part of 'settings_cubit.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState.idle() = Idle;
  const factory SettingsState.loading() = Loading;
  const factory SettingsState.loaded(Settings settings) = Loaded;
  const factory SettingsState.loadingError(String reason) = LoadingError;
}
