// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgTheme extends ThemeExtension<YgTheme> {
  const YgTheme({
    required this.badgeTheme,
    required this.bottomSheetTheme,
    required this.buttonThemes,
    required this.dialogTheme,
    required this.internalTheme,
    required this.tagThemes,
    required this.tokens,
  });

  final YgBadgeTheme badgeTheme;
  final YgBottomSheetThemes bottomSheetTheme;
  final YgButtonThemes buttonThemes;
  final YgDialogThemes dialogTheme;
  final YgInternalTheme internalTheme;
  final YgTagThemes tagThemes;
  final YgTokens tokens;

  static final YgTheme consumerLight = YgTheme(
    badgeTheme: _$YgTheme.badgeTheme[0],
    bottomSheetTheme: _$YgTheme.bottomSheetTheme[0],
    buttonThemes: _$YgTheme.buttonThemes[0],
    dialogTheme: _$YgTheme.dialogTheme[0],
    internalTheme: _$YgTheme.internalTheme[0],
    tagThemes: _$YgTheme.tagThemes[0],
    tokens: _$YgTheme.tokens[0],
  );

  static final YgTheme consumerDark = YgTheme(
    badgeTheme: _$YgTheme.badgeTheme[1],
    bottomSheetTheme: _$YgTheme.bottomSheetTheme[1],
    buttonThemes: _$YgTheme.buttonThemes[1],
    dialogTheme: _$YgTheme.dialogTheme[1],
    internalTheme: _$YgTheme.internalTheme[1],
    tagThemes: _$YgTheme.tagThemes[1],
    tokens: _$YgTheme.tokens[1],
  );

  static final YgTheme professionalLight = YgTheme(
    badgeTheme: _$YgTheme.badgeTheme[2],
    bottomSheetTheme: _$YgTheme.bottomSheetTheme[2],
    buttonThemes: _$YgTheme.buttonThemes[2],
    dialogTheme: _$YgTheme.dialogTheme[2],
    internalTheme: _$YgTheme.internalTheme[2],
    tagThemes: _$YgTheme.tagThemes[2],
    tokens: _$YgTheme.tokens[2],
  );

  static final YgTheme professionalDark = YgTheme(
    badgeTheme: _$YgTheme.badgeTheme[3],
    bottomSheetTheme: _$YgTheme.bottomSheetTheme[3],
    buttonThemes: _$YgTheme.buttonThemes[3],
    dialogTheme: _$YgTheme.dialogTheme[3],
    internalTheme: _$YgTheme.internalTheme[3],
    tagThemes: _$YgTheme.tagThemes[3],
    tokens: _$YgTheme.tokens[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgTheme copyWith({
    YgBadgeTheme? badgeTheme,
    YgBottomSheetThemes? bottomSheetTheme,
    YgButtonThemes? buttonThemes,
    YgDialogThemes? dialogTheme,
    YgInternalTheme? internalTheme,
    YgTagThemes? tagThemes,
    YgTokens? tokens,
  }) {
    return YgTheme(
      badgeTheme: badgeTheme ?? this.badgeTheme,
      bottomSheetTheme: bottomSheetTheme ?? this.bottomSheetTheme,
      buttonThemes: buttonThemes ?? this.buttonThemes,
      dialogTheme: dialogTheme ?? this.dialogTheme,
      internalTheme: internalTheme ?? this.internalTheme,
      tagThemes: tagThemes ?? this.tagThemes,
      tokens: tokens ?? this.tokens,
    );
  }

  @override
  YgTheme lerp(covariant ThemeExtension<YgTheme>? other, double t) {
    if (other is! YgTheme) return this as YgTheme;
    return YgTheme(
      badgeTheme: badgeTheme.lerp(other.badgeTheme, t) as YgBadgeTheme,
      bottomSheetTheme: bottomSheetTheme.lerp(other.bottomSheetTheme, t)
          as YgBottomSheetThemes,
      buttonThemes: buttonThemes.lerp(other.buttonThemes, t) as YgButtonThemes,
      dialogTheme: dialogTheme.lerp(other.dialogTheme, t) as YgDialogThemes,
      internalTheme:
          internalTheme.lerp(other.internalTheme, t) as YgInternalTheme,
      tagThemes: tagThemes.lerp(other.tagThemes, t) as YgTagThemes,
      tokens: tokens.lerp(other.tokens, t) as YgTokens,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgTheme &&
            const DeepCollectionEquality()
                .equals(badgeTheme, other.badgeTheme) &&
            const DeepCollectionEquality()
                .equals(bottomSheetTheme, other.bottomSheetTheme) &&
            const DeepCollectionEquality()
                .equals(buttonThemes, other.buttonThemes) &&
            const DeepCollectionEquality()
                .equals(dialogTheme, other.dialogTheme) &&
            const DeepCollectionEquality()
                .equals(internalTheme, other.internalTheme) &&
            const DeepCollectionEquality().equals(tagThemes, other.tagThemes) &&
            const DeepCollectionEquality().equals(tokens, other.tokens));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(badgeTheme),
      const DeepCollectionEquality().hash(bottomSheetTheme),
      const DeepCollectionEquality().hash(buttonThemes),
      const DeepCollectionEquality().hash(dialogTheme),
      const DeepCollectionEquality().hash(internalTheme),
      const DeepCollectionEquality().hash(tagThemes),
      const DeepCollectionEquality().hash(tokens),
    );
  }
}

extension YgThemeBuildContextProps on BuildContext {
  YgTheme get ygTheme => Theme.of(this).extension<YgTheme>()!;
  YgBadgeTheme get badgeTheme => ygTheme.badgeTheme;
  YgBottomSheetThemes get bottomSheetTheme => ygTheme.bottomSheetTheme;
  YgButtonThemes get buttonThemes => ygTheme.buttonThemes;
  YgDialogThemes get dialogTheme => ygTheme.dialogTheme;
  YgInternalTheme get internalTheme => ygTheme.internalTheme;
  YgTagThemes get tagThemes => ygTheme.tagThemes;
  YgTokens get tokens => ygTheme.tokens;
}
