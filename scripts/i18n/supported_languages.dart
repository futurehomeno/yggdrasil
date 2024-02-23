// ignore: avoid_classes_with_only_static_members
class SupportedLanguages {
  static const String en = 'en';
  static const String nb = 'nb';
  static const String da = 'da';
  static const String fi = 'fi';
  static const String sv = 'sv';

  static List<String> get supportedLanguages {
    return <String>[en, da, fi, nb, sv];
  }
}
