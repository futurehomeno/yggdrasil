// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'critical_button_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgCriticalButtonTheme extends ThemeExtension<YgCriticalButtonTheme> {
  const YgCriticalButtonTheme({
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

  static final YgCriticalButtonTheme consumerLight = YgCriticalButtonTheme(
    backgroundColor: _$YgCriticalButtonTheme.backgroundColor[0],
    borderGradient: _$YgCriticalButtonTheme.borderGradient[0],
    disabledBorderGradient: _$YgCriticalButtonTheme.disabledBorderGradient[0],
    disabledTextStyle: _$YgCriticalButtonTheme.disabledTextStyle[0],
    iconDefaultColor: _$YgCriticalButtonTheme.iconDefaultColor[0],
    iconDisabledColor: _$YgCriticalButtonTheme.iconDisabledColor[0],
    textStyle: _$YgCriticalButtonTheme.textStyle[0],
  );

  static final YgCriticalButtonTheme consumerDark = YgCriticalButtonTheme(
    backgroundColor: _$YgCriticalButtonTheme.backgroundColor[1],
    borderGradient: _$YgCriticalButtonTheme.borderGradient[1],
    disabledBorderGradient: _$YgCriticalButtonTheme.disabledBorderGradient[1],
    disabledTextStyle: _$YgCriticalButtonTheme.disabledTextStyle[1],
    iconDefaultColor: _$YgCriticalButtonTheme.iconDefaultColor[1],
    iconDisabledColor: _$YgCriticalButtonTheme.iconDisabledColor[1],
    textStyle: _$YgCriticalButtonTheme.textStyle[1],
  );

  static final YgCriticalButtonTheme professionalLight = YgCriticalButtonTheme(
    backgroundColor: _$YgCriticalButtonTheme.backgroundColor[2],
    borderGradient: _$YgCriticalButtonTheme.borderGradient[2],
    disabledBorderGradient: _$YgCriticalButtonTheme.disabledBorderGradient[2],
    disabledTextStyle: _$YgCriticalButtonTheme.disabledTextStyle[2],
    iconDefaultColor: _$YgCriticalButtonTheme.iconDefaultColor[2],
    iconDisabledColor: _$YgCriticalButtonTheme.iconDisabledColor[2],
    textStyle: _$YgCriticalButtonTheme.textStyle[2],
  );

  static final YgCriticalButtonTheme professionalDark = YgCriticalButtonTheme(
    backgroundColor: _$YgCriticalButtonTheme.backgroundColor[3],
    borderGradient: _$YgCriticalButtonTheme.borderGradient[3],
    disabledBorderGradient: _$YgCriticalButtonTheme.disabledBorderGradient[3],
    disabledTextStyle: _$YgCriticalButtonTheme.disabledTextStyle[3],
    iconDefaultColor: _$YgCriticalButtonTheme.iconDefaultColor[3],
    iconDisabledColor: _$YgCriticalButtonTheme.iconDisabledColor[3],
    textStyle: _$YgCriticalButtonTheme.textStyle[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgCriticalButtonTheme copyWith({
    Color? backgroundColor,
    LinearGradient? borderGradient,
    LinearGradient? disabledBorderGradient,
    TextStyle? disabledTextStyle,
    Color? iconDefaultColor,
    Color? iconDisabledColor,
    TextStyle? textStyle,
  }) {
    return YgCriticalButtonTheme(
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
  YgCriticalButtonTheme lerp(covariant ThemeExtension<YgCriticalButtonTheme>? other, double t) {
    if (other is! YgCriticalButtonTheme) return this as YgCriticalButtonTheme;
    return YgCriticalButtonTheme(
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
            other is YgCriticalButtonTheme &&
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
