import 'languages.dart';

class LanguageEn extends Languages {
  static final LanguageEn _singleton = LanguageEn._internal();
  factory LanguageEn() {
    return _singleton;
  }

  LanguageEn._internal();

  @override
  // TODO: implement garden
  String get garden => 'Garden';

  @override
  // TODO: implement addPlant
  String get addPlant => 'Add plant';

  @override
  // TODO: implement searchPlants
  String get searchPlants => 'Search Plants';

  @override
  // TODO: implement loading
  String get loading => 'Loading';

  @override
  // TODO: implement errorGettingPlants
  String get errorGettingPlants => 'Error getting Plants';

  @override
  // TODO: implement noMorePlants
  String get noMorePlants => 'No more Plants';

  @override
  // TODO: implement sorryWeCouldNotFindAnyResult
  String get sorryWeCouldNotFindAnyResult =>
      'Sorry! we couldn\'t find any result';

  @override
  // TODO: implement yourPlantsListCurrentlyEmpty
  String get yourPlantsListCurrentlyEmpty =>
      'Your Plants list is currently empty.';
}
