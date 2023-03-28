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
    required this.borderWidth,
    required this.borderGradient,
    required this.borderRadius,
  });

  final Color backgroundColor;
  final TextStyle textStyle;
  final double borderWidth;
  final Gradient borderGradient;
  final BorderRadius borderRadius;

  static final PrimaryButtonTheme consumerLight = PrimaryButtonTheme(
    backgroundColor: _$PrimaryButtonTheme.backgroundColor[0],
    textStyle: _$PrimaryButtonTheme.textStyle[0],
    borderWidth: _$PrimaryButtonTheme.borderWidth[0],
    borderGradient: _$PrimaryButtonTheme.borderGradient[0],
    borderRadius: _$PrimaryButtonTheme.borderRadius[0],
  );

  static final PrimaryButtonTheme consumerDark = PrimaryButtonTheme(
    backgroundColor: _$PrimaryButtonTheme.backgroundColor[1],
    textStyle: _$PrimaryButtonTheme.textStyle[1],
    borderWidth: _$PrimaryButtonTheme.borderWidth[1],
    borderGradient: _$PrimaryButtonTheme.borderGradient[1],
    borderRadius: _$PrimaryButtonTheme.borderRadius[1],
  );

  static final PrimaryButtonTheme professionalLight = PrimaryButtonTheme(
    backgroundColor: _$PrimaryButtonTheme.backgroundColor[2],
    textStyle: _$PrimaryButtonTheme.textStyle[2],
    borderWidth: _$PrimaryButtonTheme.borderWidth[2],
    borderGradient: _$PrimaryButtonTheme.borderGradient[2],
    borderRadius: _$PrimaryButtonTheme.borderRadius[2],
  );

  static final PrimaryButtonTheme professionalDark = PrimaryButtonTheme(
    backgroundColor: _$PrimaryButtonTheme.backgroundColor[3],
    textStyle: _$PrimaryButtonTheme.textStyle[3],
    borderWidth: _$PrimaryButtonTheme.borderWidth[3],
    borderGradient: _$PrimaryButtonTheme.borderGradient[3],
    borderRadius: _$PrimaryButtonTheme.borderRadius[3],
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
    double? borderWidth,
    Gradient? borderGradient,
    BorderRadius? borderRadius,
  }) {
    return PrimaryButtonTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      textStyle: textStyle ?? this.textStyle,
      borderWidth: borderWidth ?? this.borderWidth,
      borderGradient: borderGradient ?? this.borderGradient,
      borderRadius: borderRadius ?? this.borderRadius,
    );
  }

  @override
  PrimaryButtonTheme lerp(ThemeExtension<PrimaryButtonTheme>? other, double t) {
    if (other is! PrimaryButtonTheme) return this;
    return PrimaryButtonTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      textStyle: TextStyle.lerp(textStyle, other.textStyle, t)!,
      borderWidth: t < 0.5 ? borderWidth : other.borderWidth,
      borderGradient: t < 0.5 ? borderGradient : other.borderGradient,
      borderRadius: t < 0.5 ? borderRadius : other.borderRadius,
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
                .equals(borderWidth, other.borderWidth) &&
            const DeepCollectionEquality()
                .equals(borderGradient, other.borderGradient) &&
            const DeepCollectionEquality()
                .equals(borderRadius, other.borderRadius));
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        const DeepCollectionEquality().hash(backgroundColor),
        const DeepCollectionEquality().hash(textStyle),
        const DeepCollectionEquality().hash(borderWidth),
        const DeepCollectionEquality().hash(borderGradient),
        const DeepCollectionEquality().hash(borderRadius));
  }
}
