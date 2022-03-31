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

  @override
  // TODO: implement name
  String get name => 'Name';

  @override
  // TODO: implement emptyFieldErrorMessage
  String get emptyFieldErrorMessage => 'Field can\'t be empty';

  @override
  // TODO: implement save
  String get save => 'Save';

  @override
  // TODO: implement updatePlant
  String get updatePlant => 'Update Plant';

  @override
  // TODO: implement errorGettingPlantsTypes
  String get errorGettingPlantsTypes => 'Error getting Plants Types';

  @override
  // TODO: implement errorUpdating
  String get errorUpdating => 'Error updating';

  @override
  // TODO: implement plant
  String get plant => 'Plant';

  @override
  // TODO: implement updated
  String get updated => 'updated';
}
