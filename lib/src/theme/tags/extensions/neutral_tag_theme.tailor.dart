// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'neutral_tag_theme.dart';

// **************************************************************************
// ThemeTailorGenerator
// **************************************************************************

class NeutralTagTheme extends ThemeExtension<NeutralTagTheme> {
  const NeutralTagTheme({
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

  static final NeutralTagTheme consumerLight = NeutralTagTheme(
    backgroundColor: _$NeutralTagTheme.backgroundColor[0],
    strongBackgroundColor: _$NeutralTagTheme.strongBackgroundColor[0],
    disabledBackgroundColor: _$NeutralTagTheme.disabledBackgroundColor[0],
    textStyle: _$NeutralTagTheme.textStyle[0],
    strongTextStyle: _$NeutralTagTheme.strongTextStyle[0],
    disabledTextStyle: _$NeutralTagTheme.disabledTextStyle[0],
  );

  static final NeutralTagTheme consumerDark = NeutralTagTheme(
    backgroundColor: _$NeutralTagTheme.backgroundColor[1],
    strongBackgroundColor: _$NeutralTagTheme.strongBackgroundColor[1],
    disabledBackgroundColor: _$NeutralTagTheme.disabledBackgroundColor[1],
    textStyle: _$NeutralTagTheme.textStyle[1],
    strongTextStyle: _$NeutralTagTheme.strongTextStyle[1],
    disabledTextStyle: _$NeutralTagTheme.disabledTextStyle[1],
  );

  static final NeutralTagTheme professionalLight = NeutralTagTheme(
    backgroundColor: _$NeutralTagTheme.backgroundColor[2],
    strongBackgroundColor: _$NeutralTagTheme.strongBackgroundColor[2],
    disabledBackgroundColor: _$NeutralTagTheme.disabledBackgroundColor[2],
    textStyle: _$NeutralTagTheme.textStyle[2],
    strongTextStyle: _$NeutralTagTheme.strongTextStyle[2],
    disabledTextStyle: _$NeutralTagTheme.disabledTextStyle[2],
  );

  static final NeutralTagTheme professionalDark = NeutralTagTheme(
    backgroundColor: _$NeutralTagTheme.backgroundColor[3],
    strongBackgroundColor: _$NeutralTagTheme.strongBackgroundColor[3],
    disabledBackgroundColor: _$NeutralTagTheme.disabledBackgroundColor[3],
    textStyle: _$NeutralTagTheme.textStyle[3],
    strongTextStyle: _$NeutralTagTheme.strongTextStyle[3],
    disabledTextStyle: _$NeutralTagTheme.disabledTextStyle[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  NeutralTagTheme copyWith({
    Color? backgroundColor,
    Color? strongBackgroundColor,
    Color? disabledBackgroundColor,
    TextStyle? textStyle,
    TextStyle? strongTextStyle,
    TextStyle? disabledTextStyle,
  }) {
    return NeutralTagTheme(
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
  NeutralTagTheme lerp(ThemeExtension<NeutralTagTheme>? other, double t) {
    if (other is! NeutralTagTheme) return this;
    return NeutralTagTheme(
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
            other is NeutralTagTheme &&
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
