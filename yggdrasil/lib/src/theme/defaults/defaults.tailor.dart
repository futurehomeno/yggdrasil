// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'defaults.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgDefaults extends ThemeExtension<YgDefaults> {
  const YgDefaults({
    required this.animationCurve,
    required this.animationDuration,
    required this.appBarColor,
    required this.brightness,
    required this.colorSchemeSeed,
    required this.focusColor,
    required this.highlightColor,
    required this.iconColor,
    required this.invertedIconColor,
    required this.scaffoldColor,
    required this.splashColor,
  });

  final Curve animationCurve;
  final Duration animationDuration;
  final Color appBarColor;
  final Brightness brightness;
  final Color colorSchemeSeed;
  final Color focusColor;
  final Color highlightColor;
  final Color iconColor;
  final Color invertedIconColor;
  final Color scaffoldColor;
  final Color splashColor;

  static final YgDefaults consumerLight = YgDefaults(
    animationCurve: _$YgDefaults.animationCurve[0],
    animationDuration: _$YgDefaults.animationDuration[0],
    appBarColor: _$YgDefaults.appBarColor[0],
    brightness: _$YgDefaults.brightness[0],
    colorSchemeSeed: _$YgDefaults.colorSchemeSeed[0],
    focusColor: _$YgDefaults.focusColor[0],
    highlightColor: _$YgDefaults.highlightColor[0],
    iconColor: _$YgDefaults.iconColor[0],
    invertedIconColor: _$YgDefaults.invertedIconColor[0],
    scaffoldColor: _$YgDefaults.scaffoldColor[0],
    splashColor: _$YgDefaults.splashColor[0],
  );

  static final YgDefaults consumerDark = YgDefaults(
    animationCurve: _$YgDefaults.animationCurve[1],
    animationDuration: _$YgDefaults.animationDuration[1],
    appBarColor: _$YgDefaults.appBarColor[1],
    brightness: _$YgDefaults.brightness[1],
    colorSchemeSeed: _$YgDefaults.colorSchemeSeed[1],
    focusColor: _$YgDefaults.focusColor[1],
    highlightColor: _$YgDefaults.highlightColor[1],
    iconColor: _$YgDefaults.iconColor[1],
    invertedIconColor: _$YgDefaults.invertedIconColor[1],
    scaffoldColor: _$YgDefaults.scaffoldColor[1],
    splashColor: _$YgDefaults.splashColor[1],
  );

  static final YgDefaults professionalLight = YgDefaults(
    animationCurve: _$YgDefaults.animationCurve[2],
    animationDuration: _$YgDefaults.animationDuration[2],
    appBarColor: _$YgDefaults.appBarColor[2],
    brightness: _$YgDefaults.brightness[2],
    colorSchemeSeed: _$YgDefaults.colorSchemeSeed[2],
    focusColor: _$YgDefaults.focusColor[2],
    highlightColor: _$YgDefaults.highlightColor[2],
    iconColor: _$YgDefaults.iconColor[2],
    invertedIconColor: _$YgDefaults.invertedIconColor[2],
    scaffoldColor: _$YgDefaults.scaffoldColor[2],
    splashColor: _$YgDefaults.splashColor[2],
  );

  static final YgDefaults professionalDark = YgDefaults(
    animationCurve: _$YgDefaults.animationCurve[3],
    animationDuration: _$YgDefaults.animationDuration[3],
    appBarColor: _$YgDefaults.appBarColor[3],
    brightness: _$YgDefaults.brightness[3],
    colorSchemeSeed: _$YgDefaults.colorSchemeSeed[3],
    focusColor: _$YgDefaults.focusColor[3],
    highlightColor: _$YgDefaults.highlightColor[3],
    iconColor: _$YgDefaults.iconColor[3],
    invertedIconColor: _$YgDefaults.invertedIconColor[3],
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
    Curve? animationCurve,
    Duration? animationDuration,
    Color? appBarColor,
    Brightness? brightness,
    Color? colorSchemeSeed,
    Color? focusColor,
    Color? highlightColor,
    Color? iconColor,
    Color? invertedIconColor,
    Color? scaffoldColor,
    Color? splashColor,
  }) {
    return YgDefaults(
      animationCurve: animationCurve ?? this.animationCurve,
      animationDuration: animationDuration ?? this.animationDuration,
      appBarColor: appBarColor ?? this.appBarColor,
      brightness: brightness ?? this.brightness,
      colorSchemeSeed: colorSchemeSeed ?? this.colorSchemeSeed,
      focusColor: focusColor ?? this.focusColor,
      highlightColor: highlightColor ?? this.highlightColor,
      iconColor: iconColor ?? this.iconColor,
      invertedIconColor: invertedIconColor ?? this.invertedIconColor,
      scaffoldColor: scaffoldColor ?? this.scaffoldColor,
      splashColor: splashColor ?? this.splashColor,
    );
  }

  @override
  YgDefaults lerp(covariant ThemeExtension<YgDefaults>? other, double t) {
    if (other is! YgDefaults) return this as YgDefaults;
    return YgDefaults(
      animationCurve: t < 0.5 ? animationCurve : other.animationCurve,
      animationDuration: t < 0.5 ? animationDuration : other.animationDuration,
      appBarColor: Color.lerp(appBarColor, other.appBarColor, t)!,
      brightness: t < 0.5 ? brightness : other.brightness,
      colorSchemeSeed: Color.lerp(colorSchemeSeed, other.colorSchemeSeed, t)!,
      focusColor: Color.lerp(focusColor, other.focusColor, t)!,
      highlightColor: Color.lerp(highlightColor, other.highlightColor, t)!,
      iconColor: Color.lerp(iconColor, other.iconColor, t)!,
      invertedIconColor:
          Color.lerp(invertedIconColor, other.invertedIconColor, t)!,
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
                .equals(animationCurve, other.animationCurve) &&
            const DeepCollectionEquality()
                .equals(animationDuration, other.animationDuration) &&
            const DeepCollectionEquality()
                .equals(appBarColor, other.appBarColor) &&
            const DeepCollectionEquality()
                .equals(brightness, other.brightness) &&
            const DeepCollectionEquality()
                .equals(colorSchemeSeed, other.colorSchemeSeed) &&
            const DeepCollectionEquality()
                .equals(focusColor, other.focusColor) &&
            const DeepCollectionEquality()
                .equals(highlightColor, other.highlightColor) &&
            const DeepCollectionEquality().equals(iconColor, other.iconColor) &&
            const DeepCollectionEquality()
                .equals(invertedIconColor, other.invertedIconColor) &&
            const DeepCollectionEquality()
                .equals(scaffoldColor, other.scaffoldColor) &&
            const DeepCollectionEquality()
                .equals(splashColor, other.splashColor));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(animationCurve),
      const DeepCollectionEquality().hash(animationDuration),
      const DeepCollectionEquality().hash(appBarColor),
      const DeepCollectionEquality().hash(brightness),
      const DeepCollectionEquality().hash(colorSchemeSeed),
      const DeepCollectionEquality().hash(focusColor),
      const DeepCollectionEquality().hash(highlightColor),
      const DeepCollectionEquality().hash(iconColor),
      const DeepCollectionEquality().hash(invertedIconColor),
      const DeepCollectionEquality().hash(scaffoldColor),
      const DeepCollectionEquality().hash(splashColor),
    );
  }
}
