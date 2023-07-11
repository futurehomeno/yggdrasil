import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/theme.dart';

/// Helper to construct ThemeData to be used in an application.
class YgThemeDataHelper {
  // region Consumer themes.
  static ThemeData get consumerLightThemeData {
    return ThemeData(
      brightness: Brightness.light,
      extensions: <YgTheme>[YgTheme.consumerLight],
      pageTransitionsTheme: _defaultPageTransitionsTheme,
    );
  }

  static ThemeData get consumerDarkThemeData {
    return ThemeData(
      brightness: Brightness.dark,
      extensions: <YgTheme>[YgTheme.consumerDark],
      pageTransitionsTheme: _defaultPageTransitionsTheme,
    );
  }
  // endregion

  // region Professional themes.
  static ThemeData get professionalLightThemeData {
    return ThemeData(
      brightness: Brightness.light,
      extensions: <YgTheme>[YgTheme.professionalLight],
      pageTransitionsTheme: _defaultPageTransitionsTheme,
    );
  }

  static ThemeData get professionalDarkThemeData {
    return ThemeData(
      brightness: Brightness.dark,
      extensions: <YgTheme>[YgTheme.professionalDark],
      pageTransitionsTheme: _defaultPageTransitionsTheme,
    );
  }
  // endregion

  static PageTransitionsTheme get _defaultPageTransitionsTheme {
    return const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        // Forces old transition for Android devices.
        TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),

        // Forced old transition for iOS devices.
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),

        // Forces old transition for macOS devices.
        TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
      },
    );
  }
}
