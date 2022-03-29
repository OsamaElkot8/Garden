import 'languages.dart';

class LanguageFr extends Languages {
  static final LanguageFr _singleton = LanguageFr._internal();
  factory LanguageFr() {
    return _singleton;
  }

  LanguageFr._internal();

  @override
  // TODO: implement test
  String get test => 'test';
}
