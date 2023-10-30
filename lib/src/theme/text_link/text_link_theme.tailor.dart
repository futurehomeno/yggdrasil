// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'text_link_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgTextLinkTheme extends ThemeExtension<YgTextLinkTheme> {
  const YgTextLinkTheme({
    required this.defaultColor,
    required this.disabledColor,
    required this.focusColor,
    required this.hoverColor,
    required this.iconColor,
    required this.iconPadding,
    required this.mediumStrongTextStyle,
    required this.mediumWeakTextStyle,
    required this.padding,
    required this.pressedColor,
    required this.smallStrongTextStyle,
    required this.smallWeakTextStyle,
  });

  final Color defaultColor;
  final Color disabledColor;
  final Color focusColor;
  final Color hoverColor;
  final Color iconColor;
  final EdgeInsets iconPadding;
  final TextStyle mediumStrongTextStyle;
  final TextStyle mediumWeakTextStyle;
  final EdgeInsets padding;
  final Color pressedColor;
  final TextStyle smallStrongTextStyle;
  final TextStyle smallWeakTextStyle;

  static final YgTextLinkTheme consumerLight = YgTextLinkTheme(
    defaultColor: _$YgTextLinkTheme.defaultColor[0],
    disabledColor: _$YgTextLinkTheme.disabledColor[0],
    focusColor: _$YgTextLinkTheme.focusColor[0],
    hoverColor: _$YgTextLinkTheme.hoverColor[0],
    iconColor: _$YgTextLinkTheme.iconColor[0],
    iconPadding: _$YgTextLinkTheme.iconPadding[0],
    mediumStrongTextStyle: _$YgTextLinkTheme.mediumStrongTextStyle[0],
    mediumWeakTextStyle: _$YgTextLinkTheme.mediumWeakTextStyle[0],
    padding: _$YgTextLinkTheme.padding[0],
    pressedColor: _$YgTextLinkTheme.pressedColor[0],
    smallStrongTextStyle: _$YgTextLinkTheme.smallStrongTextStyle[0],
    smallWeakTextStyle: _$YgTextLinkTheme.smallWeakTextStyle[0],
  );

  static final YgTextLinkTheme consumerDark = YgTextLinkTheme(
    defaultColor: _$YgTextLinkTheme.defaultColor[1],
    disabledColor: _$YgTextLinkTheme.disabledColor[1],
    focusColor: _$YgTextLinkTheme.focusColor[1],
    hoverColor: _$YgTextLinkTheme.hoverColor[1],
    iconColor: _$YgTextLinkTheme.iconColor[1],
    iconPadding: _$YgTextLinkTheme.iconPadding[1],
    mediumStrongTextStyle: _$YgTextLinkTheme.mediumStrongTextStyle[1],
    mediumWeakTextStyle: _$YgTextLinkTheme.mediumWeakTextStyle[1],
    padding: _$YgTextLinkTheme.padding[1],
    pressedColor: _$YgTextLinkTheme.pressedColor[1],
    smallStrongTextStyle: _$YgTextLinkTheme.smallStrongTextStyle[1],
    smallWeakTextStyle: _$YgTextLinkTheme.smallWeakTextStyle[1],
  );

  static final YgTextLinkTheme professionalLight = YgTextLinkTheme(
    defaultColor: _$YgTextLinkTheme.defaultColor[2],
    disabledColor: _$YgTextLinkTheme.disabledColor[2],
    focusColor: _$YgTextLinkTheme.focusColor[2],
    hoverColor: _$YgTextLinkTheme.hoverColor[2],
    iconColor: _$YgTextLinkTheme.iconColor[2],
    iconPadding: _$YgTextLinkTheme.iconPadding[2],
    mediumStrongTextStyle: _$YgTextLinkTheme.mediumStrongTextStyle[2],
    mediumWeakTextStyle: _$YgTextLinkTheme.mediumWeakTextStyle[2],
    padding: _$YgTextLinkTheme.padding[2],
    pressedColor: _$YgTextLinkTheme.pressedColor[2],
    smallStrongTextStyle: _$YgTextLinkTheme.smallStrongTextStyle[2],
    smallWeakTextStyle: _$YgTextLinkTheme.smallWeakTextStyle[2],
  );

  static final YgTextLinkTheme professionalDark = YgTextLinkTheme(
    defaultColor: _$YgTextLinkTheme.defaultColor[3],
    disabledColor: _$YgTextLinkTheme.disabledColor[3],
    focusColor: _$YgTextLinkTheme.focusColor[3],
    hoverColor: _$YgTextLinkTheme.hoverColor[3],
    iconColor: _$YgTextLinkTheme.iconColor[3],
    iconPadding: _$YgTextLinkTheme.iconPadding[3],
    mediumStrongTextStyle: _$YgTextLinkTheme.mediumStrongTextStyle[3],
    mediumWeakTextStyle: _$YgTextLinkTheme.mediumWeakTextStyle[3],
    padding: _$YgTextLinkTheme.padding[3],
    pressedColor: _$YgTextLinkTheme.pressedColor[3],
    smallStrongTextStyle: _$YgTextLinkTheme.smallStrongTextStyle[3],
    smallWeakTextStyle: _$YgTextLinkTheme.smallWeakTextStyle[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgTextLinkTheme copyWith({
    Color? defaultColor,
    Color? disabledColor,
    Color? focusColor,
    Color? hoverColor,
    Color? iconColor,
    EdgeInsets? iconPadding,
    TextStyle? mediumStrongTextStyle,
    TextStyle? mediumWeakTextStyle,
    EdgeInsets? padding,
    Color? pressedColor,
    TextStyle? smallStrongTextStyle,
    TextStyle? smallWeakTextStyle,
  }) {
    return YgTextLinkTheme(
      defaultColor: defaultColor ?? this.defaultColor,
      disabledColor: disabledColor ?? this.disabledColor,
      focusColor: focusColor ?? this.focusColor,
      hoverColor: hoverColor ?? this.hoverColor,
      iconColor: iconColor ?? this.iconColor,
      iconPadding: iconPadding ?? this.iconPadding,
      mediumStrongTextStyle:
          mediumStrongTextStyle ?? this.mediumStrongTextStyle,
      mediumWeakTextStyle: mediumWeakTextStyle ?? this.mediumWeakTextStyle,
      padding: padding ?? this.padding,
      pressedColor: pressedColor ?? this.pressedColor,
      smallStrongTextStyle: smallStrongTextStyle ?? this.smallStrongTextStyle,
      smallWeakTextStyle: smallWeakTextStyle ?? this.smallWeakTextStyle,
    );
  }

  @override
  YgTextLinkTheme lerp(
      covariant ThemeExtension<YgTextLinkTheme>? other, double t) {
    if (other is! YgTextLinkTheme) return this as YgTextLinkTheme;
    return YgTextLinkTheme(
      defaultColor: Color.lerp(defaultColor, other.defaultColor, t)!,
      disabledColor: Color.lerp(disabledColor, other.disabledColor, t)!,
      focusColor: Color.lerp(focusColor, other.focusColor, t)!,
      hoverColor: Color.lerp(hoverColor, other.hoverColor, t)!,
      iconColor: Color.lerp(iconColor, other.iconColor, t)!,
      iconPadding: t < 0.5 ? iconPadding : other.iconPadding,
      mediumStrongTextStyle: TextStyle.lerp(
          mediumStrongTextStyle, other.mediumStrongTextStyle, t)!,
      mediumWeakTextStyle:
          TextStyle.lerp(mediumWeakTextStyle, other.mediumWeakTextStyle, t)!,
      padding: t < 0.5 ? padding : other.padding,
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
            other is YgTextLinkTheme &&
            const DeepCollectionEquality()
                .equals(defaultColor, other.defaultColor) &&
            const DeepCollectionEquality()
                .equals(disabledColor, other.disabledColor) &&
            const DeepCollectionEquality()
                .equals(focusColor, other.focusColor) &&
            const DeepCollectionEquality()
                .equals(hoverColor, other.hoverColor) &&
            const DeepCollectionEquality().equals(iconColor, other.iconColor) &&
            const DeepCollectionEquality()
                .equals(iconPadding, other.iconPadding) &&
            const DeepCollectionEquality()
                .equals(mediumStrongTextStyle, other.mediumStrongTextStyle) &&
            const DeepCollectionEquality()
                .equals(mediumWeakTextStyle, other.mediumWeakTextStyle) &&
            const DeepCollectionEquality().equals(padding, other.padding) &&
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
      const DeepCollectionEquality().hash(iconColor),
      const DeepCollectionEquality().hash(iconPadding),
      const DeepCollectionEquality().hash(mediumStrongTextStyle),
      const DeepCollectionEquality().hash(mediumWeakTextStyle),
      const DeepCollectionEquality().hash(padding),
      const DeepCollectionEquality().hash(pressedColor),
      const DeepCollectionEquality().hash(smallStrongTextStyle),
      const DeepCollectionEquality().hash(smallWeakTextStyle),
    );
  }
}
