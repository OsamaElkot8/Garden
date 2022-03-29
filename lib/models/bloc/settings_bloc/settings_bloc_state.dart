import 'package:garden/models/utilities/settings.dart';
import 'package:garden/repository/local/local_constants.dart';

abstract class SettingsBlocState {
  Settings? settings = Settings.defaultSettings();
}

class SettingsIdle extends SettingsBlocState {}

class SettingsLoading extends SettingsBlocState {}

class SettingsLoaded extends SettingsBlocState {
  SettingsLoaded(settings) {
    this.settings = settings;
  }
}

class SettingsLoadingError extends SettingsBlocState {
  String? reason;
  SettingsLoadingError({this.reason = LocalConstants.keyError});
}
