// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'negative_tag_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class NegativeTagTheme extends ThemeExtension<NegativeTagTheme> {
  const NegativeTagTheme({
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

  static final NegativeTagTheme consumerLight = NegativeTagTheme(
    backgroundColor: _$NegativeTagTheme.backgroundColor[0],
    disabledBackgroundColor: _$NegativeTagTheme.disabledBackgroundColor[0],
    disabledTextStyle: _$NegativeTagTheme.disabledTextStyle[0],
    strongBackgroundColor: _$NegativeTagTheme.strongBackgroundColor[0],
    strongTextStyle: _$NegativeTagTheme.strongTextStyle[0],
    textStyle: _$NegativeTagTheme.textStyle[0],
  );

  static final NegativeTagTheme consumerDark = NegativeTagTheme(
    backgroundColor: _$NegativeTagTheme.backgroundColor[1],
    disabledBackgroundColor: _$NegativeTagTheme.disabledBackgroundColor[1],
    disabledTextStyle: _$NegativeTagTheme.disabledTextStyle[1],
    strongBackgroundColor: _$NegativeTagTheme.strongBackgroundColor[1],
    strongTextStyle: _$NegativeTagTheme.strongTextStyle[1],
    textStyle: _$NegativeTagTheme.textStyle[1],
  );

  static final NegativeTagTheme professionalLight = NegativeTagTheme(
    backgroundColor: _$NegativeTagTheme.backgroundColor[2],
    disabledBackgroundColor: _$NegativeTagTheme.disabledBackgroundColor[2],
    disabledTextStyle: _$NegativeTagTheme.disabledTextStyle[2],
    strongBackgroundColor: _$NegativeTagTheme.strongBackgroundColor[2],
    strongTextStyle: _$NegativeTagTheme.strongTextStyle[2],
    textStyle: _$NegativeTagTheme.textStyle[2],
  );

  static final NegativeTagTheme professionalDark = NegativeTagTheme(
    backgroundColor: _$NegativeTagTheme.backgroundColor[3],
    disabledBackgroundColor: _$NegativeTagTheme.disabledBackgroundColor[3],
    disabledTextStyle: _$NegativeTagTheme.disabledTextStyle[3],
    strongBackgroundColor: _$NegativeTagTheme.strongBackgroundColor[3],
    strongTextStyle: _$NegativeTagTheme.strongTextStyle[3],
    textStyle: _$NegativeTagTheme.textStyle[3],
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
    Color? disabledBackgroundColor,
    TextStyle? disabledTextStyle,
    Color? strongBackgroundColor,
    TextStyle? strongTextStyle,
    TextStyle? textStyle,
  }) {
    return NegativeTagTheme(
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
  NegativeTagTheme lerp(
      covariant ThemeExtension<NegativeTagTheme>? other, double t) {
    if (other is! NegativeTagTheme) return this as NegativeTagTheme;
    return NegativeTagTheme(
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
            other is NegativeTagTheme &&
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
