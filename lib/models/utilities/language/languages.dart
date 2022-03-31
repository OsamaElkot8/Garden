abstract class Languages {
  String get garden;
  String get addPlant;
  String get searchPlants;
  String get loading;
  String get noMorePlants;
  String get errorGettingPlants;
  String get yourPlantsListCurrentlyEmpty;
  String get sorryWeCouldNotFindAnyResult;
}

enum EnumLanguage { english, french }

extension ExtensionEnumLanguage on EnumLanguage {
  String localeValue() {
    switch (this) {
      case EnumLanguage.french:
        return 'fr';
      default:
        return 'en';
    }
  }
}
