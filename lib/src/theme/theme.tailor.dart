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
    required this.calloutThemes,
    required this.dialogTheme,
    required this.internalTheme,
    required this.snackbarTheme,
    required this.textLinkTheme,
    required this.tokens,
  });

  final YgBadgeTheme badgeTheme;
  final YgBottomSheetThemes bottomSheetTheme;
  final YgButtonThemes buttonThemes;
  final YgCalloutThemes calloutThemes;
  final YgDialogThemes dialogTheme;
  final YgInternalTheme internalTheme;
  final YgSnackbarTheme snackbarTheme;
  final YgTextLinkTheme textLinkTheme;
  final YgTokens tokens;

  static final YgTheme consumerLight = YgTheme(
    badgeTheme: _$YgTheme.badgeTheme[0],
    bottomSheetTheme: _$YgTheme.bottomSheetTheme[0],
    buttonThemes: _$YgTheme.buttonThemes[0],
    calloutThemes: _$YgTheme.calloutThemes[0],
    dialogTheme: _$YgTheme.dialogTheme[0],
    internalTheme: _$YgTheme.internalTheme[0],
    snackbarTheme: _$YgTheme.snackbarTheme[0],
    textLinkTheme: _$YgTheme.textLinkTheme[0],
    tokens: _$YgTheme.tokens[0],
  );

  static final YgTheme consumerDark = YgTheme(
    badgeTheme: _$YgTheme.badgeTheme[1],
    bottomSheetTheme: _$YgTheme.bottomSheetTheme[1],
    buttonThemes: _$YgTheme.buttonThemes[1],
    calloutThemes: _$YgTheme.calloutThemes[1],
    dialogTheme: _$YgTheme.dialogTheme[1],
    internalTheme: _$YgTheme.internalTheme[1],
    snackbarTheme: _$YgTheme.snackbarTheme[1],
    textLinkTheme: _$YgTheme.textLinkTheme[1],
    tokens: _$YgTheme.tokens[1],
  );

  static final YgTheme professionalLight = YgTheme(
    badgeTheme: _$YgTheme.badgeTheme[2],
    bottomSheetTheme: _$YgTheme.bottomSheetTheme[2],
    buttonThemes: _$YgTheme.buttonThemes[2],
    calloutThemes: _$YgTheme.calloutThemes[2],
    dialogTheme: _$YgTheme.dialogTheme[2],
    internalTheme: _$YgTheme.internalTheme[2],
    snackbarTheme: _$YgTheme.snackbarTheme[2],
    textLinkTheme: _$YgTheme.textLinkTheme[2],
    tokens: _$YgTheme.tokens[2],
  );

  static final YgTheme professionalDark = YgTheme(
    badgeTheme: _$YgTheme.badgeTheme[3],
    bottomSheetTheme: _$YgTheme.bottomSheetTheme[3],
    buttonThemes: _$YgTheme.buttonThemes[3],
    calloutThemes: _$YgTheme.calloutThemes[3],
    dialogTheme: _$YgTheme.dialogTheme[3],
    internalTheme: _$YgTheme.internalTheme[3],
    snackbarTheme: _$YgTheme.snackbarTheme[3],
    textLinkTheme: _$YgTheme.textLinkTheme[3],
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
    YgCalloutThemes? calloutThemes,
    YgDialogThemes? dialogTheme,
    YgInternalTheme? internalTheme,
    YgSnackbarTheme? snackbarTheme,
    YgTextLinkTheme? textLinkTheme,
    YgTokens? tokens,
  }) {
    return YgTheme(
      badgeTheme: badgeTheme ?? this.badgeTheme,
      bottomSheetTheme: bottomSheetTheme ?? this.bottomSheetTheme,
      buttonThemes: buttonThemes ?? this.buttonThemes,
      calloutThemes: calloutThemes ?? this.calloutThemes,
      dialogTheme: dialogTheme ?? this.dialogTheme,
      internalTheme: internalTheme ?? this.internalTheme,
      snackbarTheme: snackbarTheme ?? this.snackbarTheme,
      textLinkTheme: textLinkTheme ?? this.textLinkTheme,
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
      calloutThemes:
          calloutThemes.lerp(other.calloutThemes, t) as YgCalloutThemes,
      dialogTheme: dialogTheme.lerp(other.dialogTheme, t) as YgDialogThemes,
      internalTheme:
          internalTheme.lerp(other.internalTheme, t) as YgInternalTheme,
      snackbarTheme:
          snackbarTheme.lerp(other.snackbarTheme, t) as YgSnackbarTheme,
      textLinkTheme:
          textLinkTheme.lerp(other.textLinkTheme, t) as YgTextLinkTheme,
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
                .equals(calloutThemes, other.calloutThemes) &&
            const DeepCollectionEquality()
                .equals(dialogTheme, other.dialogTheme) &&
            const DeepCollectionEquality()
                .equals(internalTheme, other.internalTheme) &&
            const DeepCollectionEquality()
                .equals(snackbarTheme, other.snackbarTheme) &&
            const DeepCollectionEquality()
                .equals(textLinkTheme, other.textLinkTheme) &&
            const DeepCollectionEquality().equals(tokens, other.tokens));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(badgeTheme),
      const DeepCollectionEquality().hash(bottomSheetTheme),
      const DeepCollectionEquality().hash(buttonThemes),
      const DeepCollectionEquality().hash(calloutThemes),
      const DeepCollectionEquality().hash(dialogTheme),
      const DeepCollectionEquality().hash(internalTheme),
      const DeepCollectionEquality().hash(snackbarTheme),
      const DeepCollectionEquality().hash(textLinkTheme),
      const DeepCollectionEquality().hash(tokens),
    );
  }
}

extension YgThemeBuildContextProps on BuildContext {
  YgTheme get ygTheme => Theme.of(this).extension<YgTheme>()!;
  YgBadgeTheme get badgeTheme => ygTheme.badgeTheme;
  YgBottomSheetThemes get bottomSheetTheme => ygTheme.bottomSheetTheme;
  YgButtonThemes get buttonThemes => ygTheme.buttonThemes;
  YgCalloutThemes get calloutThemes => ygTheme.calloutThemes;
  YgDialogThemes get dialogTheme => ygTheme.dialogTheme;
  YgInternalTheme get internalTheme => ygTheme.internalTheme;
  YgSnackbarTheme get snackbarTheme => ygTheme.snackbarTheme;
  YgTextLinkTheme get textLinkTheme => ygTheme.textLinkTheme;
  YgTokens get tokens => ygTheme.tokens;
}
