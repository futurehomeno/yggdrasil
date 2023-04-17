// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'secondary_button_theme.dart';

// **************************************************************************
// ThemeTailorGenerator
// **************************************************************************

class SecondaryButtonTheme extends ThemeExtension<SecondaryButtonTheme> {
  const SecondaryButtonTheme({
    required this.backgroundColor,
    required this.textStyle,
    required this.disabledTextStyle,
    required this.borderGradient,
    required this.disabledBorderGradient,
  });

  final Color backgroundColor;
  final TextStyle textStyle;
  final TextStyle disabledTextStyle;
  final LinearGradient borderGradient;
  final LinearGradient disabledBorderGradient;

  static final SecondaryButtonTheme consumerLight = SecondaryButtonTheme(
    backgroundColor: _$SecondaryButtonTheme.backgroundColor[0],
    textStyle: _$SecondaryButtonTheme.textStyle[0],
    disabledTextStyle: _$SecondaryButtonTheme.disabledTextStyle[0],
    borderGradient: _$SecondaryButtonTheme.borderGradient[0],
    disabledBorderGradient: _$SecondaryButtonTheme.disabledBorderGradient[0],
  );

  static final SecondaryButtonTheme consumerDark = SecondaryButtonTheme(
    backgroundColor: _$SecondaryButtonTheme.backgroundColor[1],
    textStyle: _$SecondaryButtonTheme.textStyle[1],
    disabledTextStyle: _$SecondaryButtonTheme.disabledTextStyle[1],
    borderGradient: _$SecondaryButtonTheme.borderGradient[1],
    disabledBorderGradient: _$SecondaryButtonTheme.disabledBorderGradient[1],
  );

  static final SecondaryButtonTheme professionalLight = SecondaryButtonTheme(
    backgroundColor: _$SecondaryButtonTheme.backgroundColor[2],
    textStyle: _$SecondaryButtonTheme.textStyle[2],
    disabledTextStyle: _$SecondaryButtonTheme.disabledTextStyle[2],
    borderGradient: _$SecondaryButtonTheme.borderGradient[2],
    disabledBorderGradient: _$SecondaryButtonTheme.disabledBorderGradient[2],
  );

  static final SecondaryButtonTheme professionalDark = SecondaryButtonTheme(
    backgroundColor: _$SecondaryButtonTheme.backgroundColor[3],
    textStyle: _$SecondaryButtonTheme.textStyle[3],
    disabledTextStyle: _$SecondaryButtonTheme.disabledTextStyle[3],
    borderGradient: _$SecondaryButtonTheme.borderGradient[3],
    disabledBorderGradient: _$SecondaryButtonTheme.disabledBorderGradient[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  SecondaryButtonTheme copyWith({
    Color? backgroundColor,
    TextStyle? textStyle,
    TextStyle? disabledTextStyle,
    LinearGradient? borderGradient,
    LinearGradient? disabledBorderGradient,
  }) {
    return SecondaryButtonTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      textStyle: textStyle ?? this.textStyle,
      disabledTextStyle: disabledTextStyle ?? this.disabledTextStyle,
      borderGradient: borderGradient ?? this.borderGradient,
      disabledBorderGradient:
          disabledBorderGradient ?? this.disabledBorderGradient,
    );
  }

  @override
  SecondaryButtonTheme lerp(
      ThemeExtension<SecondaryButtonTheme>? other, double t) {
    if (other is! SecondaryButtonTheme) return this;
    return SecondaryButtonTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      textStyle: TextStyle.lerp(textStyle, other.textStyle, t)!,
      disabledTextStyle:
          TextStyle.lerp(disabledTextStyle, other.disabledTextStyle, t)!,
      borderGradient: t < 0.5 ? borderGradient : other.borderGradient,
      disabledBorderGradient:
          t < 0.5 ? disabledBorderGradient : other.disabledBorderGradient,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SecondaryButtonTheme &&
            const DeepCollectionEquality()
                .equals(backgroundColor, other.backgroundColor) &&
            const DeepCollectionEquality().equals(textStyle, other.textStyle) &&
            const DeepCollectionEquality()
                .equals(disabledTextStyle, other.disabledTextStyle) &&
            const DeepCollectionEquality()
                .equals(borderGradient, other.borderGradient) &&
            const DeepCollectionEquality()
                .equals(disabledBorderGradient, other.disabledBorderGradient));
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        const DeepCollectionEquality().hash(backgroundColor),
        const DeepCollectionEquality().hash(textStyle),
        const DeepCollectionEquality().hash(disabledTextStyle),
        const DeepCollectionEquality().hash(borderGradient),
        const DeepCollectionEquality().hash(disabledBorderGradient));
  }
}
