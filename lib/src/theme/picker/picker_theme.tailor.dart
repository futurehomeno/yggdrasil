// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'picker_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgPickerTheme extends ThemeExtension<YgPickerTheme> {
  const YgPickerTheme({
    required this.backgroundColor,
    required this.columnSpacing,
    required this.indicatorBorderRadius,
    required this.indicatorColor,
    required this.indicatorVerticalPadding,
    required this.minimumColumnWidth,
    required this.textDefaultStyle,
    required this.textPadding,
    required this.textSelectedStyle,
  });

  final Color backgroundColor;
  final double columnSpacing;
  final BorderRadius indicatorBorderRadius;
  final Color indicatorColor;
  final double indicatorVerticalPadding;
  final double minimumColumnWidth;
  final TextStyle textDefaultStyle;
  final EdgeInsets textPadding;
  final TextStyle textSelectedStyle;

  static final YgPickerTheme consumerLight = YgPickerTheme(
    backgroundColor: _$YgPickerTheme.backgroundColor[0],
    columnSpacing: _$YgPickerTheme.columnSpacing[0],
    indicatorBorderRadius: _$YgPickerTheme.indicatorBorderRadius[0],
    indicatorColor: _$YgPickerTheme.indicatorColor[0],
    indicatorVerticalPadding: _$YgPickerTheme.indicatorVerticalPadding[0],
    minimumColumnWidth: _$YgPickerTheme.minimumColumnWidth[0],
    textDefaultStyle: _$YgPickerTheme.textDefaultStyle[0],
    textPadding: _$YgPickerTheme.textPadding[0],
    textSelectedStyle: _$YgPickerTheme.textSelectedStyle[0],
  );

  static final YgPickerTheme consumerDark = YgPickerTheme(
    backgroundColor: _$YgPickerTheme.backgroundColor[1],
    columnSpacing: _$YgPickerTheme.columnSpacing[1],
    indicatorBorderRadius: _$YgPickerTheme.indicatorBorderRadius[1],
    indicatorColor: _$YgPickerTheme.indicatorColor[1],
    indicatorVerticalPadding: _$YgPickerTheme.indicatorVerticalPadding[1],
    minimumColumnWidth: _$YgPickerTheme.minimumColumnWidth[1],
    textDefaultStyle: _$YgPickerTheme.textDefaultStyle[1],
    textPadding: _$YgPickerTheme.textPadding[1],
    textSelectedStyle: _$YgPickerTheme.textSelectedStyle[1],
  );

  static final YgPickerTheme professionalLight = YgPickerTheme(
    backgroundColor: _$YgPickerTheme.backgroundColor[2],
    columnSpacing: _$YgPickerTheme.columnSpacing[2],
    indicatorBorderRadius: _$YgPickerTheme.indicatorBorderRadius[2],
    indicatorColor: _$YgPickerTheme.indicatorColor[2],
    indicatorVerticalPadding: _$YgPickerTheme.indicatorVerticalPadding[2],
    minimumColumnWidth: _$YgPickerTheme.minimumColumnWidth[2],
    textDefaultStyle: _$YgPickerTheme.textDefaultStyle[2],
    textPadding: _$YgPickerTheme.textPadding[2],
    textSelectedStyle: _$YgPickerTheme.textSelectedStyle[2],
  );

  static final YgPickerTheme professionalDark = YgPickerTheme(
    backgroundColor: _$YgPickerTheme.backgroundColor[3],
    columnSpacing: _$YgPickerTheme.columnSpacing[3],
    indicatorBorderRadius: _$YgPickerTheme.indicatorBorderRadius[3],
    indicatorColor: _$YgPickerTheme.indicatorColor[3],
    indicatorVerticalPadding: _$YgPickerTheme.indicatorVerticalPadding[3],
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
    Color? backgroundColor,
    double? columnSpacing,
    BorderRadius? indicatorBorderRadius,
    Color? indicatorColor,
    double? indicatorVerticalPadding,
    double? minimumColumnWidth,
    TextStyle? textDefaultStyle,
    EdgeInsets? textPadding,
    TextStyle? textSelectedStyle,
  }) {
    return YgPickerTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      columnSpacing: columnSpacing ?? this.columnSpacing,
      indicatorBorderRadius:
          indicatorBorderRadius ?? this.indicatorBorderRadius,
      indicatorColor: indicatorColor ?? this.indicatorColor,
      indicatorVerticalPadding:
          indicatorVerticalPadding ?? this.indicatorVerticalPadding,
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
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      columnSpacing: t < 0.5 ? columnSpacing : other.columnSpacing,
      indicatorBorderRadius:
          t < 0.5 ? indicatorBorderRadius : other.indicatorBorderRadius,
      indicatorColor: Color.lerp(indicatorColor, other.indicatorColor, t)!,
      indicatorVerticalPadding:
          t < 0.5 ? indicatorVerticalPadding : other.indicatorVerticalPadding,
      minimumColumnWidth:
          t < 0.5 ? minimumColumnWidth : other.minimumColumnWidth,
      textDefaultStyle:
          TextStyle.lerp(textDefaultStyle, other.textDefaultStyle, t)!,
      textPadding: t < 0.5 ? textPadding : other.textPadding,
      textSelectedStyle:
          TextStyle.lerp(textSelectedStyle, other.textSelectedStyle, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgPickerTheme &&
            const DeepCollectionEquality()
                .equals(backgroundColor, other.backgroundColor) &&
            const DeepCollectionEquality()
                .equals(columnSpacing, other.columnSpacing) &&
            const DeepCollectionEquality()
                .equals(indicatorBorderRadius, other.indicatorBorderRadius) &&
            const DeepCollectionEquality()
                .equals(indicatorColor, other.indicatorColor) &&
            const DeepCollectionEquality().equals(
                indicatorVerticalPadding, other.indicatorVerticalPadding) &&
            const DeepCollectionEquality()
                .equals(minimumColumnWidth, other.minimumColumnWidth) &&
            const DeepCollectionEquality()
                .equals(textDefaultStyle, other.textDefaultStyle) &&
            const DeepCollectionEquality()
                .equals(textPadding, other.textPadding) &&
            const DeepCollectionEquality()
                .equals(textSelectedStyle, other.textSelectedStyle));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(backgroundColor),
      const DeepCollectionEquality().hash(columnSpacing),
      const DeepCollectionEquality().hash(indicatorBorderRadius),
      const DeepCollectionEquality().hash(indicatorColor),
      const DeepCollectionEquality().hash(indicatorVerticalPadding),
      const DeepCollectionEquality().hash(minimumColumnWidth),
      const DeepCollectionEquality().hash(textDefaultStyle),
      const DeepCollectionEquality().hash(textPadding),
      const DeepCollectionEquality().hash(textSelectedStyle),
    );
  }
}
