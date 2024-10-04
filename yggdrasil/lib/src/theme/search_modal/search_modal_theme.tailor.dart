// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'search_modal_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgSearchModalTheme extends ThemeExtension<YgSearchModalTheme> {
  const YgSearchModalTheme({
    required this.animationCurve,
    required this.animationDuration,
    required this.cursorColor,
    required this.headerHeight,
    required this.headerPadding,
    required this.headerSpacing,
    required this.placeholderStyle,
    required this.valueStyle,
  });

  final Curve animationCurve;
  final Duration animationDuration;
  final Color cursorColor;
  final double headerHeight;
  final EdgeInsets headerPadding;
  final double headerSpacing;
  final TextStyle placeholderStyle;
  final TextStyle valueStyle;

  static final YgSearchModalTheme consumerLight = YgSearchModalTheme(
    animationCurve: _$YgSearchModalTheme.animationCurve[0],
    animationDuration: _$YgSearchModalTheme.animationDuration[0],
    cursorColor: _$YgSearchModalTheme.cursorColor[0],
    headerHeight: _$YgSearchModalTheme.headerHeight[0],
    headerPadding: _$YgSearchModalTheme.headerPadding[0],
    headerSpacing: _$YgSearchModalTheme.headerSpacing[0],
    placeholderStyle: _$YgSearchModalTheme.placeholderStyle[0],
    valueStyle: _$YgSearchModalTheme.valueStyle[0],
  );

  static final YgSearchModalTheme consumerDark = YgSearchModalTheme(
    animationCurve: _$YgSearchModalTheme.animationCurve[1],
    animationDuration: _$YgSearchModalTheme.animationDuration[1],
    cursorColor: _$YgSearchModalTheme.cursorColor[1],
    headerHeight: _$YgSearchModalTheme.headerHeight[1],
    headerPadding: _$YgSearchModalTheme.headerPadding[1],
    headerSpacing: _$YgSearchModalTheme.headerSpacing[1],
    placeholderStyle: _$YgSearchModalTheme.placeholderStyle[1],
    valueStyle: _$YgSearchModalTheme.valueStyle[1],
  );

  static final YgSearchModalTheme professionalLight = YgSearchModalTheme(
    animationCurve: _$YgSearchModalTheme.animationCurve[2],
    animationDuration: _$YgSearchModalTheme.animationDuration[2],
    cursorColor: _$YgSearchModalTheme.cursorColor[2],
    headerHeight: _$YgSearchModalTheme.headerHeight[2],
    headerPadding: _$YgSearchModalTheme.headerPadding[2],
    headerSpacing: _$YgSearchModalTheme.headerSpacing[2],
    placeholderStyle: _$YgSearchModalTheme.placeholderStyle[2],
    valueStyle: _$YgSearchModalTheme.valueStyle[2],
  );

  static final YgSearchModalTheme professionalDark = YgSearchModalTheme(
    animationCurve: _$YgSearchModalTheme.animationCurve[3],
    animationDuration: _$YgSearchModalTheme.animationDuration[3],
    cursorColor: _$YgSearchModalTheme.cursorColor[3],
    headerHeight: _$YgSearchModalTheme.headerHeight[3],
    headerPadding: _$YgSearchModalTheme.headerPadding[3],
    headerSpacing: _$YgSearchModalTheme.headerSpacing[3],
    placeholderStyle: _$YgSearchModalTheme.placeholderStyle[3],
    valueStyle: _$YgSearchModalTheme.valueStyle[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgSearchModalTheme copyWith({
    Curve? animationCurve,
    Duration? animationDuration,
    Color? cursorColor,
    double? headerHeight,
    EdgeInsets? headerPadding,
    double? headerSpacing,
    TextStyle? placeholderStyle,
    TextStyle? valueStyle,
  }) {
    return YgSearchModalTheme(
      animationCurve: animationCurve ?? this.animationCurve,
      animationDuration: animationDuration ?? this.animationDuration,
      cursorColor: cursorColor ?? this.cursorColor,
      headerHeight: headerHeight ?? this.headerHeight,
      headerPadding: headerPadding ?? this.headerPadding,
      headerSpacing: headerSpacing ?? this.headerSpacing,
      placeholderStyle: placeholderStyle ?? this.placeholderStyle,
      valueStyle: valueStyle ?? this.valueStyle,
    );
  }

  @override
  YgSearchModalTheme lerp(
      covariant ThemeExtension<YgSearchModalTheme>? other, double t) {
    if (other is! YgSearchModalTheme) return this as YgSearchModalTheme;
    return YgSearchModalTheme(
      animationCurve: t < 0.5 ? animationCurve : other.animationCurve,
      animationDuration: t < 0.5 ? animationDuration : other.animationDuration,
      cursorColor: Color.lerp(cursorColor, other.cursorColor, t)!,
      headerHeight: t < 0.5 ? headerHeight : other.headerHeight,
      headerPadding: t < 0.5 ? headerPadding : other.headerPadding,
      headerSpacing: t < 0.5 ? headerSpacing : other.headerSpacing,
      placeholderStyle:
          TextStyle.lerp(placeholderStyle, other.placeholderStyle, t)!,
      valueStyle: TextStyle.lerp(valueStyle, other.valueStyle, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgSearchModalTheme &&
            const DeepCollectionEquality()
                .equals(animationCurve, other.animationCurve) &&
            const DeepCollectionEquality()
                .equals(animationDuration, other.animationDuration) &&
            const DeepCollectionEquality()
                .equals(cursorColor, other.cursorColor) &&
            const DeepCollectionEquality()
                .equals(headerHeight, other.headerHeight) &&
            const DeepCollectionEquality()
                .equals(headerPadding, other.headerPadding) &&
            const DeepCollectionEquality()
                .equals(headerSpacing, other.headerSpacing) &&
            const DeepCollectionEquality()
                .equals(placeholderStyle, other.placeholderStyle) &&
            const DeepCollectionEquality()
                .equals(valueStyle, other.valueStyle));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(animationCurve),
      const DeepCollectionEquality().hash(animationDuration),
      const DeepCollectionEquality().hash(cursorColor),
      const DeepCollectionEquality().hash(headerHeight),
      const DeepCollectionEquality().hash(headerPadding),
      const DeepCollectionEquality().hash(headerSpacing),
      const DeepCollectionEquality().hash(placeholderStyle),
      const DeepCollectionEquality().hash(valueStyle),
    );
  }
}
