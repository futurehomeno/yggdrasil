// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'informative_tag_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class InformativeTagTheme extends ThemeExtension<InformativeTagTheme> {
  const InformativeTagTheme({
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

  static final InformativeTagTheme consumerLight = InformativeTagTheme(
    backgroundColor: _$InformativeTagTheme.backgroundColor[0],
    disabledBackgroundColor: _$InformativeTagTheme.disabledBackgroundColor[0],
    disabledTextStyle: _$InformativeTagTheme.disabledTextStyle[0],
    strongBackgroundColor: _$InformativeTagTheme.strongBackgroundColor[0],
    strongTextStyle: _$InformativeTagTheme.strongTextStyle[0],
    textStyle: _$InformativeTagTheme.textStyle[0],
  );

  static final InformativeTagTheme consumerDark = InformativeTagTheme(
    backgroundColor: _$InformativeTagTheme.backgroundColor[1],
    disabledBackgroundColor: _$InformativeTagTheme.disabledBackgroundColor[1],
    disabledTextStyle: _$InformativeTagTheme.disabledTextStyle[1],
    strongBackgroundColor: _$InformativeTagTheme.strongBackgroundColor[1],
    strongTextStyle: _$InformativeTagTheme.strongTextStyle[1],
    textStyle: _$InformativeTagTheme.textStyle[1],
  );

  static final InformativeTagTheme professionalLight = InformativeTagTheme(
    backgroundColor: _$InformativeTagTheme.backgroundColor[2],
    disabledBackgroundColor: _$InformativeTagTheme.disabledBackgroundColor[2],
    disabledTextStyle: _$InformativeTagTheme.disabledTextStyle[2],
    strongBackgroundColor: _$InformativeTagTheme.strongBackgroundColor[2],
    strongTextStyle: _$InformativeTagTheme.strongTextStyle[2],
    textStyle: _$InformativeTagTheme.textStyle[2],
  );

  static final InformativeTagTheme professionalDark = InformativeTagTheme(
    backgroundColor: _$InformativeTagTheme.backgroundColor[3],
    disabledBackgroundColor: _$InformativeTagTheme.disabledBackgroundColor[3],
    disabledTextStyle: _$InformativeTagTheme.disabledTextStyle[3],
    strongBackgroundColor: _$InformativeTagTheme.strongBackgroundColor[3],
    strongTextStyle: _$InformativeTagTheme.strongTextStyle[3],
    textStyle: _$InformativeTagTheme.textStyle[3],
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
    Color? disabledBackgroundColor,
    TextStyle? disabledTextStyle,
    Color? strongBackgroundColor,
    TextStyle? strongTextStyle,
    TextStyle? textStyle,
  }) {
    return InformativeTagTheme(
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
  InformativeTagTheme lerp(
      covariant ThemeExtension<InformativeTagTheme>? other, double t) {
    if (other is! InformativeTagTheme) return this as InformativeTagTheme;
    return InformativeTagTheme(
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
            other is InformativeTagTheme &&
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
