// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgTheme extends ThemeExtension<YgTheme> {
  const YgTheme({
    required this.badgeThemes,
    required this.bottomSheetThemes,
    required this.buttonThemes,
    required this.cardThemes,
    required this.dialogThemes,
    required this.iconThemes,
    required this.internalThemes,
    required this.listTileThemes,
    required this.tagThemes,
    required this.tokens,
  });

  final YgBadgeThemes badgeThemes;
  final YgBottomSheetThemes bottomSheetThemes;
  final YgButtonThemes buttonThemes;
  final YgCardThemes cardThemes;
  final YgDialogThemes dialogThemes;
  final YgIconThemes iconThemes;
  final YgInternalThemes internalThemes;
  final YgListTileThemes listTileThemes;
  final YgTagThemes tagThemes;
  final YgTokens tokens;

  static final YgTheme consumerLight = YgTheme(
    badgeThemes: _$YgTheme.badgeThemes[0],
    bottomSheetThemes: _$YgTheme.bottomSheetThemes[0],
    buttonThemes: _$YgTheme.buttonThemes[0],
    cardThemes: _$YgTheme.cardThemes[0],
    dialogThemes: _$YgTheme.dialogThemes[0],
    iconThemes: _$YgTheme.iconThemes[0],
    internalThemes: _$YgTheme.internalThemes[0],
    listTileThemes: _$YgTheme.listTileThemes[0],
    tagThemes: _$YgTheme.tagThemes[0],
    tokens: _$YgTheme.tokens[0],
  );

  static final YgTheme consumerDark = YgTheme(
    badgeThemes: _$YgTheme.badgeThemes[1],
    bottomSheetThemes: _$YgTheme.bottomSheetThemes[1],
    buttonThemes: _$YgTheme.buttonThemes[1],
    cardThemes: _$YgTheme.cardThemes[1],
    dialogThemes: _$YgTheme.dialogThemes[1],
    iconThemes: _$YgTheme.iconThemes[1],
    internalThemes: _$YgTheme.internalThemes[1],
    listTileThemes: _$YgTheme.listTileThemes[1],
    tagThemes: _$YgTheme.tagThemes[1],
    tokens: _$YgTheme.tokens[1],
  );

  static final YgTheme professionalLight = YgTheme(
    badgeThemes: _$YgTheme.badgeThemes[2],
    bottomSheetThemes: _$YgTheme.bottomSheetThemes[2],
    buttonThemes: _$YgTheme.buttonThemes[2],
    cardThemes: _$YgTheme.cardThemes[2],
    dialogThemes: _$YgTheme.dialogThemes[2],
    iconThemes: _$YgTheme.iconThemes[2],
    internalThemes: _$YgTheme.internalThemes[2],
    listTileThemes: _$YgTheme.listTileThemes[2],
    tagThemes: _$YgTheme.tagThemes[2],
    tokens: _$YgTheme.tokens[2],
  );

  static final YgTheme professionalDark = YgTheme(
    badgeThemes: _$YgTheme.badgeThemes[3],
    bottomSheetThemes: _$YgTheme.bottomSheetThemes[3],
    buttonThemes: _$YgTheme.buttonThemes[3],
    cardThemes: _$YgTheme.cardThemes[3],
    dialogThemes: _$YgTheme.dialogThemes[3],
    iconThemes: _$YgTheme.iconThemes[3],
    internalThemes: _$YgTheme.internalThemes[3],
    listTileThemes: _$YgTheme.listTileThemes[3],
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
    YgBadgeThemes? badgeThemes,
    YgBottomSheetThemes? bottomSheetThemes,
    YgButtonThemes? buttonThemes,
    YgCardThemes? cardThemes,
    YgDialogThemes? dialogThemes,
    YgIconThemes? iconThemes,
    YgInternalThemes? internalThemes,
    YgListTileThemes? listTileThemes,
    YgTagThemes? tagThemes,
    YgTokens? tokens,
  }) {
    return YgTheme(
      badgeThemes: badgeThemes ?? this.badgeThemes,
      bottomSheetThemes: bottomSheetThemes ?? this.bottomSheetThemes,
      buttonThemes: buttonThemes ?? this.buttonThemes,
      cardThemes: cardThemes ?? this.cardThemes,
      dialogThemes: dialogThemes ?? this.dialogThemes,
      iconThemes: iconThemes ?? this.iconThemes,
      internalThemes: internalThemes ?? this.internalThemes,
      listTileThemes: listTileThemes ?? this.listTileThemes,
      tagThemes: tagThemes ?? this.tagThemes,
      tokens: tokens ?? this.tokens,
    );
  }

  @override
  YgTheme lerp(covariant ThemeExtension<YgTheme>? other, double t) {
    if (other is! YgTheme) return this as YgTheme;
    return YgTheme(
      badgeThemes: badgeThemes.lerp(other.badgeThemes, t) as YgBadgeThemes,
      bottomSheetThemes: bottomSheetThemes.lerp(other.bottomSheetThemes, t)
          as YgBottomSheetThemes,
      buttonThemes: buttonThemes.lerp(other.buttonThemes, t) as YgButtonThemes,
      cardThemes: cardThemes.lerp(other.cardThemes, t) as YgCardThemes,
      dialogThemes: dialogThemes.lerp(other.dialogThemes, t) as YgDialogThemes,
      iconThemes: iconThemes.lerp(other.iconThemes, t) as YgIconThemes,
      internalThemes:
          internalThemes.lerp(other.internalThemes, t) as YgInternalThemes,
      listTileThemes:
          listTileThemes.lerp(other.listTileThemes, t) as YgListTileThemes,
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
                .equals(badgeThemes, other.badgeThemes) &&
            const DeepCollectionEquality()
                .equals(bottomSheetThemes, other.bottomSheetThemes) &&
            const DeepCollectionEquality()
                .equals(buttonThemes, other.buttonThemes) &&
            const DeepCollectionEquality()
                .equals(cardThemes, other.cardThemes) &&
            const DeepCollectionEquality()
                .equals(dialogThemes, other.dialogThemes) &&
            const DeepCollectionEquality()
                .equals(iconThemes, other.iconThemes) &&
            const DeepCollectionEquality()
                .equals(internalThemes, other.internalThemes) &&
            const DeepCollectionEquality()
                .equals(listTileThemes, other.listTileThemes) &&
            const DeepCollectionEquality().equals(tagThemes, other.tagThemes) &&
            const DeepCollectionEquality().equals(tokens, other.tokens));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(badgeThemes),
      const DeepCollectionEquality().hash(bottomSheetThemes),
      const DeepCollectionEquality().hash(buttonThemes),
      const DeepCollectionEquality().hash(cardThemes),
      const DeepCollectionEquality().hash(dialogThemes),
      const DeepCollectionEquality().hash(iconThemes),
      const DeepCollectionEquality().hash(internalThemes),
      const DeepCollectionEquality().hash(listTileThemes),
      const DeepCollectionEquality().hash(tagThemes),
      const DeepCollectionEquality().hash(tokens),
    );
  }
}

extension YgThemeBuildContextProps on BuildContext {
  YgTheme get ygTheme => Theme.of(this).extension<YgTheme>()!;
  YgBadgeThemes get badgeThemes => ygTheme.badgeThemes;
  YgBottomSheetThemes get bottomSheetThemes => ygTheme.bottomSheetThemes;
  YgButtonThemes get buttonThemes => ygTheme.buttonThemes;
  YgCardThemes get cardThemes => ygTheme.cardThemes;
  YgDialogThemes get dialogThemes => ygTheme.dialogThemes;
  YgIconThemes get iconThemes => ygTheme.iconThemes;
  YgInternalThemes get internalThemes => ygTheme.internalThemes;
  YgListTileThemes get listTileThemes => ygTheme.listTileThemes;
  YgTagThemes get tagThemes => ygTheme.tagThemes;
  YgTokens get tokens => ygTheme.tokens;
}
