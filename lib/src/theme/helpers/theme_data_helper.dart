import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/theme.dart';

/// Helper to construct ThemeData to be used in an application.
class YgThemeDataHelper {
  // region Consumer themes.
  static ThemeData getThemeData(YgTheme theme) {
    return ThemeData(
      brightness: theme.defaults.brightness,
      extensions: <YgTheme>[theme],
      useMaterial3: true,
      // Default theme values.
      pageTransitionsTheme: _defaultPageTransitionsTheme,
      scaffoldBackgroundColor: theme.defaults.scaffoldColor,
      splashColor: theme.defaults.splashColor,
      highlightColor: theme.defaults.highlightColor,
      focusColor: theme.defaults.focusColor,
      // Temporary theme values. Will be removed once we have proper component.
      appBarTheme: AppBarTheme(color: theme.defaults.appBarColor),
      iconTheme: IconThemeData(
        color: theme.defaults.iconColor,
      ),
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
