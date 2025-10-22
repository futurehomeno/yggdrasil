// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'text_button_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgTextButtonTheme extends ThemeExtension<YgTextButtonTheme> {
  const YgTextButtonTheme({
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

  static final YgTextButtonTheme consumerLight = YgTextButtonTheme(
    backgroundColor: _$YgTextButtonTheme.backgroundColor[0],
    borderGradient: _$YgTextButtonTheme.borderGradient[0],
    disabledBorderGradient: _$YgTextButtonTheme.disabledBorderGradient[0],
    disabledTextStyle: _$YgTextButtonTheme.disabledTextStyle[0],
    iconDefaultColor: _$YgTextButtonTheme.iconDefaultColor[0],
    iconDisabledColor: _$YgTextButtonTheme.iconDisabledColor[0],
    textStyle: _$YgTextButtonTheme.textStyle[0],
  );

  static final YgTextButtonTheme consumerDark = YgTextButtonTheme(
    backgroundColor: _$YgTextButtonTheme.backgroundColor[1],
    borderGradient: _$YgTextButtonTheme.borderGradient[1],
    disabledBorderGradient: _$YgTextButtonTheme.disabledBorderGradient[1],
    disabledTextStyle: _$YgTextButtonTheme.disabledTextStyle[1],
    iconDefaultColor: _$YgTextButtonTheme.iconDefaultColor[1],
    iconDisabledColor: _$YgTextButtonTheme.iconDisabledColor[1],
    textStyle: _$YgTextButtonTheme.textStyle[1],
  );

  static final YgTextButtonTheme professionalLight = YgTextButtonTheme(
    backgroundColor: _$YgTextButtonTheme.backgroundColor[2],
    borderGradient: _$YgTextButtonTheme.borderGradient[2],
    disabledBorderGradient: _$YgTextButtonTheme.disabledBorderGradient[2],
    disabledTextStyle: _$YgTextButtonTheme.disabledTextStyle[2],
    iconDefaultColor: _$YgTextButtonTheme.iconDefaultColor[2],
    iconDisabledColor: _$YgTextButtonTheme.iconDisabledColor[2],
    textStyle: _$YgTextButtonTheme.textStyle[2],
  );

  static final YgTextButtonTheme professionalDark = YgTextButtonTheme(
    backgroundColor: _$YgTextButtonTheme.backgroundColor[3],
    borderGradient: _$YgTextButtonTheme.borderGradient[3],
    disabledBorderGradient: _$YgTextButtonTheme.disabledBorderGradient[3],
    disabledTextStyle: _$YgTextButtonTheme.disabledTextStyle[3],
    iconDefaultColor: _$YgTextButtonTheme.iconDefaultColor[3],
    iconDisabledColor: _$YgTextButtonTheme.iconDisabledColor[3],
    textStyle: _$YgTextButtonTheme.textStyle[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgTextButtonTheme copyWith({
    Color? backgroundColor,
    LinearGradient? borderGradient,
    LinearGradient? disabledBorderGradient,
    TextStyle? disabledTextStyle,
    Color? iconDefaultColor,
    Color? iconDisabledColor,
    TextStyle? textStyle,
  }) {
    return YgTextButtonTheme(
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
  YgTextButtonTheme lerp(covariant ThemeExtension<YgTextButtonTheme>? other, double t) {
    if (other is! YgTextButtonTheme) return this as YgTextButtonTheme;
    return YgTextButtonTheme(
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
            other is YgTextButtonTheme &&
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
