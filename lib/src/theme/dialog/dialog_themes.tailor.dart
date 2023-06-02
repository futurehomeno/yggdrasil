// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'dialog_themes.dart';

// **************************************************************************
// ThemeTailorGenerator
// **************************************************************************

class YgDialogThemes extends ThemeExtension<YgDialogThemes> {
  const YgDialogThemes({
    required this.backgroundColor,
    required this.iconContainerColor,
    required this.outerPadding,
    required this.iconPadding,
    required this.textSectionPadding,
    required this.titleDescriptionSpacing,
    required this.outerBorderRadius,
    required this.buttonSpacing,
  });

  final Color backgroundColor;
  final Color iconContainerColor;
  final EdgeInsets outerPadding;
  final EdgeInsets iconPadding;
  final EdgeInsets textSectionPadding;
  final double titleDescriptionSpacing;
  final BorderRadius outerBorderRadius;
  final double buttonSpacing;

  static final YgDialogThemes consumerLight = YgDialogThemes(
    backgroundColor: _$YgDialogThemes.backgroundColor[0],
    iconContainerColor: _$YgDialogThemes.iconContainerColor[0],
    outerPadding: _$YgDialogThemes.outerPadding[0],
    iconPadding: _$YgDialogThemes.iconPadding[0],
    textSectionPadding: _$YgDialogThemes.textSectionPadding[0],
    titleDescriptionSpacing: _$YgDialogThemes.titleDescriptionSpacing[0],
    outerBorderRadius: _$YgDialogThemes.outerBorderRadius[0],
    buttonSpacing: _$YgDialogThemes.buttonSpacing[0],
  );

  static final YgDialogThemes consumerDark = YgDialogThemes(
    backgroundColor: _$YgDialogThemes.backgroundColor[1],
    iconContainerColor: _$YgDialogThemes.iconContainerColor[1],
    outerPadding: _$YgDialogThemes.outerPadding[1],
    iconPadding: _$YgDialogThemes.iconPadding[1],
    textSectionPadding: _$YgDialogThemes.textSectionPadding[1],
    titleDescriptionSpacing: _$YgDialogThemes.titleDescriptionSpacing[1],
    outerBorderRadius: _$YgDialogThemes.outerBorderRadius[1],
    buttonSpacing: _$YgDialogThemes.buttonSpacing[1],
  );

  static final YgDialogThemes professionalLight = YgDialogThemes(
    backgroundColor: _$YgDialogThemes.backgroundColor[2],
    iconContainerColor: _$YgDialogThemes.iconContainerColor[2],
    outerPadding: _$YgDialogThemes.outerPadding[2],
    iconPadding: _$YgDialogThemes.iconPadding[2],
    textSectionPadding: _$YgDialogThemes.textSectionPadding[2],
    titleDescriptionSpacing: _$YgDialogThemes.titleDescriptionSpacing[2],
    outerBorderRadius: _$YgDialogThemes.outerBorderRadius[2],
    buttonSpacing: _$YgDialogThemes.buttonSpacing[2],
  );

  static final YgDialogThemes professionalDark = YgDialogThemes(
    backgroundColor: _$YgDialogThemes.backgroundColor[3],
    iconContainerColor: _$YgDialogThemes.iconContainerColor[3],
    outerPadding: _$YgDialogThemes.outerPadding[3],
    iconPadding: _$YgDialogThemes.iconPadding[3],
    textSectionPadding: _$YgDialogThemes.textSectionPadding[3],
    titleDescriptionSpacing: _$YgDialogThemes.titleDescriptionSpacing[3],
    outerBorderRadius: _$YgDialogThemes.outerBorderRadius[3],
    buttonSpacing: _$YgDialogThemes.buttonSpacing[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgDialogThemes copyWith({
    Color? backgroundColor,
    Color? iconContainerColor,
    EdgeInsets? outerPadding,
    EdgeInsets? iconPadding,
    EdgeInsets? textSectionPadding,
    double? titleDescriptionSpacing,
    BorderRadius? outerBorderRadius,
    double? buttonSpacing,
  }) {
    return YgDialogThemes(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      iconContainerColor: iconContainerColor ?? this.iconContainerColor,
      outerPadding: outerPadding ?? this.outerPadding,
      iconPadding: iconPadding ?? this.iconPadding,
      textSectionPadding: textSectionPadding ?? this.textSectionPadding,
      titleDescriptionSpacing:
          titleDescriptionSpacing ?? this.titleDescriptionSpacing,
      outerBorderRadius: outerBorderRadius ?? this.outerBorderRadius,
      buttonSpacing: buttonSpacing ?? this.buttonSpacing,
    );
  }

  @override
  YgDialogThemes lerp(ThemeExtension<YgDialogThemes>? other, double t) {
    if (other is! YgDialogThemes) return this;
    return YgDialogThemes(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      iconContainerColor:
          Color.lerp(iconContainerColor, other.iconContainerColor, t)!,
      outerPadding: t < 0.5 ? outerPadding : other.outerPadding,
      iconPadding: t < 0.5 ? iconPadding : other.iconPadding,
      textSectionPadding:
          t < 0.5 ? textSectionPadding : other.textSectionPadding,
      titleDescriptionSpacing:
          t < 0.5 ? titleDescriptionSpacing : other.titleDescriptionSpacing,
      outerBorderRadius: t < 0.5 ? outerBorderRadius : other.outerBorderRadius,
      buttonSpacing: t < 0.5 ? buttonSpacing : other.buttonSpacing,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgDialogThemes &&
            const DeepCollectionEquality()
                .equals(backgroundColor, other.backgroundColor) &&
            const DeepCollectionEquality()
                .equals(iconContainerColor, other.iconContainerColor) &&
            const DeepCollectionEquality()
                .equals(outerPadding, other.outerPadding) &&
            const DeepCollectionEquality()
                .equals(iconPadding, other.iconPadding) &&
            const DeepCollectionEquality()
                .equals(textSectionPadding, other.textSectionPadding) &&
            const DeepCollectionEquality().equals(
                titleDescriptionSpacing, other.titleDescriptionSpacing) &&
            const DeepCollectionEquality()
                .equals(outerBorderRadius, other.outerBorderRadius) &&
            const DeepCollectionEquality()
                .equals(buttonSpacing, other.buttonSpacing));
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        const DeepCollectionEquality().hash(backgroundColor),
        const DeepCollectionEquality().hash(iconContainerColor),
        const DeepCollectionEquality().hash(outerPadding),
        const DeepCollectionEquality().hash(iconPadding),
        const DeepCollectionEquality().hash(textSectionPadding),
        const DeepCollectionEquality().hash(titleDescriptionSpacing),
        const DeepCollectionEquality().hash(outerBorderRadius),
        const DeepCollectionEquality().hash(buttonSpacing));
  }
}
