// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'text_link_themes.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgTextLinkThemes extends ThemeExtension<YgTextLinkThemes> {
  const YgTextLinkThemes({
    required this.defaultColor,
    required this.disabledColor,
    required this.focusColor,
    required this.hoverColor,
    required this.iconPadding,
    required this.iconSize,
    required this.mediumStrongTextStyle,
    required this.mediumWeakTextStyle,
    required this.pressedColor,
    required this.smallStrongTextStyle,
    required this.smallWeakTextStyle,
  });

  final Color defaultColor;
  final Color disabledColor;
  final Color focusColor;
  final Color hoverColor;
  final EdgeInsets iconPadding;
  final double iconSize;
  final TextStyle mediumStrongTextStyle;
  final TextStyle mediumWeakTextStyle;
  final Color pressedColor;
  final TextStyle smallStrongTextStyle;
  final TextStyle smallWeakTextStyle;

  static final YgTextLinkThemes consumerLight = YgTextLinkThemes(
    defaultColor: _$YgTextLinkThemes.defaultColor[0],
    disabledColor: _$YgTextLinkThemes.disabledColor[0],
    focusColor: _$YgTextLinkThemes.focusColor[0],
    hoverColor: _$YgTextLinkThemes.hoverColor[0],
    iconPadding: _$YgTextLinkThemes.iconPadding[0],
    iconSize: _$YgTextLinkThemes.iconSize[0],
    mediumStrongTextStyle: _$YgTextLinkThemes.mediumStrongTextStyle[0],
    mediumWeakTextStyle: _$YgTextLinkThemes.mediumWeakTextStyle[0],
    pressedColor: _$YgTextLinkThemes.pressedColor[0],
    smallStrongTextStyle: _$YgTextLinkThemes.smallStrongTextStyle[0],
    smallWeakTextStyle: _$YgTextLinkThemes.smallWeakTextStyle[0],
  );

  static final YgTextLinkThemes consumerDark = YgTextLinkThemes(
    defaultColor: _$YgTextLinkThemes.defaultColor[1],
    disabledColor: _$YgTextLinkThemes.disabledColor[1],
    focusColor: _$YgTextLinkThemes.focusColor[1],
    hoverColor: _$YgTextLinkThemes.hoverColor[1],
    iconPadding: _$YgTextLinkThemes.iconPadding[1],
    iconSize: _$YgTextLinkThemes.iconSize[1],
    mediumStrongTextStyle: _$YgTextLinkThemes.mediumStrongTextStyle[1],
    mediumWeakTextStyle: _$YgTextLinkThemes.mediumWeakTextStyle[1],
    pressedColor: _$YgTextLinkThemes.pressedColor[1],
    smallStrongTextStyle: _$YgTextLinkThemes.smallStrongTextStyle[1],
    smallWeakTextStyle: _$YgTextLinkThemes.smallWeakTextStyle[1],
  );

  static final YgTextLinkThemes professionalLight = YgTextLinkThemes(
    defaultColor: _$YgTextLinkThemes.defaultColor[2],
    disabledColor: _$YgTextLinkThemes.disabledColor[2],
    focusColor: _$YgTextLinkThemes.focusColor[2],
    hoverColor: _$YgTextLinkThemes.hoverColor[2],
    iconPadding: _$YgTextLinkThemes.iconPadding[2],
    iconSize: _$YgTextLinkThemes.iconSize[2],
    mediumStrongTextStyle: _$YgTextLinkThemes.mediumStrongTextStyle[2],
    mediumWeakTextStyle: _$YgTextLinkThemes.mediumWeakTextStyle[2],
    pressedColor: _$YgTextLinkThemes.pressedColor[2],
    smallStrongTextStyle: _$YgTextLinkThemes.smallStrongTextStyle[2],
    smallWeakTextStyle: _$YgTextLinkThemes.smallWeakTextStyle[2],
  );

  static final YgTextLinkThemes professionalDark = YgTextLinkThemes(
    defaultColor: _$YgTextLinkThemes.defaultColor[3],
    disabledColor: _$YgTextLinkThemes.disabledColor[3],
    focusColor: _$YgTextLinkThemes.focusColor[3],
    hoverColor: _$YgTextLinkThemes.hoverColor[3],
    iconPadding: _$YgTextLinkThemes.iconPadding[3],
    iconSize: _$YgTextLinkThemes.iconSize[3],
    mediumStrongTextStyle: _$YgTextLinkThemes.mediumStrongTextStyle[3],
    mediumWeakTextStyle: _$YgTextLinkThemes.mediumWeakTextStyle[3],
    pressedColor: _$YgTextLinkThemes.pressedColor[3],
    smallStrongTextStyle: _$YgTextLinkThemes.smallStrongTextStyle[3],
    smallWeakTextStyle: _$YgTextLinkThemes.smallWeakTextStyle[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgTextLinkThemes copyWith({
    Color? defaultColor,
    Color? disabledColor,
    Color? focusColor,
    Color? hoverColor,
    EdgeInsets? iconPadding,
    double? iconSize,
    TextStyle? mediumStrongTextStyle,
    TextStyle? mediumWeakTextStyle,
    Color? pressedColor,
    TextStyle? smallStrongTextStyle,
    TextStyle? smallWeakTextStyle,
  }) {
    return YgTextLinkThemes(
      defaultColor: defaultColor ?? this.defaultColor,
      disabledColor: disabledColor ?? this.disabledColor,
      focusColor: focusColor ?? this.focusColor,
      hoverColor: hoverColor ?? this.hoverColor,
      iconPadding: iconPadding ?? this.iconPadding,
      iconSize: iconSize ?? this.iconSize,
      mediumStrongTextStyle:
          mediumStrongTextStyle ?? this.mediumStrongTextStyle,
      mediumWeakTextStyle: mediumWeakTextStyle ?? this.mediumWeakTextStyle,
      pressedColor: pressedColor ?? this.pressedColor,
      smallStrongTextStyle: smallStrongTextStyle ?? this.smallStrongTextStyle,
      smallWeakTextStyle: smallWeakTextStyle ?? this.smallWeakTextStyle,
    );
  }

  @override
  YgTextLinkThemes lerp(
      covariant ThemeExtension<YgTextLinkThemes>? other, double t) {
    if (other is! YgTextLinkThemes) return this as YgTextLinkThemes;
    return YgTextLinkThemes(
      defaultColor: Color.lerp(defaultColor, other.defaultColor, t)!,
      disabledColor: Color.lerp(disabledColor, other.disabledColor, t)!,
      focusColor: Color.lerp(focusColor, other.focusColor, t)!,
      hoverColor: Color.lerp(hoverColor, other.hoverColor, t)!,
      iconPadding: t < 0.5 ? iconPadding : other.iconPadding,
      iconSize: t < 0.5 ? iconSize : other.iconSize,
      mediumStrongTextStyle: TextStyle.lerp(
          mediumStrongTextStyle, other.mediumStrongTextStyle, t)!,
      mediumWeakTextStyle:
          TextStyle.lerp(mediumWeakTextStyle, other.mediumWeakTextStyle, t)!,
      pressedColor: Color.lerp(pressedColor, other.pressedColor, t)!,
      smallStrongTextStyle:
          TextStyle.lerp(smallStrongTextStyle, other.smallStrongTextStyle, t)!,
      smallWeakTextStyle:
          TextStyle.lerp(smallWeakTextStyle, other.smallWeakTextStyle, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgTextLinkThemes &&
            const DeepCollectionEquality()
                .equals(defaultColor, other.defaultColor) &&
            const DeepCollectionEquality()
                .equals(disabledColor, other.disabledColor) &&
            const DeepCollectionEquality()
                .equals(focusColor, other.focusColor) &&
            const DeepCollectionEquality()
                .equals(hoverColor, other.hoverColor) &&
            const DeepCollectionEquality()
                .equals(iconPadding, other.iconPadding) &&
            const DeepCollectionEquality().equals(iconSize, other.iconSize) &&
            const DeepCollectionEquality()
                .equals(mediumStrongTextStyle, other.mediumStrongTextStyle) &&
            const DeepCollectionEquality()
                .equals(mediumWeakTextStyle, other.mediumWeakTextStyle) &&
            const DeepCollectionEquality()
                .equals(pressedColor, other.pressedColor) &&
            const DeepCollectionEquality()
                .equals(smallStrongTextStyle, other.smallStrongTextStyle) &&
            const DeepCollectionEquality()
                .equals(smallWeakTextStyle, other.smallWeakTextStyle));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(defaultColor),
      const DeepCollectionEquality().hash(disabledColor),
      const DeepCollectionEquality().hash(focusColor),
      const DeepCollectionEquality().hash(hoverColor),
      const DeepCollectionEquality().hash(iconPadding),
      const DeepCollectionEquality().hash(iconSize),
      const DeepCollectionEquality().hash(mediumStrongTextStyle),
      const DeepCollectionEquality().hash(mediumWeakTextStyle),
      const DeepCollectionEquality().hash(pressedColor),
      const DeepCollectionEquality().hash(smallStrongTextStyle),
      const DeepCollectionEquality().hash(smallWeakTextStyle),
    );
  }
}
