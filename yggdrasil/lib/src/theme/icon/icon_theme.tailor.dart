// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'icon_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgIconTheme extends ThemeExtension<YgIconTheme> {
  const YgIconTheme({
    required this.animationCurve,
    required this.animationDuration,
    required this.defaultColor,
    required this.sizeLarge,
    required this.sizeSmall,
  });

  final Curve animationCurve;
  final Duration animationDuration;
  final Color defaultColor;
  final double sizeLarge;
  final double sizeSmall;

  static final YgIconTheme consumerLight = YgIconTheme(
    animationCurve: _$YgIconTheme.animationCurve[0],
    animationDuration: _$YgIconTheme.animationDuration[0],
    defaultColor: _$YgIconTheme.defaultColor[0],
    sizeLarge: _$YgIconTheme.sizeLarge[0],
    sizeSmall: _$YgIconTheme.sizeSmall[0],
  );

  static final YgIconTheme consumerDark = YgIconTheme(
    animationCurve: _$YgIconTheme.animationCurve[1],
    animationDuration: _$YgIconTheme.animationDuration[1],
    defaultColor: _$YgIconTheme.defaultColor[1],
    sizeLarge: _$YgIconTheme.sizeLarge[1],
    sizeSmall: _$YgIconTheme.sizeSmall[1],
  );

  static final YgIconTheme professionalLight = YgIconTheme(
    animationCurve: _$YgIconTheme.animationCurve[2],
    animationDuration: _$YgIconTheme.animationDuration[2],
    defaultColor: _$YgIconTheme.defaultColor[2],
    sizeLarge: _$YgIconTheme.sizeLarge[2],
    sizeSmall: _$YgIconTheme.sizeSmall[2],
  );

  static final YgIconTheme professionalDark = YgIconTheme(
    animationCurve: _$YgIconTheme.animationCurve[3],
    animationDuration: _$YgIconTheme.animationDuration[3],
    defaultColor: _$YgIconTheme.defaultColor[3],
    sizeLarge: _$YgIconTheme.sizeLarge[3],
    sizeSmall: _$YgIconTheme.sizeSmall[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgIconTheme copyWith({
    Curve? animationCurve,
    Duration? animationDuration,
    Color? defaultColor,
    double? sizeLarge,
    double? sizeSmall,
  }) {
    return YgIconTheme(
      animationCurve: animationCurve ?? this.animationCurve,
      animationDuration: animationDuration ?? this.animationDuration,
      defaultColor: defaultColor ?? this.defaultColor,
      sizeLarge: sizeLarge ?? this.sizeLarge,
      sizeSmall: sizeSmall ?? this.sizeSmall,
    );
  }

  @override
  YgIconTheme lerp(covariant ThemeExtension<YgIconTheme>? other, double t) {
    if (other is! YgIconTheme) return this as YgIconTheme;
    return YgIconTheme(
      animationCurve: t < 0.5 ? animationCurve : other.animationCurve,
      animationDuration: t < 0.5 ? animationDuration : other.animationDuration,
      defaultColor: Color.lerp(defaultColor, other.defaultColor, t)!,
      sizeLarge: t < 0.5 ? sizeLarge : other.sizeLarge,
      sizeSmall: t < 0.5 ? sizeSmall : other.sizeSmall,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgIconTheme &&
            const DeepCollectionEquality()
                .equals(animationCurve, other.animationCurve) &&
            const DeepCollectionEquality()
                .equals(animationDuration, other.animationDuration) &&
            const DeepCollectionEquality()
                .equals(defaultColor, other.defaultColor) &&
            const DeepCollectionEquality().equals(sizeLarge, other.sizeLarge) &&
            const DeepCollectionEquality().equals(sizeSmall, other.sizeSmall));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(animationCurve),
      const DeepCollectionEquality().hash(animationDuration),
      const DeepCollectionEquality().hash(defaultColor),
      const DeepCollectionEquality().hash(sizeLarge),
      const DeepCollectionEquality().hash(sizeSmall),
    );
  }
}
