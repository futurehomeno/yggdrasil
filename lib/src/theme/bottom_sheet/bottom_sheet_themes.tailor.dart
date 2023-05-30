// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'bottom_sheet_themes.dart';

// **************************************************************************
// ThemeTailorGenerator
// **************************************************************************

class YgBottomSheetThemes extends ThemeExtension<YgBottomSheetThemes> {
  const YgBottomSheetThemes({
    required this.handleBarColor,
    required this.backgroundColor,
    required this.scrimColor,
    required this.borderRadius,
    required this.outerPadding,
    required this.footerPadding,
    required this.titlePadding,
    required this.titleStyle,
  });

  final Color handleBarColor;
  final Color backgroundColor;
  final Color scrimColor;
  final BorderRadius borderRadius;
  final EdgeInsets outerPadding;
  final EdgeInsets footerPadding;
  final EdgeInsets titlePadding;
  final TextStyle titleStyle;

  static final YgBottomSheetThemes consumerLight = YgBottomSheetThemes(
    handleBarColor: _$YgBottomSheetThemes.handleBarColor[0],
    backgroundColor: _$YgBottomSheetThemes.backgroundColor[0],
    scrimColor: _$YgBottomSheetThemes.scrimColor[0],
    borderRadius: _$YgBottomSheetThemes.borderRadius[0],
    outerPadding: _$YgBottomSheetThemes.outerPadding[0],
    footerPadding: _$YgBottomSheetThemes.footerPadding[0],
    titlePadding: _$YgBottomSheetThemes.titlePadding[0],
    titleStyle: _$YgBottomSheetThemes.titleStyle[0],
  );

  static final YgBottomSheetThemes consumerDark = YgBottomSheetThemes(
    handleBarColor: _$YgBottomSheetThemes.handleBarColor[1],
    backgroundColor: _$YgBottomSheetThemes.backgroundColor[1],
    scrimColor: _$YgBottomSheetThemes.scrimColor[1],
    borderRadius: _$YgBottomSheetThemes.borderRadius[1],
    outerPadding: _$YgBottomSheetThemes.outerPadding[1],
    footerPadding: _$YgBottomSheetThemes.footerPadding[1],
    titlePadding: _$YgBottomSheetThemes.titlePadding[1],
    titleStyle: _$YgBottomSheetThemes.titleStyle[1],
  );

  static final YgBottomSheetThemes professionalLight = YgBottomSheetThemes(
    handleBarColor: _$YgBottomSheetThemes.handleBarColor[2],
    backgroundColor: _$YgBottomSheetThemes.backgroundColor[2],
    scrimColor: _$YgBottomSheetThemes.scrimColor[2],
    borderRadius: _$YgBottomSheetThemes.borderRadius[2],
    outerPadding: _$YgBottomSheetThemes.outerPadding[2],
    footerPadding: _$YgBottomSheetThemes.footerPadding[2],
    titlePadding: _$YgBottomSheetThemes.titlePadding[2],
    titleStyle: _$YgBottomSheetThemes.titleStyle[2],
  );

  static final YgBottomSheetThemes professionalDark = YgBottomSheetThemes(
    handleBarColor: _$YgBottomSheetThemes.handleBarColor[3],
    backgroundColor: _$YgBottomSheetThemes.backgroundColor[3],
    scrimColor: _$YgBottomSheetThemes.scrimColor[3],
    borderRadius: _$YgBottomSheetThemes.borderRadius[3],
    outerPadding: _$YgBottomSheetThemes.outerPadding[3],
    footerPadding: _$YgBottomSheetThemes.footerPadding[3],
    titlePadding: _$YgBottomSheetThemes.titlePadding[3],
    titleStyle: _$YgBottomSheetThemes.titleStyle[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgBottomSheetThemes copyWith({
    Color? handleBarColor,
    Color? backgroundColor,
    Color? scrimColor,
    BorderRadius? borderRadius,
    EdgeInsets? outerPadding,
    EdgeInsets? footerPadding,
    EdgeInsets? titlePadding,
    TextStyle? titleStyle,
  }) {
    return YgBottomSheetThemes(
      handleBarColor: handleBarColor ?? this.handleBarColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      scrimColor: scrimColor ?? this.scrimColor,
      borderRadius: borderRadius ?? this.borderRadius,
      outerPadding: outerPadding ?? this.outerPadding,
      footerPadding: footerPadding ?? this.footerPadding,
      titlePadding: titlePadding ?? this.titlePadding,
      titleStyle: titleStyle ?? this.titleStyle,
    );
  }

  @override
  YgBottomSheetThemes lerp(
      ThemeExtension<YgBottomSheetThemes>? other, double t) {
    if (other is! YgBottomSheetThemes) return this;
    return YgBottomSheetThemes(
      handleBarColor: Color.lerp(handleBarColor, other.handleBarColor, t)!,
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      scrimColor: Color.lerp(scrimColor, other.scrimColor, t)!,
      borderRadius: t < 0.5 ? borderRadius : other.borderRadius,
      outerPadding: t < 0.5 ? outerPadding : other.outerPadding,
      footerPadding: t < 0.5 ? footerPadding : other.footerPadding,
      titlePadding: t < 0.5 ? titlePadding : other.titlePadding,
      titleStyle: TextStyle.lerp(titleStyle, other.titleStyle, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgBottomSheetThemes &&
            const DeepCollectionEquality()
                .equals(handleBarColor, other.handleBarColor) &&
            const DeepCollectionEquality()
                .equals(backgroundColor, other.backgroundColor) &&
            const DeepCollectionEquality()
                .equals(scrimColor, other.scrimColor) &&
            const DeepCollectionEquality()
                .equals(borderRadius, other.borderRadius) &&
            const DeepCollectionEquality()
                .equals(outerPadding, other.outerPadding) &&
            const DeepCollectionEquality()
                .equals(footerPadding, other.footerPadding) &&
            const DeepCollectionEquality()
                .equals(titlePadding, other.titlePadding) &&
            const DeepCollectionEquality()
                .equals(titleStyle, other.titleStyle));
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        const DeepCollectionEquality().hash(handleBarColor),
        const DeepCollectionEquality().hash(backgroundColor),
        const DeepCollectionEquality().hash(scrimColor),
        const DeepCollectionEquality().hash(borderRadius),
        const DeepCollectionEquality().hash(outerPadding),
        const DeepCollectionEquality().hash(footerPadding),
        const DeepCollectionEquality().hash(titlePadding),
        const DeepCollectionEquality().hash(titleStyle));
  }
}
