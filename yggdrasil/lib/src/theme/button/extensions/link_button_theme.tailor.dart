// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'link_button_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgLinkButtonTheme extends ThemeExtension<YgLinkButtonTheme> {
  const YgLinkButtonTheme({
    required this.backgroundColor,
    required this.borderGradient,
    required this.disabledBorderGradient,
    required this.disabledTextStyle,
    required this.iconDefaultColor,
    required this.iconDisabledColor,
    required this.textStyle,
  });

  final Color backgroundColor;
  final LinearGradient borderGradient;
  final LinearGradient disabledBorderGradient;
  final TextStyle disabledTextStyle;
  final Color iconDefaultColor;
  final Color iconDisabledColor;
  final TextStyle textStyle;

  static final YgLinkButtonTheme consumerLight = YgLinkButtonTheme(
    backgroundColor: _$YgLinkButtonTheme.backgroundColor[0],
    borderGradient: _$YgLinkButtonTheme.borderGradient[0],
    disabledBorderGradient: _$YgLinkButtonTheme.disabledBorderGradient[0],
    disabledTextStyle: _$YgLinkButtonTheme.disabledTextStyle[0],
    iconDefaultColor: _$YgLinkButtonTheme.iconDefaultColor[0],
    iconDisabledColor: _$YgLinkButtonTheme.iconDisabledColor[0],
    textStyle: _$YgLinkButtonTheme.textStyle[0],
  );

  static final YgLinkButtonTheme consumerDark = YgLinkButtonTheme(
    backgroundColor: _$YgLinkButtonTheme.backgroundColor[1],
    borderGradient: _$YgLinkButtonTheme.borderGradient[1],
    disabledBorderGradient: _$YgLinkButtonTheme.disabledBorderGradient[1],
    disabledTextStyle: _$YgLinkButtonTheme.disabledTextStyle[1],
    iconDefaultColor: _$YgLinkButtonTheme.iconDefaultColor[1],
    iconDisabledColor: _$YgLinkButtonTheme.iconDisabledColor[1],
    textStyle: _$YgLinkButtonTheme.textStyle[1],
  );

  static final YgLinkButtonTheme professionalLight = YgLinkButtonTheme(
    backgroundColor: _$YgLinkButtonTheme.backgroundColor[2],
    borderGradient: _$YgLinkButtonTheme.borderGradient[2],
    disabledBorderGradient: _$YgLinkButtonTheme.disabledBorderGradient[2],
    disabledTextStyle: _$YgLinkButtonTheme.disabledTextStyle[2],
    iconDefaultColor: _$YgLinkButtonTheme.iconDefaultColor[2],
    iconDisabledColor: _$YgLinkButtonTheme.iconDisabledColor[2],
    textStyle: _$YgLinkButtonTheme.textStyle[2],
  );

  static final YgLinkButtonTheme professionalDark = YgLinkButtonTheme(
    backgroundColor: _$YgLinkButtonTheme.backgroundColor[3],
    borderGradient: _$YgLinkButtonTheme.borderGradient[3],
    disabledBorderGradient: _$YgLinkButtonTheme.disabledBorderGradient[3],
    disabledTextStyle: _$YgLinkButtonTheme.disabledTextStyle[3],
    iconDefaultColor: _$YgLinkButtonTheme.iconDefaultColor[3],
    iconDisabledColor: _$YgLinkButtonTheme.iconDisabledColor[3],
    textStyle: _$YgLinkButtonTheme.textStyle[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgLinkButtonTheme copyWith({
    Color? backgroundColor,
    LinearGradient? borderGradient,
    LinearGradient? disabledBorderGradient,
    TextStyle? disabledTextStyle,
    Color? iconDefaultColor,
    Color? iconDisabledColor,
    TextStyle? textStyle,
  }) {
    return YgLinkButtonTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      borderGradient: borderGradient ?? this.borderGradient,
      disabledBorderGradient: disabledBorderGradient ?? this.disabledBorderGradient,
      disabledTextStyle: disabledTextStyle ?? this.disabledTextStyle,
      iconDefaultColor: iconDefaultColor ?? this.iconDefaultColor,
      iconDisabledColor: iconDisabledColor ?? this.iconDisabledColor,
      textStyle: textStyle ?? this.textStyle,
    );
  }

  @override
  YgLinkButtonTheme lerp(covariant ThemeExtension<YgLinkButtonTheme>? other, double t) {
    if (other is! YgLinkButtonTheme) return this as YgLinkButtonTheme;
    return YgLinkButtonTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      borderGradient: t < 0.5 ? borderGradient : other.borderGradient,
      disabledBorderGradient: t < 0.5 ? disabledBorderGradient : other.disabledBorderGradient,
      disabledTextStyle: TextStyle.lerp(disabledTextStyle, other.disabledTextStyle, t)!,
      iconDefaultColor: Color.lerp(iconDefaultColor, other.iconDefaultColor, t)!,
      iconDisabledColor: Color.lerp(iconDisabledColor, other.iconDisabledColor, t)!,
      textStyle: TextStyle.lerp(textStyle, other.textStyle, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgLinkButtonTheme &&
            const DeepCollectionEquality().equals(backgroundColor, other.backgroundColor) &&
            const DeepCollectionEquality().equals(borderGradient, other.borderGradient) &&
            const DeepCollectionEquality().equals(disabledBorderGradient, other.disabledBorderGradient) &&
            const DeepCollectionEquality().equals(disabledTextStyle, other.disabledTextStyle) &&
            const DeepCollectionEquality().equals(iconDefaultColor, other.iconDefaultColor) &&
            const DeepCollectionEquality().equals(iconDisabledColor, other.iconDisabledColor) &&
            const DeepCollectionEquality().equals(textStyle, other.textStyle));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(backgroundColor),
      const DeepCollectionEquality().hash(borderGradient),
      const DeepCollectionEquality().hash(disabledBorderGradient),
      const DeepCollectionEquality().hash(disabledTextStyle),
      const DeepCollectionEquality().hash(iconDefaultColor),
      const DeepCollectionEquality().hash(iconDisabledColor),
      const DeepCollectionEquality().hash(textStyle),
    );
  }
}
