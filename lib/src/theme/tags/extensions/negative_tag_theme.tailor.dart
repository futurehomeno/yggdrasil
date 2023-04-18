// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'negative_tag_theme.dart';

// **************************************************************************
// ThemeTailorGenerator
// **************************************************************************

class NegativeTagTheme extends ThemeExtension<NegativeTagTheme> {
  const NegativeTagTheme({
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

  static final NegativeTagTheme consumerLight = NegativeTagTheme(
    backgroundColor: _$NegativeTagTheme.backgroundColor[0],
    strongBackgroundColor: _$NegativeTagTheme.strongBackgroundColor[0],
    disabledBackgroundColor: _$NegativeTagTheme.disabledBackgroundColor[0],
    textStyle: _$NegativeTagTheme.textStyle[0],
    strongTextStyle: _$NegativeTagTheme.strongTextStyle[0],
    disabledTextStyle: _$NegativeTagTheme.disabledTextStyle[0],
  );

  static final NegativeTagTheme consumerDark = NegativeTagTheme(
    backgroundColor: _$NegativeTagTheme.backgroundColor[1],
    strongBackgroundColor: _$NegativeTagTheme.strongBackgroundColor[1],
    disabledBackgroundColor: _$NegativeTagTheme.disabledBackgroundColor[1],
    textStyle: _$NegativeTagTheme.textStyle[1],
    strongTextStyle: _$NegativeTagTheme.strongTextStyle[1],
    disabledTextStyle: _$NegativeTagTheme.disabledTextStyle[1],
  );

  static final NegativeTagTheme professionalLight = NegativeTagTheme(
    backgroundColor: _$NegativeTagTheme.backgroundColor[2],
    strongBackgroundColor: _$NegativeTagTheme.strongBackgroundColor[2],
    disabledBackgroundColor: _$NegativeTagTheme.disabledBackgroundColor[2],
    textStyle: _$NegativeTagTheme.textStyle[2],
    strongTextStyle: _$NegativeTagTheme.strongTextStyle[2],
    disabledTextStyle: _$NegativeTagTheme.disabledTextStyle[2],
  );

  static final NegativeTagTheme professionalDark = NegativeTagTheme(
    backgroundColor: _$NegativeTagTheme.backgroundColor[3],
    strongBackgroundColor: _$NegativeTagTheme.strongBackgroundColor[3],
    disabledBackgroundColor: _$NegativeTagTheme.disabledBackgroundColor[3],
    textStyle: _$NegativeTagTheme.textStyle[3],
    strongTextStyle: _$NegativeTagTheme.strongTextStyle[3],
    disabledTextStyle: _$NegativeTagTheme.disabledTextStyle[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  NegativeTagTheme copyWith({
    Color? backgroundColor,
    Color? strongBackgroundColor,
    Color? disabledBackgroundColor,
    TextStyle? textStyle,
    TextStyle? strongTextStyle,
    TextStyle? disabledTextStyle,
  }) {
    return NegativeTagTheme(
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
  NegativeTagTheme lerp(ThemeExtension<NegativeTagTheme>? other, double t) {
    if (other is! NegativeTagTheme) return this;
    return NegativeTagTheme(
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
            other is NegativeTagTheme &&
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
