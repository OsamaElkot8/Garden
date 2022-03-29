import 'package:garden/models/entities/settings/settings.dart';

abstract class SettingsManager {
  Settings defaultSettings();
  Future<Settings> fetchSettings();
}
