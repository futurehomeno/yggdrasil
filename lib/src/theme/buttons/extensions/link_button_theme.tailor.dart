// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'link_button_theme.dart';

// **************************************************************************
// ThemeTailorGenerator
// **************************************************************************

class LinkButtonTheme extends ThemeExtension<LinkButtonTheme> {
  const LinkButtonTheme({
    required this.backgroundColor,
    required this.textStyle,
    required this.disabledTextStyle,
    required this.borderGradient,
    required this.disabledBorderGradient,
  });

  final Color backgroundColor;
  final TextStyle textStyle;
  final TextStyle disabledTextStyle;
  final LinearGradient borderGradient;
  final LinearGradient disabledBorderGradient;

  static final LinkButtonTheme consumerLight = LinkButtonTheme(
    backgroundColor: _$LinkButtonTheme.backgroundColor[0],
    textStyle: _$LinkButtonTheme.textStyle[0],
    disabledTextStyle: _$LinkButtonTheme.disabledTextStyle[0],
    borderGradient: _$LinkButtonTheme.borderGradient[0],
    disabledBorderGradient: _$LinkButtonTheme.disabledBorderGradient[0],
  );

  static final LinkButtonTheme consumerDark = LinkButtonTheme(
    backgroundColor: _$LinkButtonTheme.backgroundColor[1],
    textStyle: _$LinkButtonTheme.textStyle[1],
    disabledTextStyle: _$LinkButtonTheme.disabledTextStyle[1],
    borderGradient: _$LinkButtonTheme.borderGradient[1],
    disabledBorderGradient: _$LinkButtonTheme.disabledBorderGradient[1],
  );

  static final LinkButtonTheme professionalLight = LinkButtonTheme(
    backgroundColor: _$LinkButtonTheme.backgroundColor[2],
    textStyle: _$LinkButtonTheme.textStyle[2],
    disabledTextStyle: _$LinkButtonTheme.disabledTextStyle[2],
    borderGradient: _$LinkButtonTheme.borderGradient[2],
    disabledBorderGradient: _$LinkButtonTheme.disabledBorderGradient[2],
  );

  static final LinkButtonTheme professionalDark = LinkButtonTheme(
    backgroundColor: _$LinkButtonTheme.backgroundColor[3],
    textStyle: _$LinkButtonTheme.textStyle[3],
    disabledTextStyle: _$LinkButtonTheme.disabledTextStyle[3],
    borderGradient: _$LinkButtonTheme.borderGradient[3],
    disabledBorderGradient: _$LinkButtonTheme.disabledBorderGradient[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  LinkButtonTheme copyWith({
    Color? backgroundColor,
    TextStyle? textStyle,
    TextStyle? disabledTextStyle,
    LinearGradient? borderGradient,
    LinearGradient? disabledBorderGradient,
  }) {
    return LinkButtonTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      textStyle: textStyle ?? this.textStyle,
      disabledTextStyle: disabledTextStyle ?? this.disabledTextStyle,
      borderGradient: borderGradient ?? this.borderGradient,
      disabledBorderGradient:
          disabledBorderGradient ?? this.disabledBorderGradient,
    );
  }

  @override
  LinkButtonTheme lerp(ThemeExtension<LinkButtonTheme>? other, double t) {
    if (other is! LinkButtonTheme) return this;
    return LinkButtonTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      textStyle: TextStyle.lerp(textStyle, other.textStyle, t)!,
      disabledTextStyle:
          TextStyle.lerp(disabledTextStyle, other.disabledTextStyle, t)!,
      borderGradient: t < 0.5 ? borderGradient : other.borderGradient,
      disabledBorderGradient:
          t < 0.5 ? disabledBorderGradient : other.disabledBorderGradient,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LinkButtonTheme &&
            const DeepCollectionEquality()
                .equals(backgroundColor, other.backgroundColor) &&
            const DeepCollectionEquality().equals(textStyle, other.textStyle) &&
            const DeepCollectionEquality()
                .equals(disabledTextStyle, other.disabledTextStyle) &&
            const DeepCollectionEquality()
                .equals(borderGradient, other.borderGradient) &&
            const DeepCollectionEquality()
                .equals(disabledBorderGradient, other.disabledBorderGradient));
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        const DeepCollectionEquality().hash(backgroundColor),
        const DeepCollectionEquality().hash(textStyle),
        const DeepCollectionEquality().hash(disabledTextStyle),
        const DeepCollectionEquality().hash(borderGradient),
        const DeepCollectionEquality().hash(disabledBorderGradient));
  }
}
