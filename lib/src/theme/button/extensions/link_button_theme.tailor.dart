// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'link_button_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class LinkButtonTheme extends ThemeExtension<LinkButtonTheme> {
  const LinkButtonTheme({
    required this.backgroundColor,
    required this.borderGradient,
    required this.disabledBorderGradient,
    required this.disabledTextStyle,
    required this.textStyle,
  });

  final Color backgroundColor;
  final LinearGradient borderGradient;
  final LinearGradient disabledBorderGradient;
  final TextStyle disabledTextStyle;
  final TextStyle textStyle;

  static final LinkButtonTheme consumerLight = LinkButtonTheme(
    backgroundColor: _$LinkButtonTheme.backgroundColor[0],
    borderGradient: _$LinkButtonTheme.borderGradient[0],
    disabledBorderGradient: _$LinkButtonTheme.disabledBorderGradient[0],
    disabledTextStyle: _$LinkButtonTheme.disabledTextStyle[0],
    textStyle: _$LinkButtonTheme.textStyle[0],
  );

  static final LinkButtonTheme consumerDark = LinkButtonTheme(
    backgroundColor: _$LinkButtonTheme.backgroundColor[1],
    borderGradient: _$LinkButtonTheme.borderGradient[1],
    disabledBorderGradient: _$LinkButtonTheme.disabledBorderGradient[1],
    disabledTextStyle: _$LinkButtonTheme.disabledTextStyle[1],
    textStyle: _$LinkButtonTheme.textStyle[1],
  );

  static final LinkButtonTheme professionalLight = LinkButtonTheme(
    backgroundColor: _$LinkButtonTheme.backgroundColor[2],
    borderGradient: _$LinkButtonTheme.borderGradient[2],
    disabledBorderGradient: _$LinkButtonTheme.disabledBorderGradient[2],
    disabledTextStyle: _$LinkButtonTheme.disabledTextStyle[2],
    textStyle: _$LinkButtonTheme.textStyle[2],
  );

  static final LinkButtonTheme professionalDark = LinkButtonTheme(
    backgroundColor: _$LinkButtonTheme.backgroundColor[3],
    borderGradient: _$LinkButtonTheme.borderGradient[3],
    disabledBorderGradient: _$LinkButtonTheme.disabledBorderGradient[3],
    disabledTextStyle: _$LinkButtonTheme.disabledTextStyle[3],
    textStyle: _$LinkButtonTheme.textStyle[3],
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
    LinearGradient? borderGradient,
    LinearGradient? disabledBorderGradient,
    TextStyle? disabledTextStyle,
    TextStyle? textStyle,
  }) {
    return LinkButtonTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      borderGradient: borderGradient ?? this.borderGradient,
      disabledBorderGradient:
          disabledBorderGradient ?? this.disabledBorderGradient,
      disabledTextStyle: disabledTextStyle ?? this.disabledTextStyle,
      textStyle: textStyle ?? this.textStyle,
    );
  }

  @override
  LinkButtonTheme lerp(
      covariant ThemeExtension<LinkButtonTheme>? other, double t) {
    if (other is! LinkButtonTheme) return this as LinkButtonTheme;
    return LinkButtonTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      borderGradient: t < 0.5 ? borderGradient : other.borderGradient,
      disabledBorderGradient:
          t < 0.5 ? disabledBorderGradient : other.disabledBorderGradient,
      disabledTextStyle:
          TextStyle.lerp(disabledTextStyle, other.disabledTextStyle, t)!,
      textStyle: TextStyle.lerp(textStyle, other.textStyle, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LinkButtonTheme &&
            const DeepCollectionEquality()
                .equals(backgroundColor, other.backgroundColor) &&
            const DeepCollectionEquality()
                .equals(borderGradient, other.borderGradient) &&
            const DeepCollectionEquality()
                .equals(disabledBorderGradient, other.disabledBorderGradient) &&
            const DeepCollectionEquality()
                .equals(disabledTextStyle, other.disabledTextStyle) &&
            const DeepCollectionEquality().equals(textStyle, other.textStyle));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(backgroundColor),
      const DeepCollectionEquality().hash(borderGradient),
      const DeepCollectionEquality().hash(disabledBorderGradient),
      const DeepCollectionEquality().hash(disabledTextStyle),
      const DeepCollectionEquality().hash(textStyle),
    );
  }
}
