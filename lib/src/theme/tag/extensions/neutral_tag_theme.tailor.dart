// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'neutral_tag_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class NeutralTagTheme extends ThemeExtension<NeutralTagTheme> {
  const NeutralTagTheme({
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

  static final NeutralTagTheme consumerLight = NeutralTagTheme(
    backgroundColor: _$NeutralTagTheme.backgroundColor[0],
    disabledBackgroundColor: _$NeutralTagTheme.disabledBackgroundColor[0],
    disabledTextStyle: _$NeutralTagTheme.disabledTextStyle[0],
    strongBackgroundColor: _$NeutralTagTheme.strongBackgroundColor[0],
    strongTextStyle: _$NeutralTagTheme.strongTextStyle[0],
    textStyle: _$NeutralTagTheme.textStyle[0],
  );

  static final NeutralTagTheme consumerDark = NeutralTagTheme(
    backgroundColor: _$NeutralTagTheme.backgroundColor[1],
    disabledBackgroundColor: _$NeutralTagTheme.disabledBackgroundColor[1],
    disabledTextStyle: _$NeutralTagTheme.disabledTextStyle[1],
    strongBackgroundColor: _$NeutralTagTheme.strongBackgroundColor[1],
    strongTextStyle: _$NeutralTagTheme.strongTextStyle[1],
    textStyle: _$NeutralTagTheme.textStyle[1],
  );

  static final NeutralTagTheme professionalLight = NeutralTagTheme(
    backgroundColor: _$NeutralTagTheme.backgroundColor[2],
    disabledBackgroundColor: _$NeutralTagTheme.disabledBackgroundColor[2],
    disabledTextStyle: _$NeutralTagTheme.disabledTextStyle[2],
    strongBackgroundColor: _$NeutralTagTheme.strongBackgroundColor[2],
    strongTextStyle: _$NeutralTagTheme.strongTextStyle[2],
    textStyle: _$NeutralTagTheme.textStyle[2],
  );

  static final NeutralTagTheme professionalDark = NeutralTagTheme(
    backgroundColor: _$NeutralTagTheme.backgroundColor[3],
    disabledBackgroundColor: _$NeutralTagTheme.disabledBackgroundColor[3],
    disabledTextStyle: _$NeutralTagTheme.disabledTextStyle[3],
    strongBackgroundColor: _$NeutralTagTheme.strongBackgroundColor[3],
    strongTextStyle: _$NeutralTagTheme.strongTextStyle[3],
    textStyle: _$NeutralTagTheme.textStyle[3],
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
    Color? disabledBackgroundColor,
    TextStyle? disabledTextStyle,
    Color? strongBackgroundColor,
    TextStyle? strongTextStyle,
    TextStyle? textStyle,
  }) {
    return NeutralTagTheme(
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
  NeutralTagTheme lerp(
      covariant ThemeExtension<NeutralTagTheme>? other, double t) {
    if (other is! NeutralTagTheme) return this as NeutralTagTheme;
    return NeutralTagTheme(
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
            other is NeutralTagTheme &&
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
