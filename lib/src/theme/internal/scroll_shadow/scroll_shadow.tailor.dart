// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'scroll_shadow.dart';

// **************************************************************************
// ThemeTailorGenerator
// **************************************************************************

class YgScrollShadowThemes extends ThemeExtension<YgScrollShadowThemes> {
  const YgScrollShadowThemes({
    required this.fadeDuration,
    required this.fadeCurve,
    required this.shadowColor,
    required this.shadowSize,
  });

  final Duration fadeDuration;
  final Curve fadeCurve;
  final Color shadowColor;
  final double shadowSize;

  static final YgScrollShadowThemes consumerLight = YgScrollShadowThemes(
    fadeDuration: _$YgScrollShadowThemes.fadeDuration[0],
    fadeCurve: _$YgScrollShadowThemes.fadeCurve[0],
    shadowColor: _$YgScrollShadowThemes.shadowColor[0],
    shadowSize: _$YgScrollShadowThemes.shadowSize[0],
  );

  static final YgScrollShadowThemes consumerDark = YgScrollShadowThemes(
    fadeDuration: _$YgScrollShadowThemes.fadeDuration[1],
    fadeCurve: _$YgScrollShadowThemes.fadeCurve[1],
    shadowColor: _$YgScrollShadowThemes.shadowColor[1],
    shadowSize: _$YgScrollShadowThemes.shadowSize[1],
  );

  static final YgScrollShadowThemes professionalLight = YgScrollShadowThemes(
    fadeDuration: _$YgScrollShadowThemes.fadeDuration[2],
    fadeCurve: _$YgScrollShadowThemes.fadeCurve[2],
    shadowColor: _$YgScrollShadowThemes.shadowColor[2],
    shadowSize: _$YgScrollShadowThemes.shadowSize[2],
  );

  static final YgScrollShadowThemes professionalDark = YgScrollShadowThemes(
    fadeDuration: _$YgScrollShadowThemes.fadeDuration[3],
    fadeCurve: _$YgScrollShadowThemes.fadeCurve[3],
    shadowColor: _$YgScrollShadowThemes.shadowColor[3],
    shadowSize: _$YgScrollShadowThemes.shadowSize[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgScrollShadowThemes copyWith({
    Duration? fadeDuration,
    Curve? fadeCurve,
    Color? shadowColor,
    double? shadowSize,
  }) {
    return YgScrollShadowThemes(
      fadeDuration: fadeDuration ?? this.fadeDuration,
      fadeCurve: fadeCurve ?? this.fadeCurve,
      shadowColor: shadowColor ?? this.shadowColor,
      shadowSize: shadowSize ?? this.shadowSize,
    );
  }

  @override
  YgScrollShadowThemes lerp(
      ThemeExtension<YgScrollShadowThemes>? other, double t) {
    if (other is! YgScrollShadowThemes) return this;
    return YgScrollShadowThemes(
      fadeDuration: t < 0.5 ? fadeDuration : other.fadeDuration,
      fadeCurve: t < 0.5 ? fadeCurve : other.fadeCurve,
      shadowColor: Color.lerp(shadowColor, other.shadowColor, t)!,
      shadowSize: t < 0.5 ? shadowSize : other.shadowSize,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgScrollShadowThemes &&
            const DeepCollectionEquality()
                .equals(fadeDuration, other.fadeDuration) &&
            const DeepCollectionEquality().equals(fadeCurve, other.fadeCurve) &&
            const DeepCollectionEquality()
                .equals(shadowColor, other.shadowColor) &&
            const DeepCollectionEquality()
                .equals(shadowSize, other.shadowSize));
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        const DeepCollectionEquality().hash(fadeDuration),
        const DeepCollectionEquality().hash(fadeCurve),
        const DeepCollectionEquality().hash(shadowColor),
        const DeepCollectionEquality().hash(shadowSize));
  }
}
