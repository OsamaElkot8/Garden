import 'languages.dart';

class LanguageFr extends Languages {
  static final LanguageFr _singleton = LanguageFr._internal();
  factory LanguageFr() {
    return _singleton;
  }

  LanguageFr._internal();

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
}
