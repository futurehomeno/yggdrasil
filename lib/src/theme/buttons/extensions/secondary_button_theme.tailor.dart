// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'secondary_button_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class SecondaryButtonTheme extends ThemeExtension<SecondaryButtonTheme> {
  const SecondaryButtonTheme({
    required this.backgroundColor,
    required this.borderGradient,
    required this.disabledBorderGradient,
    required this.disabledTextStyle,
    required this.textStyle,
  });

  final Color backgroundColor;
  final LinearGradient borderGradient;
  final LinearGradient disabledBorderGradient;
  final TextStyle disabledTextStyle;
  final TextStyle textStyle;

  static final SecondaryButtonTheme consumerLight = SecondaryButtonTheme(
    backgroundColor: _$SecondaryButtonTheme.backgroundColor[0],
    borderGradient: _$SecondaryButtonTheme.borderGradient[0],
    disabledBorderGradient: _$SecondaryButtonTheme.disabledBorderGradient[0],
    disabledTextStyle: _$SecondaryButtonTheme.disabledTextStyle[0],
    textStyle: _$SecondaryButtonTheme.textStyle[0],
  );

  static final SecondaryButtonTheme consumerDark = SecondaryButtonTheme(
    backgroundColor: _$SecondaryButtonTheme.backgroundColor[1],
    borderGradient: _$SecondaryButtonTheme.borderGradient[1],
    disabledBorderGradient: _$SecondaryButtonTheme.disabledBorderGradient[1],
    disabledTextStyle: _$SecondaryButtonTheme.disabledTextStyle[1],
    textStyle: _$SecondaryButtonTheme.textStyle[1],
  );

  static final SecondaryButtonTheme professionalLight = SecondaryButtonTheme(
    backgroundColor: _$SecondaryButtonTheme.backgroundColor[2],
    borderGradient: _$SecondaryButtonTheme.borderGradient[2],
    disabledBorderGradient: _$SecondaryButtonTheme.disabledBorderGradient[2],
    disabledTextStyle: _$SecondaryButtonTheme.disabledTextStyle[2],
    textStyle: _$SecondaryButtonTheme.textStyle[2],
  );

  static final SecondaryButtonTheme professionalDark = SecondaryButtonTheme(
    backgroundColor: _$SecondaryButtonTheme.backgroundColor[3],
    borderGradient: _$SecondaryButtonTheme.borderGradient[3],
    disabledBorderGradient: _$SecondaryButtonTheme.disabledBorderGradient[3],
    disabledTextStyle: _$SecondaryButtonTheme.disabledTextStyle[3],
    textStyle: _$SecondaryButtonTheme.textStyle[3],
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
    LinearGradient? borderGradient,
    LinearGradient? disabledBorderGradient,
    TextStyle? disabledTextStyle,
    TextStyle? textStyle,
  }) {
    return SecondaryButtonTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      borderGradient: borderGradient ?? this.borderGradient,
      disabledBorderGradient:
          disabledBorderGradient ?? this.disabledBorderGradient,
      disabledTextStyle: disabledTextStyle ?? this.disabledTextStyle,
      textStyle: textStyle ?? this.textStyle,
    );
  }

  @override
  SecondaryButtonTheme lerp(
      covariant ThemeExtension<SecondaryButtonTheme>? other, double t) {
    if (other is! SecondaryButtonTheme) return this as SecondaryButtonTheme;
    return SecondaryButtonTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      borderGradient: t < 0.5 ? borderGradient : other.borderGradient,
      disabledBorderGradient:
          t < 0.5 ? disabledBorderGradient : other.disabledBorderGradient,
      disabledTextStyle:
          TextStyle.lerp(disabledTextStyle, other.disabledTextStyle, t)!,
      textStyle: TextStyle.lerp(textStyle, other.textStyle, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SecondaryButtonTheme &&
            const DeepCollectionEquality()
                .equals(backgroundColor, other.backgroundColor) &&
            const DeepCollectionEquality()
                .equals(borderGradient, other.borderGradient) &&
            const DeepCollectionEquality()
                .equals(disabledBorderGradient, other.disabledBorderGradient) &&
            const DeepCollectionEquality()
                .equals(disabledTextStyle, other.disabledTextStyle) &&
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
      const DeepCollectionEquality().hash(textStyle),
    );
  }
}
