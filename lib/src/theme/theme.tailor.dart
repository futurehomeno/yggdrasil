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
    required this.badgeTheme,
    required this.bottomSheetTheme,
    required this.buttonThemes,
    required this.dialogTheme,
    required this.tagThemes,
    required this.internalTheme,
  });

  final YgTokens tokens;
  final YgBadgeTheme badgeTheme;
  final YgBottomSheetThemes bottomSheetTheme;
  final YgButtonThemes buttonThemes;
  final YgDialogThemes dialogTheme;
  final YgTagThemes tagThemes;
  final YgInternalTheme internalTheme;

  static final YgTheme consumerLight = YgTheme(
    tokens: _$YgTheme.tokens[0],
    badgeTheme: _$YgTheme.badgeTheme[0],
    bottomSheetTheme: _$YgTheme.bottomSheetTheme[0],
    buttonThemes: _$YgTheme.buttonThemes[0],
    dialogTheme: _$YgTheme.dialogTheme[0],
    tagThemes: _$YgTheme.tagThemes[0],
    internalTheme: _$YgTheme.internalTheme[0],
  );

  static final YgTheme consumerDark = YgTheme(
    tokens: _$YgTheme.tokens[1],
    badgeTheme: _$YgTheme.badgeTheme[1],
    bottomSheetTheme: _$YgTheme.bottomSheetTheme[1],
    buttonThemes: _$YgTheme.buttonThemes[1],
    dialogTheme: _$YgTheme.dialogTheme[1],
    tagThemes: _$YgTheme.tagThemes[1],
    internalTheme: _$YgTheme.internalTheme[1],
  );

  static final YgTheme professionalLight = YgTheme(
    tokens: _$YgTheme.tokens[2],
    badgeTheme: _$YgTheme.badgeTheme[2],
    bottomSheetTheme: _$YgTheme.bottomSheetTheme[2],
    buttonThemes: _$YgTheme.buttonThemes[2],
    dialogTheme: _$YgTheme.dialogTheme[2],
    tagThemes: _$YgTheme.tagThemes[2],
    internalTheme: _$YgTheme.internalTheme[2],
  );

  static final YgTheme professionalDark = YgTheme(
    tokens: _$YgTheme.tokens[3],
    badgeTheme: _$YgTheme.badgeTheme[3],
    bottomSheetTheme: _$YgTheme.bottomSheetTheme[3],
    buttonThemes: _$YgTheme.buttonThemes[3],
    dialogTheme: _$YgTheme.dialogTheme[3],
    tagThemes: _$YgTheme.tagThemes[3],
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
    YgBadgeTheme? badgeTheme,
    YgBottomSheetThemes? bottomSheetTheme,
    YgButtonThemes? buttonThemes,
    YgDialogThemes? dialogTheme,
    YgTagThemes? tagThemes,
    YgInternalTheme? internalTheme,
  }) {
    return YgTheme(
      tokens: tokens ?? this.tokens,
      badgeTheme: badgeTheme ?? this.badgeTheme,
      bottomSheetTheme: bottomSheetTheme ?? this.bottomSheetTheme,
      buttonThemes: buttonThemes ?? this.buttonThemes,
      dialogTheme: dialogTheme ?? this.dialogTheme,
      tagThemes: tagThemes ?? this.tagThemes,
      internalTheme: internalTheme ?? this.internalTheme,
    );
  }

  @override
  YgTheme lerp(ThemeExtension<YgTheme>? other, double t) {
    if (other is! YgTheme) return this;
    return YgTheme(
      tokens: tokens.lerp(other.tokens, t),
      badgeTheme: badgeTheme.lerp(other.badgeTheme, t),
      bottomSheetTheme: bottomSheetTheme.lerp(other.bottomSheetTheme, t),
      buttonThemes: buttonThemes.lerp(other.buttonThemes, t),
      dialogTheme: dialogTheme.lerp(other.dialogTheme, t),
      tagThemes: tagThemes.lerp(other.tagThemes, t),
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
                .equals(badgeTheme, other.badgeTheme) &&
            const DeepCollectionEquality()
                .equals(bottomSheetTheme, other.bottomSheetTheme) &&
            const DeepCollectionEquality()
                .equals(buttonThemes, other.buttonThemes) &&
            const DeepCollectionEquality()
                .equals(dialogTheme, other.dialogTheme) &&
            const DeepCollectionEquality().equals(tagThemes, other.tagThemes) &&
            const DeepCollectionEquality()
                .equals(internalTheme, other.internalTheme));
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        const DeepCollectionEquality().hash(tokens),
        const DeepCollectionEquality().hash(badgeTheme),
        const DeepCollectionEquality().hash(bottomSheetTheme),
        const DeepCollectionEquality().hash(buttonThemes),
        const DeepCollectionEquality().hash(dialogTheme),
        const DeepCollectionEquality().hash(tagThemes),
        const DeepCollectionEquality().hash(internalTheme));
  }
}

extension YgThemeBuildContextProps on BuildContext {
  YgTheme get _ygTheme => Theme.of(this).extension<YgTheme>()!;
  YgTokens get tokens => _ygTheme.tokens;
  YgBadgeTheme get badgeTheme => _ygTheme.badgeTheme;
  YgBottomSheetThemes get bottomSheetTheme => _ygTheme.bottomSheetTheme;
  YgButtonThemes get buttonThemes => _ygTheme.buttonThemes;
  YgDialogThemes get dialogTheme => _ygTheme.dialogTheme;
  YgTagThemes get tagThemes => _ygTheme.tagThemes;
  YgInternalTheme get internalTheme => _ygTheme.internalTheme;
}
