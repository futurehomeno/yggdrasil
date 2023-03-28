// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'link_button_theme.dart';

// **************************************************************************
// ThemeTailorGenerator
// **************************************************************************

class LinkButtonTheme extends ThemeExtension<LinkButtonTheme> {
  const LinkButtonTheme({
    required this.textColor,
  });

  final Color textColor;

  static final LinkButtonTheme consumerLight = LinkButtonTheme(
    textColor: _$LinkButtonTheme.textColor[0],
  );

  static final LinkButtonTheme consumerDark = LinkButtonTheme(
    textColor: _$LinkButtonTheme.textColor[1],
  );

  static final LinkButtonTheme professionalLight = LinkButtonTheme(
    textColor: _$LinkButtonTheme.textColor[2],
  );

  static final LinkButtonTheme professionalDark = LinkButtonTheme(
    textColor: _$LinkButtonTheme.textColor[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  LinkButtonTheme copyWith({
    Color? textColor,
  }) {
    return LinkButtonTheme(
      textColor: textColor ?? this.textColor,
    );
  }

  @override
  LinkButtonTheme lerp(ThemeExtension<LinkButtonTheme>? other, double t) {
    if (other is! LinkButtonTheme) return this;
    return LinkButtonTheme(
      textColor: Color.lerp(textColor, other.textColor, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LinkButtonTheme &&
            const DeepCollectionEquality().equals(textColor, other.textColor));
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType, const DeepCollectionEquality().hash(textColor));
  }
}
