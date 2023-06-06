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
    required this.bottomSheetTheme,
    required this.internalTheme,
  });

  final YgTokens tokens;
  final YgButtonThemes buttonThemes;
  final YgBottomSheetThemes bottomSheetTheme;
  final YgInternalTheme internalTheme;

  static final YgTheme consumerLight = YgTheme(
    tokens: _$YgTheme.tokens[0],
    buttonThemes: _$YgTheme.buttonThemes[0],
    bottomSheetTheme: _$YgTheme.bottomSheetTheme[0],
    internalTheme: _$YgTheme.internalTheme[0],
  );

  static final YgTheme consumerDark = YgTheme(
    tokens: _$YgTheme.tokens[1],
    buttonThemes: _$YgTheme.buttonThemes[1],
    bottomSheetTheme: _$YgTheme.bottomSheetTheme[1],
    internalTheme: _$YgTheme.internalTheme[1],
  );

  static final YgTheme professionalLight = YgTheme(
    tokens: _$YgTheme.tokens[2],
    buttonThemes: _$YgTheme.buttonThemes[2],
    bottomSheetTheme: _$YgTheme.bottomSheetTheme[2],
    internalTheme: _$YgTheme.internalTheme[2],
  );

  static final YgTheme professionalDark = YgTheme(
    tokens: _$YgTheme.tokens[3],
    buttonThemes: _$YgTheme.buttonThemes[3],
    bottomSheetTheme: _$YgTheme.bottomSheetTheme[3],
    internalTheme: _$YgTheme.internalTheme[3],
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
    YgBottomSheetThemes? bottomSheetTheme,
    YgInternalTheme? internalTheme,
  }) {
    return YgTheme(
      tokens: tokens ?? this.tokens,
      buttonThemes: buttonThemes ?? this.buttonThemes,
      bottomSheetTheme: bottomSheetTheme ?? this.bottomSheetTheme,
      internalTheme: internalTheme ?? this.internalTheme,
    );
  }

  @override
  YgTheme lerp(ThemeExtension<YgTheme>? other, double t) {
    if (other is! YgTheme) return this;
    return YgTheme(
      tokens: tokens.lerp(other.tokens, t),
      buttonThemes: buttonThemes.lerp(other.buttonThemes, t),
      bottomSheetTheme: bottomSheetTheme.lerp(other.bottomSheetTheme, t),
      internalTheme: internalTheme.lerp(other.internalTheme, t),
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgTheme &&
            const DeepCollectionEquality().equals(tokens, other.tokens) &&
            const DeepCollectionEquality()
                .equals(buttonThemes, other.buttonThemes) &&
            const DeepCollectionEquality()
                .equals(bottomSheetTheme, other.bottomSheetTheme) &&
            const DeepCollectionEquality()
                .equals(internalTheme, other.internalTheme));
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        const DeepCollectionEquality().hash(tokens),
        const DeepCollectionEquality().hash(buttonThemes),
        const DeepCollectionEquality().hash(bottomSheetTheme),
        const DeepCollectionEquality().hash(internalTheme));
  }
}

extension YgThemeBuildContextProps on BuildContext {
  YgTheme get _ygTheme => Theme.of(this).extension<YgTheme>()!;
  YgTokens get tokens => _ygTheme.tokens;
  YgButtonThemes get buttonThemes => _ygTheme.buttonThemes;
  YgBottomSheetThemes get bottomSheetTheme => _ygTheme.bottomSheetTheme;
  YgInternalTheme get internalTheme => _ygTheme.internalTheme;
}
