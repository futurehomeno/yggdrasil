// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'picker_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgPickerTheme extends ThemeExtension<YgPickerTheme> {
  const YgPickerTheme({
    required this.animationCurve,
    required this.animationDuration,
    required this.backgroundColor,
    required this.columnPadding,
    required this.indicatorBorderRadius,
    required this.indicatorColor,
    required this.indicatorPadding,
    required this.minimumColumnWidth,
    required this.textDefaultStyle,
    required this.textPadding,
    required this.textSelectedStyle,
  });

  final Curve animationCurve;
  final Duration animationDuration;
  final Color backgroundColor;
  final EdgeInsets columnPadding;
  final BorderRadius indicatorBorderRadius;
  final Color indicatorColor;
  final EdgeInsets indicatorPadding;
  final double minimumColumnWidth;
  final TextStyle textDefaultStyle;
  final EdgeInsets textPadding;
  final TextStyle textSelectedStyle;

  static final YgPickerTheme consumerLight = YgPickerTheme(
    animationCurve: _$YgPickerTheme.animationCurve[0],
    animationDuration: _$YgPickerTheme.animationDuration[0],
    backgroundColor: _$YgPickerTheme.backgroundColor[0],
    columnPadding: _$YgPickerTheme.columnPadding[0],
    indicatorBorderRadius: _$YgPickerTheme.indicatorBorderRadius[0],
    indicatorColor: _$YgPickerTheme.indicatorColor[0],
    indicatorPadding: _$YgPickerTheme.indicatorPadding[0],
    minimumColumnWidth: _$YgPickerTheme.minimumColumnWidth[0],
    textDefaultStyle: _$YgPickerTheme.textDefaultStyle[0],
    textPadding: _$YgPickerTheme.textPadding[0],
    textSelectedStyle: _$YgPickerTheme.textSelectedStyle[0],
  );

  static final YgPickerTheme consumerDark = YgPickerTheme(
    animationCurve: _$YgPickerTheme.animationCurve[1],
    animationDuration: _$YgPickerTheme.animationDuration[1],
    backgroundColor: _$YgPickerTheme.backgroundColor[1],
    columnPadding: _$YgPickerTheme.columnPadding[1],
    indicatorBorderRadius: _$YgPickerTheme.indicatorBorderRadius[1],
    indicatorColor: _$YgPickerTheme.indicatorColor[1],
    indicatorPadding: _$YgPickerTheme.indicatorPadding[1],
    minimumColumnWidth: _$YgPickerTheme.minimumColumnWidth[1],
    textDefaultStyle: _$YgPickerTheme.textDefaultStyle[1],
    textPadding: _$YgPickerTheme.textPadding[1],
    textSelectedStyle: _$YgPickerTheme.textSelectedStyle[1],
  );

  static final YgPickerTheme professionalLight = YgPickerTheme(
    animationCurve: _$YgPickerTheme.animationCurve[2],
    animationDuration: _$YgPickerTheme.animationDuration[2],
    backgroundColor: _$YgPickerTheme.backgroundColor[2],
    columnPadding: _$YgPickerTheme.columnPadding[2],
    indicatorBorderRadius: _$YgPickerTheme.indicatorBorderRadius[2],
    indicatorColor: _$YgPickerTheme.indicatorColor[2],
    indicatorPadding: _$YgPickerTheme.indicatorPadding[2],
    minimumColumnWidth: _$YgPickerTheme.minimumColumnWidth[2],
    textDefaultStyle: _$YgPickerTheme.textDefaultStyle[2],
    textPadding: _$YgPickerTheme.textPadding[2],
    textSelectedStyle: _$YgPickerTheme.textSelectedStyle[2],
  );

  static final YgPickerTheme professionalDark = YgPickerTheme(
    animationCurve: _$YgPickerTheme.animationCurve[3],
    animationDuration: _$YgPickerTheme.animationDuration[3],
    backgroundColor: _$YgPickerTheme.backgroundColor[3],
    columnPadding: _$YgPickerTheme.columnPadding[3],
    indicatorBorderRadius: _$YgPickerTheme.indicatorBorderRadius[3],
    indicatorColor: _$YgPickerTheme.indicatorColor[3],
    indicatorPadding: _$YgPickerTheme.indicatorPadding[3],
    minimumColumnWidth: _$YgPickerTheme.minimumColumnWidth[3],
    textDefaultStyle: _$YgPickerTheme.textDefaultStyle[3],
    textPadding: _$YgPickerTheme.textPadding[3],
    textSelectedStyle: _$YgPickerTheme.textSelectedStyle[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgPickerTheme copyWith({
    Curve? animationCurve,
    Duration? animationDuration,
    Color? backgroundColor,
    EdgeInsets? columnPadding,
    BorderRadius? indicatorBorderRadius,
    Color? indicatorColor,
    EdgeInsets? indicatorPadding,
    double? minimumColumnWidth,
    TextStyle? textDefaultStyle,
    EdgeInsets? textPadding,
    TextStyle? textSelectedStyle,
  }) {
    return YgPickerTheme(
      animationCurve: animationCurve ?? this.animationCurve,
      animationDuration: animationDuration ?? this.animationDuration,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      columnPadding: columnPadding ?? this.columnPadding,
      indicatorBorderRadius: indicatorBorderRadius ?? this.indicatorBorderRadius,
      indicatorColor: indicatorColor ?? this.indicatorColor,
      indicatorPadding: indicatorPadding ?? this.indicatorPadding,
      minimumColumnWidth: minimumColumnWidth ?? this.minimumColumnWidth,
      textDefaultStyle: textDefaultStyle ?? this.textDefaultStyle,
      textPadding: textPadding ?? this.textPadding,
      textSelectedStyle: textSelectedStyle ?? this.textSelectedStyle,
    );
  }

  @override
  YgPickerTheme lerp(covariant ThemeExtension<YgPickerTheme>? other, double t) {
    if (other is! YgPickerTheme) return this as YgPickerTheme;
    return YgPickerTheme(
      animationCurve: t < 0.5 ? animationCurve : other.animationCurve,
      animationDuration: t < 0.5 ? animationDuration : other.animationDuration,
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      columnPadding: t < 0.5 ? columnPadding : other.columnPadding,
      indicatorBorderRadius: t < 0.5 ? indicatorBorderRadius : other.indicatorBorderRadius,
      indicatorColor: Color.lerp(indicatorColor, other.indicatorColor, t)!,
      indicatorPadding: t < 0.5 ? indicatorPadding : other.indicatorPadding,
      minimumColumnWidth: t < 0.5 ? minimumColumnWidth : other.minimumColumnWidth,
      textDefaultStyle: TextStyle.lerp(textDefaultStyle, other.textDefaultStyle, t)!,
      textPadding: t < 0.5 ? textPadding : other.textPadding,
      textSelectedStyle: TextStyle.lerp(textSelectedStyle, other.textSelectedStyle, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgPickerTheme &&
            const DeepCollectionEquality().equals(animationCurve, other.animationCurve) &&
            const DeepCollectionEquality().equals(animationDuration, other.animationDuration) &&
            const DeepCollectionEquality().equals(backgroundColor, other.backgroundColor) &&
            const DeepCollectionEquality().equals(columnPadding, other.columnPadding) &&
            const DeepCollectionEquality().equals(indicatorBorderRadius, other.indicatorBorderRadius) &&
            const DeepCollectionEquality().equals(indicatorColor, other.indicatorColor) &&
            const DeepCollectionEquality().equals(indicatorPadding, other.indicatorPadding) &&
            const DeepCollectionEquality().equals(minimumColumnWidth, other.minimumColumnWidth) &&
            const DeepCollectionEquality().equals(textDefaultStyle, other.textDefaultStyle) &&
            const DeepCollectionEquality().equals(textPadding, other.textPadding) &&
            const DeepCollectionEquality().equals(textSelectedStyle, other.textSelectedStyle));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(animationCurve),
      const DeepCollectionEquality().hash(animationDuration),
      const DeepCollectionEquality().hash(backgroundColor),
      const DeepCollectionEquality().hash(columnPadding),
      const DeepCollectionEquality().hash(indicatorBorderRadius),
      const DeepCollectionEquality().hash(indicatorColor),
      const DeepCollectionEquality().hash(indicatorPadding),
      const DeepCollectionEquality().hash(minimumColumnWidth),
      const DeepCollectionEquality().hash(textDefaultStyle),
      const DeepCollectionEquality().hash(textPadding),
      const DeepCollectionEquality().hash(textSelectedStyle),
    );
  }
}
