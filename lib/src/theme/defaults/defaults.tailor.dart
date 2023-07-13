// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'defaults.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgDefaults extends ThemeExtension<YgDefaults> {
  const YgDefaults({
    required this.appBarColor,
    required this.brightness,
    required this.focusColor,
    required this.highlightColor,
    required this.scaffoldColor,
    required this.splashColor,
  });

  final Color appBarColor;
  final Brightness brightness;
  final Color focusColor;
  final Color highlightColor;
  final Color scaffoldColor;
  final Color splashColor;

  static final YgDefaults consumerLight = YgDefaults(
    appBarColor: _$YgDefaults.appBarColor[0],
    brightness: _$YgDefaults.brightness[0],
    focusColor: _$YgDefaults.focusColor[0],
    highlightColor: _$YgDefaults.highlightColor[0],
    scaffoldColor: _$YgDefaults.scaffoldColor[0],
    splashColor: _$YgDefaults.splashColor[0],
  );

  static final YgDefaults consumerDark = YgDefaults(
    appBarColor: _$YgDefaults.appBarColor[1],
    brightness: _$YgDefaults.brightness[1],
    focusColor: _$YgDefaults.focusColor[1],
    highlightColor: _$YgDefaults.highlightColor[1],
    scaffoldColor: _$YgDefaults.scaffoldColor[1],
    splashColor: _$YgDefaults.splashColor[1],
  );

  static final YgDefaults professionalLight = YgDefaults(
    appBarColor: _$YgDefaults.appBarColor[2],
    brightness: _$YgDefaults.brightness[2],
    focusColor: _$YgDefaults.focusColor[2],
    highlightColor: _$YgDefaults.highlightColor[2],
    scaffoldColor: _$YgDefaults.scaffoldColor[2],
    splashColor: _$YgDefaults.splashColor[2],
  );

  static final YgDefaults professionalDark = YgDefaults(
    appBarColor: _$YgDefaults.appBarColor[3],
    brightness: _$YgDefaults.brightness[3],
    focusColor: _$YgDefaults.focusColor[3],
    highlightColor: _$YgDefaults.highlightColor[3],
    scaffoldColor: _$YgDefaults.scaffoldColor[3],
    splashColor: _$YgDefaults.splashColor[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgDefaults copyWith({
    Color? appBarColor,
    Brightness? brightness,
    Color? focusColor,
    Color? highlightColor,
    Color? scaffoldColor,
    Color? splashColor,
  }) {
    return YgDefaults(
      appBarColor: appBarColor ?? this.appBarColor,
      brightness: brightness ?? this.brightness,
      focusColor: focusColor ?? this.focusColor,
      highlightColor: highlightColor ?? this.highlightColor,
      scaffoldColor: scaffoldColor ?? this.scaffoldColor,
      splashColor: splashColor ?? this.splashColor,
    );
  }

  @override
  YgDefaults lerp(covariant ThemeExtension<YgDefaults>? other, double t) {
    if (other is! YgDefaults) return this as YgDefaults;
    return YgDefaults(
      appBarColor: Color.lerp(appBarColor, other.appBarColor, t)!,
      brightness: t < 0.5 ? brightness : other.brightness,
      focusColor: Color.lerp(focusColor, other.focusColor, t)!,
      highlightColor: Color.lerp(highlightColor, other.highlightColor, t)!,
      scaffoldColor: Color.lerp(scaffoldColor, other.scaffoldColor, t)!,
      splashColor: Color.lerp(splashColor, other.splashColor, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgDefaults &&
            const DeepCollectionEquality()
                .equals(appBarColor, other.appBarColor) &&
            const DeepCollectionEquality()
                .equals(brightness, other.brightness) &&
            const DeepCollectionEquality()
                .equals(focusColor, other.focusColor) &&
            const DeepCollectionEquality()
                .equals(highlightColor, other.highlightColor) &&
            const DeepCollectionEquality()
                .equals(scaffoldColor, other.scaffoldColor) &&
            const DeepCollectionEquality()
                .equals(splashColor, other.splashColor));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(appBarColor),
      const DeepCollectionEquality().hash(brightness),
      const DeepCollectionEquality().hash(focusColor),
      const DeepCollectionEquality().hash(highlightColor),
      const DeepCollectionEquality().hash(scaffoldColor),
      const DeepCollectionEquality().hash(splashColor),
    );
  }
}
