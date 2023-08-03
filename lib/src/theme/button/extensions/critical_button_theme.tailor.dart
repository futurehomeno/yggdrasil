// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'critical_button_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class CriticalButtonTheme extends ThemeExtension<CriticalButtonTheme> {
  const CriticalButtonTheme({
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

  static final CriticalButtonTheme consumerLight = CriticalButtonTheme(
    backgroundColor: _$CriticalButtonTheme.backgroundColor[0],
    borderGradient: _$CriticalButtonTheme.borderGradient[0],
    disabledBorderGradient: _$CriticalButtonTheme.disabledBorderGradient[0],
    disabledTextStyle: _$CriticalButtonTheme.disabledTextStyle[0],
    iconDefaultColor: _$CriticalButtonTheme.iconDefaultColor[0],
    iconDisabledColor: _$CriticalButtonTheme.iconDisabledColor[0],
    textStyle: _$CriticalButtonTheme.textStyle[0],
  );

  static final CriticalButtonTheme consumerDark = CriticalButtonTheme(
    backgroundColor: _$CriticalButtonTheme.backgroundColor[1],
    borderGradient: _$CriticalButtonTheme.borderGradient[1],
    disabledBorderGradient: _$CriticalButtonTheme.disabledBorderGradient[1],
    disabledTextStyle: _$CriticalButtonTheme.disabledTextStyle[1],
    iconDefaultColor: _$CriticalButtonTheme.iconDefaultColor[1],
    iconDisabledColor: _$CriticalButtonTheme.iconDisabledColor[1],
    textStyle: _$CriticalButtonTheme.textStyle[1],
  );

  static final CriticalButtonTheme professionalLight = CriticalButtonTheme(
    backgroundColor: _$CriticalButtonTheme.backgroundColor[2],
    borderGradient: _$CriticalButtonTheme.borderGradient[2],
    disabledBorderGradient: _$CriticalButtonTheme.disabledBorderGradient[2],
    disabledTextStyle: _$CriticalButtonTheme.disabledTextStyle[2],
    iconDefaultColor: _$CriticalButtonTheme.iconDefaultColor[2],
    iconDisabledColor: _$CriticalButtonTheme.iconDisabledColor[2],
    textStyle: _$CriticalButtonTheme.textStyle[2],
  );

  static final CriticalButtonTheme professionalDark = CriticalButtonTheme(
    backgroundColor: _$CriticalButtonTheme.backgroundColor[3],
    borderGradient: _$CriticalButtonTheme.borderGradient[3],
    disabledBorderGradient: _$CriticalButtonTheme.disabledBorderGradient[3],
    disabledTextStyle: _$CriticalButtonTheme.disabledTextStyle[3],
    iconDefaultColor: _$CriticalButtonTheme.iconDefaultColor[3],
    iconDisabledColor: _$CriticalButtonTheme.iconDisabledColor[3],
    textStyle: _$CriticalButtonTheme.textStyle[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  CriticalButtonTheme copyWith({
    Color? backgroundColor,
    LinearGradient? borderGradient,
    LinearGradient? disabledBorderGradient,
    TextStyle? disabledTextStyle,
    Color? iconDefaultColor,
    Color? iconDisabledColor,
    TextStyle? textStyle,
  }) {
    return CriticalButtonTheme(
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
  CriticalButtonTheme lerp(
      covariant ThemeExtension<CriticalButtonTheme>? other, double t) {
    if (other is! CriticalButtonTheme) return this as CriticalButtonTheme;
    return CriticalButtonTheme(
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
            other is CriticalButtonTheme &&
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
