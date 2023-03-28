// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'button_themes.dart';

// **************************************************************************
// ThemeTailorGenerator
// **************************************************************************

class YgButtonThemes extends ThemeExtension<YgButtonThemes> {
  const YgButtonThemes({
    required this.criticalButtonTheme,
    required this.linkButtonTheme,
    required this.primaryButtonTheme,
    required this.secondaryButtonTheme,
    required this.textButtonTheme,
    required this.buttonPadding,
  });

  final CriticalButtonTheme criticalButtonTheme;
  final LinkButtonTheme linkButtonTheme;
  final PrimaryButtonTheme primaryButtonTheme;
  final SecondaryButtonTheme secondaryButtonTheme;
  final TextButtonTheme textButtonTheme;
  final EdgeInsets buttonPadding;

  static final YgButtonThemes consumerLight = YgButtonThemes(
    criticalButtonTheme: _$YgButtonThemes.criticalButtonTheme[0],
    linkButtonTheme: _$YgButtonThemes.linkButtonTheme[0],
    primaryButtonTheme: _$YgButtonThemes.primaryButtonTheme[0],
    secondaryButtonTheme: _$YgButtonThemes.secondaryButtonTheme[0],
    textButtonTheme: _$YgButtonThemes.textButtonTheme[0],
    buttonPadding: _$YgButtonThemes.buttonPadding[0],
  );

  static final YgButtonThemes consumerDark = YgButtonThemes(
    criticalButtonTheme: _$YgButtonThemes.criticalButtonTheme[1],
    linkButtonTheme: _$YgButtonThemes.linkButtonTheme[1],
    primaryButtonTheme: _$YgButtonThemes.primaryButtonTheme[1],
    secondaryButtonTheme: _$YgButtonThemes.secondaryButtonTheme[1],
    textButtonTheme: _$YgButtonThemes.textButtonTheme[1],
    buttonPadding: _$YgButtonThemes.buttonPadding[1],
  );

  static final YgButtonThemes professionalLight = YgButtonThemes(
    criticalButtonTheme: _$YgButtonThemes.criticalButtonTheme[2],
    linkButtonTheme: _$YgButtonThemes.linkButtonTheme[2],
    primaryButtonTheme: _$YgButtonThemes.primaryButtonTheme[2],
    secondaryButtonTheme: _$YgButtonThemes.secondaryButtonTheme[2],
    textButtonTheme: _$YgButtonThemes.textButtonTheme[2],
    buttonPadding: _$YgButtonThemes.buttonPadding[2],
  );

  static final YgButtonThemes professionalDark = YgButtonThemes(
    criticalButtonTheme: _$YgButtonThemes.criticalButtonTheme[3],
    linkButtonTheme: _$YgButtonThemes.linkButtonTheme[3],
    primaryButtonTheme: _$YgButtonThemes.primaryButtonTheme[3],
    secondaryButtonTheme: _$YgButtonThemes.secondaryButtonTheme[3],
    textButtonTheme: _$YgButtonThemes.textButtonTheme[3],
    buttonPadding: _$YgButtonThemes.buttonPadding[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgButtonThemes copyWith({
    CriticalButtonTheme? criticalButtonTheme,
    LinkButtonTheme? linkButtonTheme,
    PrimaryButtonTheme? primaryButtonTheme,
    SecondaryButtonTheme? secondaryButtonTheme,
    TextButtonTheme? textButtonTheme,
    EdgeInsets? buttonPadding,
  }) {
    return YgButtonThemes(
      criticalButtonTheme: criticalButtonTheme ?? this.criticalButtonTheme,
      linkButtonTheme: linkButtonTheme ?? this.linkButtonTheme,
      primaryButtonTheme: primaryButtonTheme ?? this.primaryButtonTheme,
      secondaryButtonTheme: secondaryButtonTheme ?? this.secondaryButtonTheme,
      textButtonTheme: textButtonTheme ?? this.textButtonTheme,
      buttonPadding: buttonPadding ?? this.buttonPadding,
    );
  }

  @override
  YgButtonThemes lerp(ThemeExtension<YgButtonThemes>? other, double t) {
    if (other is! YgButtonThemes) return this;
    return YgButtonThemes(
      criticalButtonTheme:
          criticalButtonTheme.lerp(other.criticalButtonTheme, t),
      linkButtonTheme: linkButtonTheme.lerp(other.linkButtonTheme, t),
      primaryButtonTheme: primaryButtonTheme.lerp(other.primaryButtonTheme, t),
      secondaryButtonTheme:
          secondaryButtonTheme.lerp(other.secondaryButtonTheme, t),
      textButtonTheme: textButtonTheme.lerp(other.textButtonTheme, t),
      buttonPadding: t < 0.5 ? buttonPadding : other.buttonPadding,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgButtonThemes &&
            const DeepCollectionEquality()
                .equals(criticalButtonTheme, other.criticalButtonTheme) &&
            const DeepCollectionEquality()
                .equals(linkButtonTheme, other.linkButtonTheme) &&
            const DeepCollectionEquality()
                .equals(primaryButtonTheme, other.primaryButtonTheme) &&
            const DeepCollectionEquality()
                .equals(secondaryButtonTheme, other.secondaryButtonTheme) &&
            const DeepCollectionEquality()
                .equals(textButtonTheme, other.textButtonTheme) &&
            const DeepCollectionEquality()
                .equals(buttonPadding, other.buttonPadding));
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        const DeepCollectionEquality().hash(criticalButtonTheme),
        const DeepCollectionEquality().hash(linkButtonTheme),
        const DeepCollectionEquality().hash(primaryButtonTheme),
        const DeepCollectionEquality().hash(secondaryButtonTheme),
        const DeepCollectionEquality().hash(textButtonTheme),
        const DeepCollectionEquality().hash(buttonPadding));
  }
}
