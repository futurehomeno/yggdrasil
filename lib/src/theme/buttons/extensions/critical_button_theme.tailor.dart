// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'critical_button_theme.dart';

// **************************************************************************
// ThemeTailorGenerator
// **************************************************************************

class CriticalButtonTheme extends ThemeExtension<CriticalButtonTheme> {
  const CriticalButtonTheme({
    required this.textColor,
  });

  final Color textColor;

  static final CriticalButtonTheme consumerLight = CriticalButtonTheme(
    textColor: _$CriticalButtonTheme.textColor[0],
  );

  static final CriticalButtonTheme consumerDark = CriticalButtonTheme(
    textColor: _$CriticalButtonTheme.textColor[1],
  );

  static final CriticalButtonTheme professionalLight = CriticalButtonTheme(
    textColor: _$CriticalButtonTheme.textColor[2],
  );

  static final CriticalButtonTheme professionalDark = CriticalButtonTheme(
    textColor: _$CriticalButtonTheme.textColor[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  CriticalButtonTheme copyWith({
    Color? textColor,
  }) {
    return CriticalButtonTheme(
      textColor: textColor ?? this.textColor,
    );
  }

  @override
  CriticalButtonTheme lerp(
      ThemeExtension<CriticalButtonTheme>? other, double t) {
    if (other is! CriticalButtonTheme) return this;
    return CriticalButtonTheme(
      textColor: Color.lerp(textColor, other.textColor, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CriticalButtonTheme &&
            const DeepCollectionEquality().equals(textColor, other.textColor));
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType, const DeepCollectionEquality().hash(textColor));
  }
}
