// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'positive_tag_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class PositiveTagTheme extends ThemeExtension<PositiveTagTheme> {
  const PositiveTagTheme({
    required this.backgroundColor,
    required this.disabledBackgroundColor,
    required this.disabledTextStyle,
    required this.strongBackgroundColor,
    required this.strongTextStyle,
    required this.textStyle,
  });

  final Color backgroundColor;
  final Color disabledBackgroundColor;
  final TextStyle disabledTextStyle;
  final Color strongBackgroundColor;
  final TextStyle strongTextStyle;
  final TextStyle textStyle;

  static final PositiveTagTheme consumerLight = PositiveTagTheme(
    backgroundColor: _$PositiveTagTheme.backgroundColor[0],
    disabledBackgroundColor: _$PositiveTagTheme.disabledBackgroundColor[0],
    disabledTextStyle: _$PositiveTagTheme.disabledTextStyle[0],
    strongBackgroundColor: _$PositiveTagTheme.strongBackgroundColor[0],
    strongTextStyle: _$PositiveTagTheme.strongTextStyle[0],
    textStyle: _$PositiveTagTheme.textStyle[0],
  );

  static final PositiveTagTheme consumerDark = PositiveTagTheme(
    backgroundColor: _$PositiveTagTheme.backgroundColor[1],
    disabledBackgroundColor: _$PositiveTagTheme.disabledBackgroundColor[1],
    disabledTextStyle: _$PositiveTagTheme.disabledTextStyle[1],
    strongBackgroundColor: _$PositiveTagTheme.strongBackgroundColor[1],
    strongTextStyle: _$PositiveTagTheme.strongTextStyle[1],
    textStyle: _$PositiveTagTheme.textStyle[1],
  );

  static final PositiveTagTheme professionalLight = PositiveTagTheme(
    backgroundColor: _$PositiveTagTheme.backgroundColor[2],
    disabledBackgroundColor: _$PositiveTagTheme.disabledBackgroundColor[2],
    disabledTextStyle: _$PositiveTagTheme.disabledTextStyle[2],
    strongBackgroundColor: _$PositiveTagTheme.strongBackgroundColor[2],
    strongTextStyle: _$PositiveTagTheme.strongTextStyle[2],
    textStyle: _$PositiveTagTheme.textStyle[2],
  );

  static final PositiveTagTheme professionalDark = PositiveTagTheme(
    backgroundColor: _$PositiveTagTheme.backgroundColor[3],
    disabledBackgroundColor: _$PositiveTagTheme.disabledBackgroundColor[3],
    disabledTextStyle: _$PositiveTagTheme.disabledTextStyle[3],
    strongBackgroundColor: _$PositiveTagTheme.strongBackgroundColor[3],
    strongTextStyle: _$PositiveTagTheme.strongTextStyle[3],
    textStyle: _$PositiveTagTheme.textStyle[3],
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
    Color? disabledBackgroundColor,
    TextStyle? disabledTextStyle,
    Color? strongBackgroundColor,
    TextStyle? strongTextStyle,
    TextStyle? textStyle,
  }) {
    return PositiveTagTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      disabledBackgroundColor:
          disabledBackgroundColor ?? this.disabledBackgroundColor,
      disabledTextStyle: disabledTextStyle ?? this.disabledTextStyle,
      strongBackgroundColor:
          strongBackgroundColor ?? this.strongBackgroundColor,
      strongTextStyle: strongTextStyle ?? this.strongTextStyle,
      textStyle: textStyle ?? this.textStyle,
    );
  }

  @override
  PositiveTagTheme lerp(
      covariant ThemeExtension<PositiveTagTheme>? other, double t) {
    if (other is! PositiveTagTheme) return this as PositiveTagTheme;
    return PositiveTagTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      disabledBackgroundColor: Color.lerp(
          disabledBackgroundColor, other.disabledBackgroundColor, t)!,
      disabledTextStyle:
          TextStyle.lerp(disabledTextStyle, other.disabledTextStyle, t)!,
      strongBackgroundColor:
          Color.lerp(strongBackgroundColor, other.strongBackgroundColor, t)!,
      strongTextStyle:
          TextStyle.lerp(strongTextStyle, other.strongTextStyle, t)!,
      textStyle: TextStyle.lerp(textStyle, other.textStyle, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PositiveTagTheme &&
            const DeepCollectionEquality()
                .equals(backgroundColor, other.backgroundColor) &&
            const DeepCollectionEquality().equals(
                disabledBackgroundColor, other.disabledBackgroundColor) &&
            const DeepCollectionEquality()
                .equals(disabledTextStyle, other.disabledTextStyle) &&
            const DeepCollectionEquality()
                .equals(strongBackgroundColor, other.strongBackgroundColor) &&
            const DeepCollectionEquality()
                .equals(strongTextStyle, other.strongTextStyle) &&
            const DeepCollectionEquality().equals(textStyle, other.textStyle));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(backgroundColor),
      const DeepCollectionEquality().hash(disabledBackgroundColor),
      const DeepCollectionEquality().hash(disabledTextStyle),
      const DeepCollectionEquality().hash(strongBackgroundColor),
      const DeepCollectionEquality().hash(strongTextStyle),
      const DeepCollectionEquality().hash(textStyle),
    );
  }
}
