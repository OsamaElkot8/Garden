abstract class Languages {
  String get test;
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
