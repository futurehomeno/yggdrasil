// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'text_link_theme.dart';

// **************************************************************************
// ThemeTailorGenerator
// **************************************************************************

class YgTextLinkTheme extends ThemeExtension<YgTextLinkTheme> {
  const YgTextLinkTheme({
    required this.smallWeakTextStyle,
    required this.mediumWeakTextStyle,
    required this.smallStrongTextStyle,
    required this.mediumStrongTextStyle,
    required this.defaultColor,
    required this.hoverColor,
    required this.focusColor,
    required this.pressedColor,
    required this.disabledColor,
  });

  final TextStyle smallWeakTextStyle;
  final TextStyle mediumWeakTextStyle;
  final TextStyle smallStrongTextStyle;
  final TextStyle mediumStrongTextStyle;
  final Color defaultColor;
  final Color hoverColor;
  final Color focusColor;
  final Color pressedColor;
  final Color disabledColor;

  static final YgTextLinkTheme consumerLight = YgTextLinkTheme(
    smallWeakTextStyle: _$YgTextLinkTheme.smallWeakTextStyle[0],
    mediumWeakTextStyle: _$YgTextLinkTheme.mediumWeakTextStyle[0],
    smallStrongTextStyle: _$YgTextLinkTheme.smallStrongTextStyle[0],
    mediumStrongTextStyle: _$YgTextLinkTheme.mediumStrongTextStyle[0],
    defaultColor: _$YgTextLinkTheme.defaultColor[0],
    hoverColor: _$YgTextLinkTheme.hoverColor[0],
    focusColor: _$YgTextLinkTheme.focusColor[0],
    pressedColor: _$YgTextLinkTheme.pressedColor[0],
    disabledColor: _$YgTextLinkTheme.disabledColor[0],
  );

  static final YgTextLinkTheme consumerDark = YgTextLinkTheme(
    smallWeakTextStyle: _$YgTextLinkTheme.smallWeakTextStyle[1],
    mediumWeakTextStyle: _$YgTextLinkTheme.mediumWeakTextStyle[1],
    smallStrongTextStyle: _$YgTextLinkTheme.smallStrongTextStyle[1],
    mediumStrongTextStyle: _$YgTextLinkTheme.mediumStrongTextStyle[1],
    defaultColor: _$YgTextLinkTheme.defaultColor[1],
    hoverColor: _$YgTextLinkTheme.hoverColor[1],
    focusColor: _$YgTextLinkTheme.focusColor[1],
    pressedColor: _$YgTextLinkTheme.pressedColor[1],
    disabledColor: _$YgTextLinkTheme.disabledColor[1],
  );

  static final YgTextLinkTheme professionalLight = YgTextLinkTheme(
    smallWeakTextStyle: _$YgTextLinkTheme.smallWeakTextStyle[2],
    mediumWeakTextStyle: _$YgTextLinkTheme.mediumWeakTextStyle[2],
    smallStrongTextStyle: _$YgTextLinkTheme.smallStrongTextStyle[2],
    mediumStrongTextStyle: _$YgTextLinkTheme.mediumStrongTextStyle[2],
    defaultColor: _$YgTextLinkTheme.defaultColor[2],
    hoverColor: _$YgTextLinkTheme.hoverColor[2],
    focusColor: _$YgTextLinkTheme.focusColor[2],
    pressedColor: _$YgTextLinkTheme.pressedColor[2],
    disabledColor: _$YgTextLinkTheme.disabledColor[2],
  );

