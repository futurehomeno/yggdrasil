// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'secondary_button_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgSecondaryButtonTheme extends ThemeExtension<YgSecondaryButtonTheme> {
  const YgSecondaryButtonTheme({
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

  static final YgSecondaryButtonTheme consumerLight = YgSecondaryButtonTheme(
    backgroundColor: _$YgSecondaryButtonTheme.backgroundColor[0],
    borderGradient: _$YgSecondaryButtonTheme.borderGradient[0],
    disabledBorderGradient: _$YgSecondaryButtonTheme.disabledBorderGradient[0],
    disabledTextStyle: _$YgSecondaryButtonTheme.disabledTextStyle[0],
    iconDefaultColor: _$YgSecondaryButtonTheme.iconDefaultColor[0],
    iconDisabledColor: _$YgSecondaryButtonTheme.iconDisabledColor[0],
    textStyle: _$YgSecondaryButtonTheme.textStyle[0],
  );

  static final YgSecondaryButtonTheme consumerDark = YgSecondaryButtonTheme(
    backgroundColor: _$YgSecondaryButtonTheme.backgroundColor[1],
    borderGradient: _$YgSecondaryButtonTheme.borderGradient[1],
    disabledBorderGradient: _$YgSecondaryButtonTheme.disabledBorderGradient[1],
    disabledTextStyle: _$YgSecondaryButtonTheme.disabledTextStyle[1],
    iconDefaultColor: _$YgSecondaryButtonTheme.iconDefaultColor[1],
    iconDisabledColor: _$YgSecondaryButtonTheme.iconDisabledColor[1],
    textStyle: _$YgSecondaryButtonTheme.textStyle[1],
  );

  static final YgSecondaryButtonTheme professionalLight = YgSecondaryButtonTheme(
    backgroundColor: _$YgSecondaryButtonTheme.backgroundColor[2],
    borderGradient: _$YgSecondaryButtonTheme.borderGradient[2],
    disabledBorderGradient: _$YgSecondaryButtonTheme.disabledBorderGradient[2],
    disabledTextStyle: _$YgSecondaryButtonTheme.disabledTextStyle[2],
    iconDefaultColor: _$YgSecondaryButtonTheme.iconDefaultColor[2],
    iconDisabledColor: _$YgSecondaryButtonTheme.iconDisabledColor[2],
    textStyle: _$YgSecondaryButtonTheme.textStyle[2],
  );

  static final YgSecondaryButtonTheme professionalDark = YgSecondaryButtonTheme(
    backgroundColor: _$YgSecondaryButtonTheme.backgroundColor[3],
    borderGradient: _$YgSecondaryButtonTheme.borderGradient[3],
    disabledBorderGradient: _$YgSecondaryButtonTheme.disabledBorderGradient[3],
    disabledTextStyle: _$YgSecondaryButtonTheme.disabledTextStyle[3],
    iconDefaultColor: _$YgSecondaryButtonTheme.iconDefaultColor[3],
    iconDisabledColor: _$YgSecondaryButtonTheme.iconDisabledColor[3],
    textStyle: _$YgSecondaryButtonTheme.textStyle[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgSecondaryButtonTheme copyWith({
    Color? backgroundColor,
    LinearGradient? borderGradient,
    LinearGradient? disabledBorderGradient,
    TextStyle? disabledTextStyle,
    Color? iconDefaultColor,
    Color? iconDisabledColor,
    TextStyle? textStyle,
  }) {
    return YgSecondaryButtonTheme(
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
  YgSecondaryButtonTheme lerp(covariant ThemeExtension<YgSecondaryButtonTheme>? other, double t) {
    if (other is! YgSecondaryButtonTheme) return this as YgSecondaryButtonTheme;
    return YgSecondaryButtonTheme(
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
            other is YgSecondaryButtonTheme &&
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
