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
    required this.badgeTheme,
    required this.dotIndicatorTheme,
    required this.dialogTheme,
    required this.internalTheme,
  });

  final YgTokens tokens;
  final YgButtonThemes buttonThemes;
  final YgBottomSheetThemes bottomSheetTheme;
  final YgBadgeTheme badgeTheme;
  final YgDotIndicatorTheme dotIndicatorTheme;
  final YgDialogThemes dialogTheme;
  final YgInternalTheme internalTheme;

  static final YgTheme consumerLight = YgTheme(
    tokens: _$YgTheme.tokens[0],
    buttonThemes: _$YgTheme.buttonThemes[0],
    bottomSheetTheme: _$YgTheme.bottomSheetTheme[0],
    badgeTheme: _$YgTheme.badgeTheme[0],
    dotIndicatorTheme: _$YgTheme.dotIndicatorTheme[0],
    dialogTheme: _$YgTheme.dialogTheme[0],
    internalTheme: _$YgTheme.internalTheme[0],
  );

  static final YgTheme consumerDark = YgTheme(
    tokens: _$YgTheme.tokens[1],
    buttonThemes: _$YgTheme.buttonThemes[1],
    bottomSheetTheme: _$YgTheme.bottomSheetTheme[1],
    badgeTheme: _$YgTheme.badgeTheme[1],
    dotIndicatorTheme: _$YgTheme.dotIndicatorTheme[1],
    dialogTheme: _$YgTheme.dialogTheme[1],
    internalTheme: _$YgTheme.internalTheme[1],
  );

  static final YgTheme professionalLight = YgTheme(
    tokens: _$YgTheme.tokens[2],
    buttonThemes: _$YgTheme.buttonThemes[2],
    bottomSheetTheme: _$YgTheme.bottomSheetTheme[2],
    badgeTheme: _$YgTheme.badgeTheme[2],
    dotIndicatorTheme: _$YgTheme.dotIndicatorTheme[2],
    dialogTheme: _$YgTheme.dialogTheme[2],
    internalTheme: _$YgTheme.internalTheme[2],
  );

  static final YgTheme professionalDark = YgTheme(
    tokens: _$YgTheme.tokens[3],
    buttonThemes: _$YgTheme.buttonThemes[3],
    bottomSheetTheme: _$YgTheme.bottomSheetTheme[3],
    badgeTheme: _$YgTheme.badgeTheme[3],
    dotIndicatorTheme: _$YgTheme.dotIndicatorTheme[3],
    dialogTheme: _$YgTheme.dialogTheme[3],
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
    YgBadgeTheme? badgeTheme,
    YgDotIndicatorTheme? dotIndicatorTheme,
    YgDialogThemes? dialogTheme,
    YgInternalTheme? internalTheme,
  }) {
    return YgTheme(
      tokens: tokens ?? this.tokens,
      buttonThemes: buttonThemes ?? this.buttonThemes,
      bottomSheetTheme: bottomSheetTheme ?? this.bottomSheetTheme,
      badgeTheme: badgeTheme ?? this.badgeTheme,
      dotIndicatorTheme: dotIndicatorTheme ?? this.dotIndicatorTheme,
      dialogTheme: dialogTheme ?? this.dialogTheme,
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
      badgeTheme: badgeTheme.lerp(other.badgeTheme, t),
      dotIndicatorTheme: dotIndicatorTheme.lerp(other.dotIndicatorTheme, t),
      dialogTheme: dialogTheme.lerp(other.dialogTheme, t),
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
                .equals(badgeTheme, other.badgeTheme) &&
            const DeepCollectionEquality()
                .equals(dotIndicatorTheme, other.dotIndicatorTheme) &&
            const DeepCollectionEquality()
                .equals(dialogTheme, other.dialogTheme) &&
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
        const DeepCollectionEquality().hash(badgeTheme),
        const DeepCollectionEquality().hash(dotIndicatorTheme),
        const DeepCollectionEquality().hash(dialogTheme),
        const DeepCollectionEquality().hash(internalTheme));
  }
}

extension YgThemeBuildContextProps on BuildContext {
  YgTheme get _ygTheme => Theme.of(this).extension<YgTheme>()!;
  YgTokens get tokens => _ygTheme.tokens;
  YgButtonThemes get buttonThemes => _ygTheme.buttonThemes;
  YgBottomSheetThemes get bottomSheetTheme => _ygTheme.bottomSheetTheme;
  YgBadgeTheme get badgeTheme => _ygTheme.badgeTheme;
  YgDotIndicatorTheme get dotIndicatorTheme => _ygTheme.dotIndicatorTheme;
  YgDialogThemes get dialogTheme => _ygTheme.dialogTheme;
  YgInternalTheme get internalTheme => _ygTheme.internalTheme;
}