  static final YgTextLinkTheme professionalDark = YgTextLinkTheme(
    smallWeakTextStyle: _$YgTextLinkTheme.smallWeakTextStyle[3],
    mediumWeakTextStyle: _$YgTextLinkTheme.mediumWeakTextStyle[3],
    smallStrongTextStyle: _$YgTextLinkTheme.smallStrongTextStyle[3],
    mediumStrongTextStyle: _$YgTextLinkTheme.mediumStrongTextStyle[3],
    defaultColor: _$YgTextLinkTheme.defaultColor[3],
    hoverColor: _$YgTextLinkTheme.hoverColor[3],
    focusColor: _$YgTextLinkTheme.focusColor[3],
    pressedColor: _$YgTextLinkTheme.pressedColor[3],
    disabledColor: _$YgTextLinkTheme.disabledColor[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgTextLinkTheme copyWith({
    TextStyle? smallWeakTextStyle,
    TextStyle? mediumWeakTextStyle,
    TextStyle? smallStrongTextStyle,
    TextStyle? mediumStrongTextStyle,
    Color? defaultColor,
    Color? hoverColor,
    Color? focusColor,
    Color? pressedColor,
    Color? disabledColor,
  }) {
    return YgTextLinkTheme(
      smallWeakTextStyle: smallWeakTextStyle ?? this.smallWeakTextStyle,
      mediumWeakTextStyle: mediumWeakTextStyle ?? this.mediumWeakTextStyle,
      smallStrongTextStyle: smallStrongTextStyle ?? this.smallStrongTextStyle,
      mediumStrongTextStyle: mediumStrongTextStyle ?? this.mediumStrongTextStyle,
      defaultColor: defaultColor ?? this.defaultColor,
      hoverColor: hoverColor ?? this.hoverColor,
      focusColor: focusColor ?? this.focusColor,
      pressedColor: pressedColor ?? this.pressedColor,
      disabledColor: disabledColor ?? this.disabledColor,
    );
  }

  @override
  YgTextLinkTheme lerp(ThemeExtension<YgTextLinkTheme>? other, double t) {
    if (other is! YgTextLinkTheme) return this;
    return YgTextLinkTheme(
      smallWeakTextStyle: TextStyle.lerp(smallWeakTextStyle, other.smallWeakTextStyle, t)!,
      mediumWeakTextStyle: TextStyle.lerp(mediumWeakTextStyle, other.mediumWeakTextStyle, t)!,
      smallStrongTextStyle: TextStyle.lerp(smallStrongTextStyle, other.smallStrongTextStyle, t)!,
      mediumStrongTextStyle: TextStyle.lerp(mediumStrongTextStyle, other.mediumStrongTextStyle, t)!,
      defaultColor: Color.lerp(defaultColor, other.defaultColor, t)!,
      hoverColor: Color.lerp(hoverColor, other.hoverColor, t)!,
      focusColor: Color.lerp(focusColor, other.focusColor, t)!,
      pressedColor: Color.lerp(pressedColor, other.pressedColor, t)!,
      disabledColor: Color.lerp(disabledColor, other.disabledColor, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgTextLinkTheme &&
            const DeepCollectionEquality().equals(smallWeakTextStyle, other.smallWeakTextStyle) &&
            const DeepCollectionEquality().equals(mediumWeakTextStyle, other.mediumWeakTextStyle) &&
            const DeepCollectionEquality().equals(smallStrongTextStyle, other.smallStrongTextStyle) &&
            const DeepCollectionEquality().equals(mediumStrongTextStyle, other.mediumStrongTextStyle) &&
            const DeepCollectionEquality().equals(defaultColor, other.defaultColor) &&
            const DeepCollectionEquality().equals(hoverColor, other.hoverColor) &&
            const DeepCollectionEquality().equals(focusColor, other.focusColor) &&
            const DeepCollectionEquality().equals(pressedColor, other.pressedColor) &&
            const DeepCollectionEquality().equals(disabledColor, other.disabledColor));
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        const DeepCollectionEquality().hash(smallWeakTextStyle),
        const DeepCollectionEquality().hash(mediumWeakTextStyle),
        const DeepCollectionEquality().hash(smallStrongTextStyle),
        const DeepCollectionEquality().hash(mediumStrongTextStyle),
        const DeepCollectionEquality().hash(defaultColor),
        const DeepCollectionEquality().hash(hoverColor),
        const DeepCollectionEquality().hash(focusColor),
        const DeepCollectionEquality().hash(pressedColor),
        const DeepCollectionEquality().hash(disabledColor));
  }
}
