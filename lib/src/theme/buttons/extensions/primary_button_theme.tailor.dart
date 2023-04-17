// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'primary_button_theme.dart';

// **************************************************************************
// ThemeTailorGenerator
// **************************************************************************

class PrimaryButtonTheme extends ThemeExtension<PrimaryButtonTheme> {
  const PrimaryButtonTheme({
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

  static final PrimaryButtonTheme consumerLight = PrimaryButtonTheme(
    backgroundColor: _$PrimaryButtonTheme.backgroundColor[0],
    textStyle: _$PrimaryButtonTheme.textStyle[0],
    disabledTextStyle: _$PrimaryButtonTheme.disabledTextStyle[0],
    borderGradient: _$PrimaryButtonTheme.borderGradient[0],
    disabledBorderGradient: _$PrimaryButtonTheme.disabledBorderGradient[0],
  );

  static final PrimaryButtonTheme consumerDark = PrimaryButtonTheme(
    backgroundColor: _$PrimaryButtonTheme.backgroundColor[1],
    textStyle: _$PrimaryButtonTheme.textStyle[1],
    disabledTextStyle: _$PrimaryButtonTheme.disabledTextStyle[1],
    borderGradient: _$PrimaryButtonTheme.borderGradient[1],
    disabledBorderGradient: _$PrimaryButtonTheme.disabledBorderGradient[1],
  );

  static final PrimaryButtonTheme professionalLight = PrimaryButtonTheme(
    backgroundColor: _$PrimaryButtonTheme.backgroundColor[2],
    textStyle: _$PrimaryButtonTheme.textStyle[2],
    disabledTextStyle: _$PrimaryButtonTheme.disabledTextStyle[2],
    borderGradient: _$PrimaryButtonTheme.borderGradient[2],
    disabledBorderGradient: _$PrimaryButtonTheme.disabledBorderGradient[2],
  );

  static final PrimaryButtonTheme professionalDark = PrimaryButtonTheme(
    backgroundColor: _$PrimaryButtonTheme.backgroundColor[3],
    textStyle: _$PrimaryButtonTheme.textStyle[3],
    disabledTextStyle: _$PrimaryButtonTheme.disabledTextStyle[3],
    borderGradient: _$PrimaryButtonTheme.borderGradient[3],
    disabledBorderGradient: _$PrimaryButtonTheme.disabledBorderGradient[3],
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
    TextStyle? textStyle,
    TextStyle? disabledTextStyle,
    LinearGradient? borderGradient,
    LinearGradient? disabledBorderGradient,
  }) {
    return PrimaryButtonTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      textStyle: textStyle ?? this.textStyle,
      disabledTextStyle: disabledTextStyle ?? this.disabledTextStyle,
      borderGradient: borderGradient ?? this.borderGradient,
      disabledBorderGradient:
          disabledBorderGradient ?? this.disabledBorderGradient,
    );
  }

  @override
  PrimaryButtonTheme lerp(ThemeExtension<PrimaryButtonTheme>? other, double t) {
    if (other is! PrimaryButtonTheme) return this;
    return PrimaryButtonTheme(
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
            other is PrimaryButtonTheme &&
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
