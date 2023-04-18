// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'warning_tag_theme.dart';

// **************************************************************************
// ThemeTailorGenerator
// **************************************************************************

class WarningTagTheme extends ThemeExtension<WarningTagTheme> {
  const WarningTagTheme({
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

  static final WarningTagTheme consumerLight = WarningTagTheme(
    backgroundColor: _$WarningTagTheme.backgroundColor[0],
    strongBackgroundColor: _$WarningTagTheme.strongBackgroundColor[0],
    disabledBackgroundColor: _$WarningTagTheme.disabledBackgroundColor[0],
    textStyle: _$WarningTagTheme.textStyle[0],
    strongTextStyle: _$WarningTagTheme.strongTextStyle[0],
    disabledTextStyle: _$WarningTagTheme.disabledTextStyle[0],
  );

  static final WarningTagTheme consumerDark = WarningTagTheme(
    backgroundColor: _$WarningTagTheme.backgroundColor[1],
    strongBackgroundColor: _$WarningTagTheme.strongBackgroundColor[1],
    disabledBackgroundColor: _$WarningTagTheme.disabledBackgroundColor[1],
    textStyle: _$WarningTagTheme.textStyle[1],
    strongTextStyle: _$WarningTagTheme.strongTextStyle[1],
    disabledTextStyle: _$WarningTagTheme.disabledTextStyle[1],
  );

  static final WarningTagTheme professionalLight = WarningTagTheme(
    backgroundColor: _$WarningTagTheme.backgroundColor[2],
    strongBackgroundColor: _$WarningTagTheme.strongBackgroundColor[2],
    disabledBackgroundColor: _$WarningTagTheme.disabledBackgroundColor[2],
    textStyle: _$WarningTagTheme.textStyle[2],
    strongTextStyle: _$WarningTagTheme.strongTextStyle[2],
    disabledTextStyle: _$WarningTagTheme.disabledTextStyle[2],
  );

  static final WarningTagTheme professionalDark = WarningTagTheme(
    backgroundColor: _$WarningTagTheme.backgroundColor[3],
    strongBackgroundColor: _$WarningTagTheme.strongBackgroundColor[3],
    disabledBackgroundColor: _$WarningTagTheme.disabledBackgroundColor[3],
    textStyle: _$WarningTagTheme.textStyle[3],
    strongTextStyle: _$WarningTagTheme.strongTextStyle[3],
    disabledTextStyle: _$WarningTagTheme.disabledTextStyle[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  WarningTagTheme copyWith({
    Color? backgroundColor,
    Color? strongBackgroundColor,
    Color? disabledBackgroundColor,
    TextStyle? textStyle,
    TextStyle? strongTextStyle,
    TextStyle? disabledTextStyle,
  }) {
    return WarningTagTheme(
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
  WarningTagTheme lerp(ThemeExtension<WarningTagTheme>? other, double t) {
    if (other is! WarningTagTheme) return this;
    return WarningTagTheme(
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
            other is WarningTagTheme &&
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
