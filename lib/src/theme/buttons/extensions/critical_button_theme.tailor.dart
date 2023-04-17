// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'critical_button_theme.dart';

// **************************************************************************
// ThemeTailorGenerator
// **************************************************************************

class CriticalButtonTheme extends ThemeExtension<CriticalButtonTheme> {
  const CriticalButtonTheme({
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

  static final CriticalButtonTheme consumerLight = CriticalButtonTheme(
    backgroundColor: _$CriticalButtonTheme.backgroundColor[0],
    textStyle: _$CriticalButtonTheme.textStyle[0],
    disabledTextStyle: _$CriticalButtonTheme.disabledTextStyle[0],
    borderGradient: _$CriticalButtonTheme.borderGradient[0],
    disabledBorderGradient: _$CriticalButtonTheme.disabledBorderGradient[0],
  );

  static final CriticalButtonTheme consumerDark = CriticalButtonTheme(
    backgroundColor: _$CriticalButtonTheme.backgroundColor[1],
    textStyle: _$CriticalButtonTheme.textStyle[1],
    disabledTextStyle: _$CriticalButtonTheme.disabledTextStyle[1],
    borderGradient: _$CriticalButtonTheme.borderGradient[1],
    disabledBorderGradient: _$CriticalButtonTheme.disabledBorderGradient[1],
  );

  static final CriticalButtonTheme professionalLight = CriticalButtonTheme(
    backgroundColor: _$CriticalButtonTheme.backgroundColor[2],
    textStyle: _$CriticalButtonTheme.textStyle[2],
    disabledTextStyle: _$CriticalButtonTheme.disabledTextStyle[2],
    borderGradient: _$CriticalButtonTheme.borderGradient[2],
    disabledBorderGradient: _$CriticalButtonTheme.disabledBorderGradient[2],
  );

  static final CriticalButtonTheme professionalDark = CriticalButtonTheme(
    backgroundColor: _$CriticalButtonTheme.backgroundColor[3],
    textStyle: _$CriticalButtonTheme.textStyle[3],
    disabledTextStyle: _$CriticalButtonTheme.disabledTextStyle[3],
    borderGradient: _$CriticalButtonTheme.borderGradient[3],
    disabledBorderGradient: _$CriticalButtonTheme.disabledBorderGradient[3],
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
    TextStyle? textStyle,
    TextStyle? disabledTextStyle,
    LinearGradient? borderGradient,
    LinearGradient? disabledBorderGradient,
  }) {
    return CriticalButtonTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      textStyle: textStyle ?? this.textStyle,
      disabledTextStyle: disabledTextStyle ?? this.disabledTextStyle,
      borderGradient: borderGradient ?? this.borderGradient,
      disabledBorderGradient:
          disabledBorderGradient ?? this.disabledBorderGradient,
    );
  }

  @override
  CriticalButtonTheme lerp(
      ThemeExtension<CriticalButtonTheme>? other, double t) {
    if (other is! CriticalButtonTheme) return this;
    return CriticalButtonTheme(
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
            other is CriticalButtonTheme &&
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
