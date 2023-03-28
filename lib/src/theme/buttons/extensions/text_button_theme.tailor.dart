// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'text_button_theme.dart';

// **************************************************************************
// ThemeTailorGenerator
// **************************************************************************

class TextButtonTheme extends ThemeExtension<TextButtonTheme> {
  const TextButtonTheme({
    required this.textColor,
  });

  final Color textColor;

  static final TextButtonTheme consumerLight = TextButtonTheme(
    textColor: _$TextButtonTheme.textColor[0],
  );

  static final TextButtonTheme consumerDark = TextButtonTheme(
    textColor: _$TextButtonTheme.textColor[1],
  );

  static final TextButtonTheme professionalLight = TextButtonTheme(
    textColor: _$TextButtonTheme.textColor[2],
  );

  static final TextButtonTheme professionalDark = TextButtonTheme(
    textColor: _$TextButtonTheme.textColor[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  TextButtonTheme copyWith({
    Color? textColor,
  }) {
    return TextButtonTheme(
      textColor: textColor ?? this.textColor,
    );
  }

  @override
  TextButtonTheme lerp(ThemeExtension<TextButtonTheme>? other, double t) {
    if (other is! TextButtonTheme) return this;
    return TextButtonTheme(
      textColor: Color.lerp(textColor, other.textColor, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TextButtonTheme &&
            const DeepCollectionEquality().equals(textColor, other.textColor));
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType, const DeepCollectionEquality().hash(textColor));
  }
}
