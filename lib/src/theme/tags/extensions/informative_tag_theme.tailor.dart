// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'informative_tag_theme.dart';

// **************************************************************************
// ThemeTailorGenerator
// **************************************************************************

class InformativeTagTheme extends ThemeExtension<InformativeTagTheme> {
  const InformativeTagTheme({
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

  static final InformativeTagTheme consumerLight = InformativeTagTheme(
    backgroundColor: _$InformativeTagTheme.backgroundColor[0],
    strongBackgroundColor: _$InformativeTagTheme.strongBackgroundColor[0],
    disabledBackgroundColor: _$InformativeTagTheme.disabledBackgroundColor[0],
    textStyle: _$InformativeTagTheme.textStyle[0],
    strongTextStyle: _$InformativeTagTheme.strongTextStyle[0],
    disabledTextStyle: _$InformativeTagTheme.disabledTextStyle[0],
  );

  static final InformativeTagTheme consumerDark = InformativeTagTheme(
    backgroundColor: _$InformativeTagTheme.backgroundColor[1],
    strongBackgroundColor: _$InformativeTagTheme.strongBackgroundColor[1],
    disabledBackgroundColor: _$InformativeTagTheme.disabledBackgroundColor[1],
    textStyle: _$InformativeTagTheme.textStyle[1],
    strongTextStyle: _$InformativeTagTheme.strongTextStyle[1],
    disabledTextStyle: _$InformativeTagTheme.disabledTextStyle[1],
  );

  static final InformativeTagTheme professionalLight = InformativeTagTheme(
    backgroundColor: _$InformativeTagTheme.backgroundColor[2],
    strongBackgroundColor: _$InformativeTagTheme.strongBackgroundColor[2],
    disabledBackgroundColor: _$InformativeTagTheme.disabledBackgroundColor[2],
    textStyle: _$InformativeTagTheme.textStyle[2],
    strongTextStyle: _$InformativeTagTheme.strongTextStyle[2],
    disabledTextStyle: _$InformativeTagTheme.disabledTextStyle[2],
  );

  static final InformativeTagTheme professionalDark = InformativeTagTheme(
    backgroundColor: _$InformativeTagTheme.backgroundColor[3],
    strongBackgroundColor: _$InformativeTagTheme.strongBackgroundColor[3],
    disabledBackgroundColor: _$InformativeTagTheme.disabledBackgroundColor[3],
    textStyle: _$InformativeTagTheme.textStyle[3],
    strongTextStyle: _$InformativeTagTheme.strongTextStyle[3],
    disabledTextStyle: _$InformativeTagTheme.disabledTextStyle[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  InformativeTagTheme copyWith({
    Color? backgroundColor,
    Color? strongBackgroundColor,
    Color? disabledBackgroundColor,
    TextStyle? textStyle,
    TextStyle? strongTextStyle,
    TextStyle? disabledTextStyle,
  }) {
    return InformativeTagTheme(
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
  InformativeTagTheme lerp(
      ThemeExtension<InformativeTagTheme>? other, double t) {
    if (other is! InformativeTagTheme) return this;
    return InformativeTagTheme(
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
            other is InformativeTagTheme &&
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
