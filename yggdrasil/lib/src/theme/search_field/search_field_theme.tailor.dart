// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'search_field_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgSearchFieldTheme extends ThemeExtension<YgSearchFieldTheme> {
  const YgSearchFieldTheme({
    required this.animationCurve,
    required this.animationDuration,
    required this.progressIndicatorColor,
    required this.progressIndicatorSize,
  });

  final Curve animationCurve;
  final Duration animationDuration;
  final Color progressIndicatorColor;
  final Size progressIndicatorSize;

  static final YgSearchFieldTheme consumerLight = YgSearchFieldTheme(
    animationCurve: _$YgSearchFieldTheme.animationCurve[0],
    animationDuration: _$YgSearchFieldTheme.animationDuration[0],
    progressIndicatorColor: _$YgSearchFieldTheme.progressIndicatorColor[0],
    progressIndicatorSize: _$YgSearchFieldTheme.progressIndicatorSize[0],
  );

  static final YgSearchFieldTheme consumerDark = YgSearchFieldTheme(
    animationCurve: _$YgSearchFieldTheme.animationCurve[1],
    animationDuration: _$YgSearchFieldTheme.animationDuration[1],
    progressIndicatorColor: _$YgSearchFieldTheme.progressIndicatorColor[1],
    progressIndicatorSize: _$YgSearchFieldTheme.progressIndicatorSize[1],
  );

  static final YgSearchFieldTheme professionalLight = YgSearchFieldTheme(
    animationCurve: _$YgSearchFieldTheme.animationCurve[2],
    animationDuration: _$YgSearchFieldTheme.animationDuration[2],
    progressIndicatorColor: _$YgSearchFieldTheme.progressIndicatorColor[2],
    progressIndicatorSize: _$YgSearchFieldTheme.progressIndicatorSize[2],
  );

  static final YgSearchFieldTheme professionalDark = YgSearchFieldTheme(
    animationCurve: _$YgSearchFieldTheme.animationCurve[3],
    animationDuration: _$YgSearchFieldTheme.animationDuration[3],
    progressIndicatorColor: _$YgSearchFieldTheme.progressIndicatorColor[3],
    progressIndicatorSize: _$YgSearchFieldTheme.progressIndicatorSize[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgSearchFieldTheme copyWith({
    Curve? animationCurve,
    Duration? animationDuration,
    Color? progressIndicatorColor,
    Size? progressIndicatorSize,
  }) {
    return YgSearchFieldTheme(
      animationCurve: animationCurve ?? this.animationCurve,
      animationDuration: animationDuration ?? this.animationDuration,
      progressIndicatorColor: progressIndicatorColor ?? this.progressIndicatorColor,
      progressIndicatorSize: progressIndicatorSize ?? this.progressIndicatorSize,
    );
  }

  @override
  YgSearchFieldTheme lerp(covariant ThemeExtension<YgSearchFieldTheme>? other, double t) {
    if (other is! YgSearchFieldTheme) return this as YgSearchFieldTheme;
    return YgSearchFieldTheme(
      animationCurve: t < 0.5 ? animationCurve : other.animationCurve,
      animationDuration: t < 0.5 ? animationDuration : other.animationDuration,
      progressIndicatorColor: Color.lerp(progressIndicatorColor, other.progressIndicatorColor, t)!,
      progressIndicatorSize: t < 0.5 ? progressIndicatorSize : other.progressIndicatorSize,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgSearchFieldTheme &&
            const DeepCollectionEquality().equals(animationCurve, other.animationCurve) &&
            const DeepCollectionEquality().equals(animationDuration, other.animationDuration) &&
            const DeepCollectionEquality().equals(progressIndicatorColor, other.progressIndicatorColor) &&
            const DeepCollectionEquality().equals(progressIndicatorSize, other.progressIndicatorSize));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(animationCurve),
      const DeepCollectionEquality().hash(animationDuration),
      const DeepCollectionEquality().hash(progressIndicatorColor),
      const DeepCollectionEquality().hash(progressIndicatorSize),
    );
  }
}
