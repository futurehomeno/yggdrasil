// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'text_button_theme.dart';

// **************************************************************************
// ThemeTailorGenerator
// **************************************************************************

class TextButtonTheme extends ThemeExtension<TextButtonTheme> {
  const TextButtonTheme({
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

  static final TextButtonTheme consumerLight = TextButtonTheme(
    backgroundColor: _$TextButtonTheme.backgroundColor[0],
    textStyle: _$TextButtonTheme.textStyle[0],
    disabledTextStyle: _$TextButtonTheme.disabledTextStyle[0],
    borderGradient: _$TextButtonTheme.borderGradient[0],
    disabledBorderGradient: _$TextButtonTheme.disabledBorderGradient[0],
  );

  static final TextButtonTheme consumerDark = TextButtonTheme(
    backgroundColor: _$TextButtonTheme.backgroundColor[1],
    textStyle: _$TextButtonTheme.textStyle[1],
    disabledTextStyle: _$TextButtonTheme.disabledTextStyle[1],
    borderGradient: _$TextButtonTheme.borderGradient[1],
    disabledBorderGradient: _$TextButtonTheme.disabledBorderGradient[1],
  );

  static final TextButtonTheme professionalLight = TextButtonTheme(
    backgroundColor: _$TextButtonTheme.backgroundColor[2],
    textStyle: _$TextButtonTheme.textStyle[2],
    disabledTextStyle: _$TextButtonTheme.disabledTextStyle[2],
    borderGradient: _$TextButtonTheme.borderGradient[2],
    disabledBorderGradient: _$TextButtonTheme.disabledBorderGradient[2],
  );

  static final TextButtonTheme professionalDark = TextButtonTheme(
    backgroundColor: _$TextButtonTheme.backgroundColor[3],
    textStyle: _$TextButtonTheme.textStyle[3],
    disabledTextStyle: _$TextButtonTheme.disabledTextStyle[3],
    borderGradient: _$TextButtonTheme.borderGradient[3],
    disabledBorderGradient: _$TextButtonTheme.disabledBorderGradient[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  TextButtonTheme copyWith({
    Color? backgroundColor,
    TextStyle? textStyle,
    TextStyle? disabledTextStyle,
    LinearGradient? borderGradient,
    LinearGradient? disabledBorderGradient,
  }) {
    return TextButtonTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      textStyle: textStyle ?? this.textStyle,
      disabledTextStyle: disabledTextStyle ?? this.disabledTextStyle,
      borderGradient: borderGradient ?? this.borderGradient,
      disabledBorderGradient:
          disabledBorderGradient ?? this.disabledBorderGradient,
    );
  }

  @override
  TextButtonTheme lerp(ThemeExtension<TextButtonTheme>? other, double t) {
    if (other is! TextButtonTheme) return this;
    return TextButtonTheme(
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
            other is TextButtonTheme &&
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
