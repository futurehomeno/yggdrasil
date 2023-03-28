// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'secondary_button_theme.dart';

// **************************************************************************
// ThemeTailorGenerator
// **************************************************************************

class SecondaryButtonTheme extends ThemeExtension<SecondaryButtonTheme> {
  const SecondaryButtonTheme({
    required this.textColor,
  });

  final Color textColor;

  static final SecondaryButtonTheme consumerLight = SecondaryButtonTheme(
    textColor: _$SecondaryButtonTheme.textColor[0],
  );

  static final SecondaryButtonTheme consumerDark = SecondaryButtonTheme(
    textColor: _$SecondaryButtonTheme.textColor[1],
  );

  static final SecondaryButtonTheme professionalLight = SecondaryButtonTheme(
    textColor: _$SecondaryButtonTheme.textColor[2],
  );

  static final SecondaryButtonTheme professionalDark = SecondaryButtonTheme(
    textColor: _$SecondaryButtonTheme.textColor[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  SecondaryButtonTheme copyWith({
    Color? textColor,
  }) {
    return SecondaryButtonTheme(
      textColor: textColor ?? this.textColor,
    );
  }

  @override
  SecondaryButtonTheme lerp(
      ThemeExtension<SecondaryButtonTheme>? other, double t) {
    if (other is! SecondaryButtonTheme) return this;
    return SecondaryButtonTheme(
      textColor: Color.lerp(textColor, other.textColor, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SecondaryButtonTheme &&
            const DeepCollectionEquality().equals(textColor, other.textColor));
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType, const DeepCollectionEquality().hash(textColor));
  }
}
