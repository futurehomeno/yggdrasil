// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'layout_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgLayoutTheme extends ThemeExtension<YgLayoutTheme> {
  const YgLayoutTheme({
    required this.animationCurve,
    required this.animationDuration,
    required this.backgroundColor,
    required this.footerPadding,
  });

  final Curve animationCurve;
  final Duration animationDuration;
  final Color backgroundColor;
  final EdgeInsets footerPadding;

  static final YgLayoutTheme consumerLight = YgLayoutTheme(
    animationCurve: _$YgLayoutTheme.animationCurve[0],
    animationDuration: _$YgLayoutTheme.animationDuration[0],
    backgroundColor: _$YgLayoutTheme.backgroundColor[0],
    footerPadding: _$YgLayoutTheme.footerPadding[0],
  );

  static final YgLayoutTheme consumerDark = YgLayoutTheme(
    animationCurve: _$YgLayoutTheme.animationCurve[1],
    animationDuration: _$YgLayoutTheme.animationDuration[1],
    backgroundColor: _$YgLayoutTheme.backgroundColor[1],
    footerPadding: _$YgLayoutTheme.footerPadding[1],
  );

  static final YgLayoutTheme professionalLight = YgLayoutTheme(
    animationCurve: _$YgLayoutTheme.animationCurve[2],
    animationDuration: _$YgLayoutTheme.animationDuration[2],
    backgroundColor: _$YgLayoutTheme.backgroundColor[2],
    footerPadding: _$YgLayoutTheme.footerPadding[2],
  );

  static final YgLayoutTheme professionalDark = YgLayoutTheme(
    animationCurve: _$YgLayoutTheme.animationCurve[3],
    animationDuration: _$YgLayoutTheme.animationDuration[3],
    backgroundColor: _$YgLayoutTheme.backgroundColor[3],
    footerPadding: _$YgLayoutTheme.footerPadding[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgLayoutTheme copyWith({
    Curve? animationCurve,
    Duration? animationDuration,
    Color? backgroundColor,
    EdgeInsets? footerPadding,
  }) {
    return YgLayoutTheme(
      animationCurve: animationCurve ?? this.animationCurve,
      animationDuration: animationDuration ?? this.animationDuration,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      footerPadding: footerPadding ?? this.footerPadding,
    );
  }

  @override
  YgLayoutTheme lerp(covariant ThemeExtension<YgLayoutTheme>? other, double t) {
    if (other is! YgLayoutTheme) return this as YgLayoutTheme;
    return YgLayoutTheme(
      animationCurve: t < 0.5 ? animationCurve : other.animationCurve,
      animationDuration: t < 0.5 ? animationDuration : other.animationDuration,
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      footerPadding: t < 0.5 ? footerPadding : other.footerPadding,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgLayoutTheme &&
            const DeepCollectionEquality()
                .equals(animationCurve, other.animationCurve) &&
            const DeepCollectionEquality()
                .equals(animationDuration, other.animationDuration) &&
            const DeepCollectionEquality()
                .equals(backgroundColor, other.backgroundColor) &&
            const DeepCollectionEquality()
                .equals(footerPadding, other.footerPadding));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(animationCurve),
      const DeepCollectionEquality().hash(animationDuration),
      const DeepCollectionEquality().hash(backgroundColor),
      const DeepCollectionEquality().hash(footerPadding),
    );
  }
}
