// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'text_button_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class TextButtonTheme extends ThemeExtension<TextButtonTheme> {
  const TextButtonTheme({
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

  static final TextButtonTheme consumerLight = TextButtonTheme(
    backgroundColor: _$TextButtonTheme.backgroundColor[0],
    borderGradient: _$TextButtonTheme.borderGradient[0],
    disabledBorderGradient: _$TextButtonTheme.disabledBorderGradient[0],
    disabledTextStyle: _$TextButtonTheme.disabledTextStyle[0],
    textStyle: _$TextButtonTheme.textStyle[0],
  );

  static final TextButtonTheme consumerDark = TextButtonTheme(
    backgroundColor: _$TextButtonTheme.backgroundColor[1],
    borderGradient: _$TextButtonTheme.borderGradient[1],
    disabledBorderGradient: _$TextButtonTheme.disabledBorderGradient[1],
    disabledTextStyle: _$TextButtonTheme.disabledTextStyle[1],
    textStyle: _$TextButtonTheme.textStyle[1],
  );

  static final TextButtonTheme professionalLight = TextButtonTheme(
    backgroundColor: _$TextButtonTheme.backgroundColor[2],
    borderGradient: _$TextButtonTheme.borderGradient[2],
    disabledBorderGradient: _$TextButtonTheme.disabledBorderGradient[2],
    disabledTextStyle: _$TextButtonTheme.disabledTextStyle[2],
    textStyle: _$TextButtonTheme.textStyle[2],
  );

  static final TextButtonTheme professionalDark = TextButtonTheme(
    backgroundColor: _$TextButtonTheme.backgroundColor[3],
    borderGradient: _$TextButtonTheme.borderGradient[3],
    disabledBorderGradient: _$TextButtonTheme.disabledBorderGradient[3],
    disabledTextStyle: _$TextButtonTheme.disabledTextStyle[3],
    textStyle: _$TextButtonTheme.textStyle[3],
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
    LinearGradient? borderGradient,
    LinearGradient? disabledBorderGradient,
    TextStyle? disabledTextStyle,
    TextStyle? textStyle,
  }) {
    return TextButtonTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      borderGradient: borderGradient ?? this.borderGradient,
      disabledBorderGradient:
          disabledBorderGradient ?? this.disabledBorderGradient,
      disabledTextStyle: disabledTextStyle ?? this.disabledTextStyle,
      textStyle: textStyle ?? this.textStyle,
    );
  }

  @override
  TextButtonTheme lerp(
      covariant ThemeExtension<TextButtonTheme>? other, double t) {
    if (other is! TextButtonTheme) return this as TextButtonTheme;
    return TextButtonTheme(
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
            other is TextButtonTheme &&
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
