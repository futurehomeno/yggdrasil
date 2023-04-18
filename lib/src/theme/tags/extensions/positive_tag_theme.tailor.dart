// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'positive_tag_theme.dart';

// **************************************************************************
// ThemeTailorGenerator
// **************************************************************************

class PositiveTagTheme extends ThemeExtension<PositiveTagTheme> {
  const PositiveTagTheme({
    required this.backgroundColor,
    required this.strongBackgroundColor,
    required this.disabledBackgroundColor,
    required this.textStyle,
    required this.strongTextStyle,
    required this.disabledTextStyle,
  });

  final Color backgroundColor;
  final Color strongBackgroundColor;
  final Color disabledBackgroundColor;
  final TextStyle textStyle;
  final TextStyle strongTextStyle;
  final TextStyle disabledTextStyle;

  static final PositiveTagTheme consumerLight = PositiveTagTheme(
    backgroundColor: _$PositiveTagTheme.backgroundColor[0],
    strongBackgroundColor: _$PositiveTagTheme.strongBackgroundColor[0],
    disabledBackgroundColor: _$PositiveTagTheme.disabledBackgroundColor[0],
    textStyle: _$PositiveTagTheme.textStyle[0],
    strongTextStyle: _$PositiveTagTheme.strongTextStyle[0],
    disabledTextStyle: _$PositiveTagTheme.disabledTextStyle[0],
  );

  static final PositiveTagTheme consumerDark = PositiveTagTheme(
    backgroundColor: _$PositiveTagTheme.backgroundColor[1],
    strongBackgroundColor: _$PositiveTagTheme.strongBackgroundColor[1],
    disabledBackgroundColor: _$PositiveTagTheme.disabledBackgroundColor[1],
    textStyle: _$PositiveTagTheme.textStyle[1],
    strongTextStyle: _$PositiveTagTheme.strongTextStyle[1],
    disabledTextStyle: _$PositiveTagTheme.disabledTextStyle[1],
  );

  static final PositiveTagTheme professionalLight = PositiveTagTheme(
    backgroundColor: _$PositiveTagTheme.backgroundColor[2],
    strongBackgroundColor: _$PositiveTagTheme.strongBackgroundColor[2],
    disabledBackgroundColor: _$PositiveTagTheme.disabledBackgroundColor[2],
    textStyle: _$PositiveTagTheme.textStyle[2],
    strongTextStyle: _$PositiveTagTheme.strongTextStyle[2],
    disabledTextStyle: _$PositiveTagTheme.disabledTextStyle[2],
  );

  static final PositiveTagTheme professionalDark = PositiveTagTheme(
    backgroundColor: _$PositiveTagTheme.backgroundColor[3],
    strongBackgroundColor: _$PositiveTagTheme.strongBackgroundColor[3],
    disabledBackgroundColor: _$PositiveTagTheme.disabledBackgroundColor[3],
    textStyle: _$PositiveTagTheme.textStyle[3],
    strongTextStyle: _$PositiveTagTheme.strongTextStyle[3],
    disabledTextStyle: _$PositiveTagTheme.disabledTextStyle[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  PositiveTagTheme copyWith({
    Color? backgroundColor,
    Color? strongBackgroundColor,
    Color? disabledBackgroundColor,
    TextStyle? textStyle,
    TextStyle? strongTextStyle,
    TextStyle? disabledTextStyle,
  }) {
    return PositiveTagTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      strongBackgroundColor:
          strongBackgroundColor ?? this.strongBackgroundColor,
      disabledBackgroundColor:
          disabledBackgroundColor ?? this.disabledBackgroundColor,
      textStyle: textStyle ?? this.textStyle,
      strongTextStyle: strongTextStyle ?? this.strongTextStyle,
      disabledTextStyle: disabledTextStyle ?? this.disabledTextStyle,
    );
  }

  @override
  PositiveTagTheme lerp(ThemeExtension<PositiveTagTheme>? other, double t) {
    if (other is! PositiveTagTheme) return this;
    return PositiveTagTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      strongBackgroundColor:
          Color.lerp(strongBackgroundColor, other.strongBackgroundColor, t)!,
      disabledBackgroundColor: Color.lerp(
          disabledBackgroundColor, other.disabledBackgroundColor, t)!,
      textStyle: TextStyle.lerp(textStyle, other.textStyle, t)!,
      strongTextStyle:
          TextStyle.lerp(strongTextStyle, other.strongTextStyle, t)!,
      disabledTextStyle:
          TextStyle.lerp(disabledTextStyle, other.disabledTextStyle, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PositiveTagTheme &&
            const DeepCollectionEquality()
                .equals(backgroundColor, other.backgroundColor) &&
            const DeepCollectionEquality()
                .equals(strongBackgroundColor, other.strongBackgroundColor) &&
            const DeepCollectionEquality().equals(
                disabledBackgroundColor, other.disabledBackgroundColor) &&
            const DeepCollectionEquality().equals(textStyle, other.textStyle) &&
            const DeepCollectionEquality()
                .equals(strongTextStyle, other.strongTextStyle) &&
            const DeepCollectionEquality()
                .equals(disabledTextStyle, other.disabledTextStyle));
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        const DeepCollectionEquality().hash(backgroundColor),
        const DeepCollectionEquality().hash(strongBackgroundColor),
        const DeepCollectionEquality().hash(disabledBackgroundColor),
        const DeepCollectionEquality().hash(textStyle),
        const DeepCollectionEquality().hash(strongTextStyle),
        const DeepCollectionEquality().hash(disabledTextStyle));
  }
}
