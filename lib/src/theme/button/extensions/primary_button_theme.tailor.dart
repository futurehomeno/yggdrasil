// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'primary_button_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class PrimaryButtonTheme extends ThemeExtension<PrimaryButtonTheme> {
  const PrimaryButtonTheme({
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

  static final PrimaryButtonTheme consumerLight = PrimaryButtonTheme(
    backgroundColor: _$PrimaryButtonTheme.backgroundColor[0],
    borderGradient: _$PrimaryButtonTheme.borderGradient[0],
    disabledBorderGradient: _$PrimaryButtonTheme.disabledBorderGradient[0],
    disabledTextStyle: _$PrimaryButtonTheme.disabledTextStyle[0],
    iconDefaultColor: _$PrimaryButtonTheme.iconDefaultColor[0],
    iconDisabledColor: _$PrimaryButtonTheme.iconDisabledColor[0],
    textStyle: _$PrimaryButtonTheme.textStyle[0],
  );

  static final PrimaryButtonTheme consumerDark = PrimaryButtonTheme(
    backgroundColor: _$PrimaryButtonTheme.backgroundColor[1],
    borderGradient: _$PrimaryButtonTheme.borderGradient[1],
    disabledBorderGradient: _$PrimaryButtonTheme.disabledBorderGradient[1],
    disabledTextStyle: _$PrimaryButtonTheme.disabledTextStyle[1],
    iconDefaultColor: _$PrimaryButtonTheme.iconDefaultColor[1],
    iconDisabledColor: _$PrimaryButtonTheme.iconDisabledColor[1],
    textStyle: _$PrimaryButtonTheme.textStyle[1],
  );

  static final PrimaryButtonTheme professionalLight = PrimaryButtonTheme(
    backgroundColor: _$PrimaryButtonTheme.backgroundColor[2],
    borderGradient: _$PrimaryButtonTheme.borderGradient[2],
    disabledBorderGradient: _$PrimaryButtonTheme.disabledBorderGradient[2],
    disabledTextStyle: _$PrimaryButtonTheme.disabledTextStyle[2],
    iconDefaultColor: _$PrimaryButtonTheme.iconDefaultColor[2],
    iconDisabledColor: _$PrimaryButtonTheme.iconDisabledColor[2],
    textStyle: _$PrimaryButtonTheme.textStyle[2],
  );

  static final PrimaryButtonTheme professionalDark = PrimaryButtonTheme(
    backgroundColor: _$PrimaryButtonTheme.backgroundColor[3],
    borderGradient: _$PrimaryButtonTheme.borderGradient[3],
    disabledBorderGradient: _$PrimaryButtonTheme.disabledBorderGradient[3],
    disabledTextStyle: _$PrimaryButtonTheme.disabledTextStyle[3],
    iconDefaultColor: _$PrimaryButtonTheme.iconDefaultColor[3],
    iconDisabledColor: _$PrimaryButtonTheme.iconDisabledColor[3],
    textStyle: _$PrimaryButtonTheme.textStyle[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  PrimaryButtonTheme copyWith({
    Color? backgroundColor,
    LinearGradient? borderGradient,
    LinearGradient? disabledBorderGradient,
    TextStyle? disabledTextStyle,
    Color? iconDefaultColor,
    Color? iconDisabledColor,
    TextStyle? textStyle,
  }) {
    return PrimaryButtonTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      borderGradient: borderGradient ?? this.borderGradient,
      disabledBorderGradient:
          disabledBorderGradient ?? this.disabledBorderGradient,
      disabledTextStyle: disabledTextStyle ?? this.disabledTextStyle,
      iconDefaultColor: iconDefaultColor ?? this.iconDefaultColor,
      iconDisabledColor: iconDisabledColor ?? this.iconDisabledColor,
      textStyle: textStyle ?? this.textStyle,
    );
  }

  @override
  PrimaryButtonTheme lerp(
      covariant ThemeExtension<PrimaryButtonTheme>? other, double t) {
    if (other is! PrimaryButtonTheme) return this as PrimaryButtonTheme;
    return PrimaryButtonTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      borderGradient: t < 0.5 ? borderGradient : other.borderGradient,
      disabledBorderGradient:
          t < 0.5 ? disabledBorderGradient : other.disabledBorderGradient,
      disabledTextStyle:
          TextStyle.lerp(disabledTextStyle, other.disabledTextStyle, t)!,
      iconDefaultColor:
          Color.lerp(iconDefaultColor, other.iconDefaultColor, t)!,
      iconDisabledColor:
          Color.lerp(iconDisabledColor, other.iconDisabledColor, t)!,
      textStyle: TextStyle.lerp(textStyle, other.textStyle, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PrimaryButtonTheme &&
            const DeepCollectionEquality()
                .equals(backgroundColor, other.backgroundColor) &&
            const DeepCollectionEquality()
                .equals(borderGradient, other.borderGradient) &&
            const DeepCollectionEquality()
                .equals(disabledBorderGradient, other.disabledBorderGradient) &&
            const DeepCollectionEquality()
                .equals(disabledTextStyle, other.disabledTextStyle) &&
            const DeepCollectionEquality()
                .equals(iconDefaultColor, other.iconDefaultColor) &&
            const DeepCollectionEquality()
                .equals(iconDisabledColor, other.iconDisabledColor) &&
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
