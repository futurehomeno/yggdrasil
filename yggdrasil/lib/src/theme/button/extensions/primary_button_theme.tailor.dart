// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'primary_button_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgPrimaryButtonTheme extends ThemeExtension<YgPrimaryButtonTheme> {
  const YgPrimaryButtonTheme({
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

  static final YgPrimaryButtonTheme consumerLight = YgPrimaryButtonTheme(
    backgroundColor: _$YgPrimaryButtonTheme.backgroundColor[0],
    borderGradient: _$YgPrimaryButtonTheme.borderGradient[0],
    disabledBorderGradient: _$YgPrimaryButtonTheme.disabledBorderGradient[0],
    disabledTextStyle: _$YgPrimaryButtonTheme.disabledTextStyle[0],
    iconDefaultColor: _$YgPrimaryButtonTheme.iconDefaultColor[0],
    iconDisabledColor: _$YgPrimaryButtonTheme.iconDisabledColor[0],
    textStyle: _$YgPrimaryButtonTheme.textStyle[0],
  );

  static final YgPrimaryButtonTheme consumerDark = YgPrimaryButtonTheme(
    backgroundColor: _$YgPrimaryButtonTheme.backgroundColor[1],
    borderGradient: _$YgPrimaryButtonTheme.borderGradient[1],
    disabledBorderGradient: _$YgPrimaryButtonTheme.disabledBorderGradient[1],
    disabledTextStyle: _$YgPrimaryButtonTheme.disabledTextStyle[1],
    iconDefaultColor: _$YgPrimaryButtonTheme.iconDefaultColor[1],
    iconDisabledColor: _$YgPrimaryButtonTheme.iconDisabledColor[1],
    textStyle: _$YgPrimaryButtonTheme.textStyle[1],
  );

  static final YgPrimaryButtonTheme professionalLight = YgPrimaryButtonTheme(
    backgroundColor: _$YgPrimaryButtonTheme.backgroundColor[2],
    borderGradient: _$YgPrimaryButtonTheme.borderGradient[2],
    disabledBorderGradient: _$YgPrimaryButtonTheme.disabledBorderGradient[2],
    disabledTextStyle: _$YgPrimaryButtonTheme.disabledTextStyle[2],
    iconDefaultColor: _$YgPrimaryButtonTheme.iconDefaultColor[2],
    iconDisabledColor: _$YgPrimaryButtonTheme.iconDisabledColor[2],
    textStyle: _$YgPrimaryButtonTheme.textStyle[2],
  );

  static final YgPrimaryButtonTheme professionalDark = YgPrimaryButtonTheme(
    backgroundColor: _$YgPrimaryButtonTheme.backgroundColor[3],
    borderGradient: _$YgPrimaryButtonTheme.borderGradient[3],
    disabledBorderGradient: _$YgPrimaryButtonTheme.disabledBorderGradient[3],
    disabledTextStyle: _$YgPrimaryButtonTheme.disabledTextStyle[3],
    iconDefaultColor: _$YgPrimaryButtonTheme.iconDefaultColor[3],
    iconDisabledColor: _$YgPrimaryButtonTheme.iconDisabledColor[3],
    textStyle: _$YgPrimaryButtonTheme.textStyle[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgPrimaryButtonTheme copyWith({
    Color? backgroundColor,
    LinearGradient? borderGradient,
    LinearGradient? disabledBorderGradient,
    TextStyle? disabledTextStyle,
    Color? iconDefaultColor,
    Color? iconDisabledColor,
    TextStyle? textStyle,
  }) {
    return YgPrimaryButtonTheme(
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
  YgPrimaryButtonTheme lerp(covariant ThemeExtension<YgPrimaryButtonTheme>? other, double t) {
    if (other is! YgPrimaryButtonTheme) return this as YgPrimaryButtonTheme;
    return YgPrimaryButtonTheme(
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
            other is YgPrimaryButtonTheme &&
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
