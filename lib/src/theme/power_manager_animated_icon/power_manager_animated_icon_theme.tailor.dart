// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'power_manager_animated_icon_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class PowerManagerAnimatedIconTheme
    extends ThemeExtension<PowerManagerAnimatedIconTheme> {
  const PowerManagerAnimatedIconTheme({
    required this.animationCurve,
    required this.animationDuration,
    required this.decreasingColor,
    required this.increasingColor,
  });

  final Curve animationCurve;
  final Duration animationDuration;
  final Color decreasingColor;
  final Color increasingColor;

  static final PowerManagerAnimatedIconTheme consumerLight =
      PowerManagerAnimatedIconTheme(
    animationCurve: _$PowerManagerAnimatedIconTheme.animationCurve[0],
    animationDuration: _$PowerManagerAnimatedIconTheme.animationDuration[0],
    decreasingColor: _$PowerManagerAnimatedIconTheme.decreasingColor[0],
    increasingColor: _$PowerManagerAnimatedIconTheme.increasingColor[0],
  );

  static final PowerManagerAnimatedIconTheme consumerDark =
      PowerManagerAnimatedIconTheme(
    animationCurve: _$PowerManagerAnimatedIconTheme.animationCurve[1],
    animationDuration: _$PowerManagerAnimatedIconTheme.animationDuration[1],
    decreasingColor: _$PowerManagerAnimatedIconTheme.decreasingColor[1],
    increasingColor: _$PowerManagerAnimatedIconTheme.increasingColor[1],
  );

  static final PowerManagerAnimatedIconTheme professionalLight =
      PowerManagerAnimatedIconTheme(
    animationCurve: _$PowerManagerAnimatedIconTheme.animationCurve[2],
    animationDuration: _$PowerManagerAnimatedIconTheme.animationDuration[2],
    decreasingColor: _$PowerManagerAnimatedIconTheme.decreasingColor[2],
    increasingColor: _$PowerManagerAnimatedIconTheme.increasingColor[2],
  );

  static final PowerManagerAnimatedIconTheme professionalDark =
      PowerManagerAnimatedIconTheme(
    animationCurve: _$PowerManagerAnimatedIconTheme.animationCurve[3],
    animationDuration: _$PowerManagerAnimatedIconTheme.animationDuration[3],
    decreasingColor: _$PowerManagerAnimatedIconTheme.decreasingColor[3],
    increasingColor: _$PowerManagerAnimatedIconTheme.increasingColor[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  PowerManagerAnimatedIconTheme copyWith({
    Curve? animationCurve,
    Duration? animationDuration,
    Color? decreasingColor,
    Color? increasingColor,
  }) {
    return PowerManagerAnimatedIconTheme(
      animationCurve: animationCurve ?? this.animationCurve,
      animationDuration: animationDuration ?? this.animationDuration,
      decreasingColor: decreasingColor ?? this.decreasingColor,
      increasingColor: increasingColor ?? this.increasingColor,
    );
  }

  @override
  PowerManagerAnimatedIconTheme lerp(
      covariant ThemeExtension<PowerManagerAnimatedIconTheme>? other,
      double t) {
    if (other is! PowerManagerAnimatedIconTheme)
      return this as PowerManagerAnimatedIconTheme;
    return PowerManagerAnimatedIconTheme(
      animationCurve: t < 0.5 ? animationCurve : other.animationCurve,
      animationDuration: t < 0.5 ? animationDuration : other.animationDuration,
      decreasingColor: Color.lerp(decreasingColor, other.decreasingColor, t)!,
      increasingColor: Color.lerp(increasingColor, other.increasingColor, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PowerManagerAnimatedIconTheme &&
            const DeepCollectionEquality()
                .equals(animationCurve, other.animationCurve) &&
            const DeepCollectionEquality()
                .equals(animationDuration, other.animationDuration) &&
            const DeepCollectionEquality()
                .equals(decreasingColor, other.decreasingColor) &&
            const DeepCollectionEquality()
                .equals(increasingColor, other.increasingColor));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(animationCurve),
      const DeepCollectionEquality().hash(animationDuration),
      const DeepCollectionEquality().hash(decreasingColor),
      const DeepCollectionEquality().hash(increasingColor),
    );
  }
}
