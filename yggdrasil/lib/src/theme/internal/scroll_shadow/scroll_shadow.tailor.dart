// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'scroll_shadow.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgScrollShadowThemes extends ThemeExtension<YgScrollShadowThemes> {
  const YgScrollShadowThemes({
    required this.fadeCurve,
    required this.fadeDuration,
    required this.shadowColor,
    required this.shadowSize,
  });

  final Curve fadeCurve;
  final Duration fadeDuration;
  final Color shadowColor;
  final double shadowSize;

  static final YgScrollShadowThemes consumerLight = YgScrollShadowThemes(
    fadeCurve: _$YgScrollShadowThemes.fadeCurve[0],
    fadeDuration: _$YgScrollShadowThemes.fadeDuration[0],
    shadowColor: _$YgScrollShadowThemes.shadowColor[0],
    shadowSize: _$YgScrollShadowThemes.shadowSize[0],
  );

  static final YgScrollShadowThemes consumerDark = YgScrollShadowThemes(
    fadeCurve: _$YgScrollShadowThemes.fadeCurve[1],
    fadeDuration: _$YgScrollShadowThemes.fadeDuration[1],
    shadowColor: _$YgScrollShadowThemes.shadowColor[1],
    shadowSize: _$YgScrollShadowThemes.shadowSize[1],
  );

  static final YgScrollShadowThemes professionalLight = YgScrollShadowThemes(
    fadeCurve: _$YgScrollShadowThemes.fadeCurve[2],
    fadeDuration: _$YgScrollShadowThemes.fadeDuration[2],
    shadowColor: _$YgScrollShadowThemes.shadowColor[2],
    shadowSize: _$YgScrollShadowThemes.shadowSize[2],
  );

  static final YgScrollShadowThemes professionalDark = YgScrollShadowThemes(
    fadeCurve: _$YgScrollShadowThemes.fadeCurve[3],
    fadeDuration: _$YgScrollShadowThemes.fadeDuration[3],
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
    Curve? fadeCurve,
    Duration? fadeDuration,
    Color? shadowColor,
    double? shadowSize,
  }) {
    return YgScrollShadowThemes(
      fadeCurve: fadeCurve ?? this.fadeCurve,
      fadeDuration: fadeDuration ?? this.fadeDuration,
      shadowColor: shadowColor ?? this.shadowColor,
      shadowSize: shadowSize ?? this.shadowSize,
    );
  }

  @override
  YgScrollShadowThemes lerp(covariant ThemeExtension<YgScrollShadowThemes>? other, double t) {
    if (other is! YgScrollShadowThemes) return this as YgScrollShadowThemes;
    return YgScrollShadowThemes(
      fadeCurve: t < 0.5 ? fadeCurve : other.fadeCurve,
      fadeDuration: t < 0.5 ? fadeDuration : other.fadeDuration,
      shadowColor: Color.lerp(shadowColor, other.shadowColor, t)!,
      shadowSize: t < 0.5 ? shadowSize : other.shadowSize,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgScrollShadowThemes &&
            const DeepCollectionEquality().equals(fadeCurve, other.fadeCurve) &&
            const DeepCollectionEquality().equals(fadeDuration, other.fadeDuration) &&
            const DeepCollectionEquality().equals(shadowColor, other.shadowColor) &&
            const DeepCollectionEquality().equals(shadowSize, other.shadowSize));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(fadeCurve),
      const DeepCollectionEquality().hash(fadeDuration),
      const DeepCollectionEquality().hash(shadowColor),
      const DeepCollectionEquality().hash(shadowSize),
    );
  }
}
