// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'theme.dart';

// **************************************************************************
// ThemeTailorGenerator
// **************************************************************************

class YgTheme extends ThemeExtension<YgTheme> {
  const YgTheme({
    required this.tokens,
    required this.buttonThemes,
  });

  final YgTokens tokens;
  final YgButtonThemes buttonThemes;

  static final YgTheme consumerLight = YgTheme(
    tokens: _$YgTheme.tokens[0],
    buttonThemes: _$YgTheme.buttonThemes[0],
  );

  static final YgTheme consumerDark = YgTheme(
    tokens: _$YgTheme.tokens[1],
    buttonThemes: _$YgTheme.buttonThemes[1],
  );

  static final YgTheme professionalLight = YgTheme(
    tokens: _$YgTheme.tokens[2],
    buttonThemes: _$YgTheme.buttonThemes[2],
  );

  static final YgTheme professionalDark = YgTheme(
    tokens: _$YgTheme.tokens[3],
    buttonThemes: _$YgTheme.buttonThemes[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgTheme copyWith({
    YgTokens? tokens,
    YgButtonThemes? buttonThemes,
  }) {
    return YgTheme(
      tokens: tokens ?? this.tokens,
      buttonThemes: buttonThemes ?? this.buttonThemes,
    );
  }

  @override
  YgTheme lerp(ThemeExtension<YgTheme>? other, double t) {
    if (other is! YgTheme) return this;
    return YgTheme(
      tokens: tokens.lerp(other.tokens, t),
      buttonThemes: buttonThemes.lerp(other.buttonThemes, t),
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgTheme &&
            const DeepCollectionEquality().equals(tokens, other.tokens) &&
            const DeepCollectionEquality()
                .equals(buttonThemes, other.buttonThemes));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, const DeepCollectionEquality().hash(tokens),
        const DeepCollectionEquality().hash(buttonThemes));
  }
}

extension YgThemeBuildContextProps on BuildContext {
  YgTheme get _ygTheme => Theme.of(this).extension<YgTheme>()!;
  YgTokens get tokens => _ygTheme.tokens;
  YgButtonThemes get buttonThemes => _ygTheme.buttonThemes;
}
