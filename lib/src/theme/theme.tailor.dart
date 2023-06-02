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
    required this.dialogTheme,
  });

  final YgTokens tokens;
  final YgButtonThemes buttonThemes;
  final YgBottomSheetThemes bottomSheetTheme;
  final YgDialogThemes dialogTheme;

  static final YgTheme consumerLight = YgTheme(
    tokens: _$YgTheme.tokens[0],
    buttonThemes: _$YgTheme.buttonThemes[0],
    bottomSheetTheme: _$YgTheme.bottomSheetTheme[0],
    dialogTheme: _$YgTheme.dialogTheme[0],
  );

  static final YgTheme consumerDark = YgTheme(
    tokens: _$YgTheme.tokens[1],
    buttonThemes: _$YgTheme.buttonThemes[1],
    bottomSheetTheme: _$YgTheme.bottomSheetTheme[1],
    dialogTheme: _$YgTheme.dialogTheme[1],
  );

  static final YgTheme professionalLight = YgTheme(
    tokens: _$YgTheme.tokens[2],
    buttonThemes: _$YgTheme.buttonThemes[2],
    bottomSheetTheme: _$YgTheme.bottomSheetTheme[2],
    dialogTheme: _$YgTheme.dialogTheme[2],
  );

  static final YgTheme professionalDark = YgTheme(
    tokens: _$YgTheme.tokens[3],
    buttonThemes: _$YgTheme.buttonThemes[3],
    bottomSheetTheme: _$YgTheme.bottomSheetTheme[3],
    dialogTheme: _$YgTheme.dialogTheme[3],
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
    YgDialogThemes? dialogTheme,
  }) {
    return YgTheme(
      tokens: tokens ?? this.tokens,
      buttonThemes: buttonThemes ?? this.buttonThemes,
      bottomSheetTheme: bottomSheetTheme ?? this.bottomSheetTheme,
      dialogTheme: dialogTheme ?? this.dialogTheme,
    );
  }

  @override
  YgTheme lerp(ThemeExtension<YgTheme>? other, double t) {
    if (other is! YgTheme) return this;
    return YgTheme(
      tokens: tokens.lerp(other.tokens, t),
      buttonThemes: buttonThemes.lerp(other.buttonThemes, t),
      bottomSheetTheme: bottomSheetTheme.lerp(other.bottomSheetTheme, t),
      dialogTheme: dialogTheme.lerp(other.dialogTheme, t),
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
                .equals(dialogTheme, other.dialogTheme));
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        const DeepCollectionEquality().hash(tokens),
        const DeepCollectionEquality().hash(buttonThemes),
        const DeepCollectionEquality().hash(bottomSheetTheme),
        const DeepCollectionEquality().hash(dialogTheme));
  }
}

extension YgThemeBuildContextProps on BuildContext {
  YgTheme get _ygTheme => Theme.of(this).extension<YgTheme>()!;
  YgTokens get tokens => _ygTheme.tokens;
  YgButtonThemes get buttonThemes => _ygTheme.buttonThemes;
  YgBottomSheetThemes get bottomSheetTheme => _ygTheme.bottomSheetTheme;
  YgDialogThemes get dialogTheme => _ygTheme.dialogTheme;
}
