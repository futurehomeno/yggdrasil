// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'warning_tag_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class WarningTagTheme extends ThemeExtension<WarningTagTheme> {
  const WarningTagTheme({
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

  static final WarningTagTheme consumerLight = WarningTagTheme(
    backgroundColor: _$WarningTagTheme.backgroundColor[0],
    disabledBackgroundColor: _$WarningTagTheme.disabledBackgroundColor[0],
    disabledTextStyle: _$WarningTagTheme.disabledTextStyle[0],
    strongBackgroundColor: _$WarningTagTheme.strongBackgroundColor[0],
    strongTextStyle: _$WarningTagTheme.strongTextStyle[0],
    textStyle: _$WarningTagTheme.textStyle[0],
  );

  static final WarningTagTheme consumerDark = WarningTagTheme(
    backgroundColor: _$WarningTagTheme.backgroundColor[1],
    disabledBackgroundColor: _$WarningTagTheme.disabledBackgroundColor[1],
    disabledTextStyle: _$WarningTagTheme.disabledTextStyle[1],
    strongBackgroundColor: _$WarningTagTheme.strongBackgroundColor[1],
    strongTextStyle: _$WarningTagTheme.strongTextStyle[1],
    textStyle: _$WarningTagTheme.textStyle[1],
  );

  static final WarningTagTheme professionalLight = WarningTagTheme(
    backgroundColor: _$WarningTagTheme.backgroundColor[2],
    disabledBackgroundColor: _$WarningTagTheme.disabledBackgroundColor[2],
    disabledTextStyle: _$WarningTagTheme.disabledTextStyle[2],
    strongBackgroundColor: _$WarningTagTheme.strongBackgroundColor[2],
    strongTextStyle: _$WarningTagTheme.strongTextStyle[2],
    textStyle: _$WarningTagTheme.textStyle[2],
  );

  static final WarningTagTheme professionalDark = WarningTagTheme(
    backgroundColor: _$WarningTagTheme.backgroundColor[3],
    disabledBackgroundColor: _$WarningTagTheme.disabledBackgroundColor[3],
    disabledTextStyle: _$WarningTagTheme.disabledTextStyle[3],
    strongBackgroundColor: _$WarningTagTheme.strongBackgroundColor[3],
    strongTextStyle: _$WarningTagTheme.strongTextStyle[3],
    textStyle: _$WarningTagTheme.textStyle[3],
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
    Color? disabledBackgroundColor,
    TextStyle? disabledTextStyle,
    Color? strongBackgroundColor,
    TextStyle? strongTextStyle,
    TextStyle? textStyle,
  }) {
    return WarningTagTheme(
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
  WarningTagTheme lerp(
      covariant ThemeExtension<WarningTagTheme>? other, double t) {
    if (other is! WarningTagTheme) return this as WarningTagTheme;
    return WarningTagTheme(
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
            other is WarningTagTheme &&
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
