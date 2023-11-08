import 'package:yggdrasil/yggdrasil.dart';

/// Data required to test a `YgTheme`.
class YgThemeTestData {
  const YgThemeTestData({
    required this.fileName,
    required this.theme,
    required this.themeName,
  });

  /// This will be used in the golden test file output.
  ///
  /// Use small letters with underscores.
  /// E.g. `consumer_light`.
  final String fileName;

  /// This will be used in the golden test console output.
  ///
  /// E.g. `Consumer light`.
  final String themeName;

  /// Actual `YgTheme` that we want to test.
  final YgTheme theme;
}
