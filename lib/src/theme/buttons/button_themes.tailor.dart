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
    required this.paddingSmall,
    required this.paddingMedium,
    required this.paddingLarge,
    required this.iconSpacing,
    required this.borderRadius,
    required this.borderWidth,
  });

  final CriticalButtonTheme criticalButtonTheme;
  final LinkButtonTheme linkButtonTheme;
  final PrimaryButtonTheme primaryButtonTheme;
  final SecondaryButtonTheme secondaryButtonTheme;
  final TextButtonTheme textButtonTheme;
  final EdgeInsets paddingSmall;
  final EdgeInsets paddingMedium;
  final EdgeInsets paddingLarge;
  final double iconSpacing;
  final BorderRadius borderRadius;
  final double borderWidth;

  static final YgButtonThemes consumerLight = YgButtonThemes(
    criticalButtonTheme: _$YgButtonThemes.criticalButtonTheme[0],
    linkButtonTheme: _$YgButtonThemes.linkButtonTheme[0],
    primaryButtonTheme: _$YgButtonThemes.primaryButtonTheme[0],
    secondaryButtonTheme: _$YgButtonThemes.secondaryButtonTheme[0],
    textButtonTheme: _$YgButtonThemes.textButtonTheme[0],
    paddingSmall: _$YgButtonThemes.paddingSmall[0],
    paddingMedium: _$YgButtonThemes.paddingMedium[0],
    paddingLarge: _$YgButtonThemes.paddingLarge[0],
    iconSpacing: _$YgButtonThemes.iconSpacing[0],
    borderRadius: _$YgButtonThemes.borderRadius[0],
    borderWidth: _$YgButtonThemes.borderWidth[0],
  );

  static final YgButtonThemes consumerDark = YgButtonThemes(
    criticalButtonTheme: _$YgButtonThemes.criticalButtonTheme[1],
    linkButtonTheme: _$YgButtonThemes.linkButtonTheme[1],
    primaryButtonTheme: _$YgButtonThemes.primaryButtonTheme[1],
    secondaryButtonTheme: _$YgButtonThemes.secondaryButtonTheme[1],
    textButtonTheme: _$YgButtonThemes.textButtonTheme[1],
    paddingSmall: _$YgButtonThemes.paddingSmall[1],
    paddingMedium: _$YgButtonThemes.paddingMedium[1],
    paddingLarge: _$YgButtonThemes.paddingLarge[1],
    iconSpacing: _$YgButtonThemes.iconSpacing[1],
    borderRadius: _$YgButtonThemes.borderRadius[1],
    borderWidth: _$YgButtonThemes.borderWidth[1],
  );

  static final YgButtonThemes professionalLight = YgButtonThemes(
    criticalButtonTheme: _$YgButtonThemes.criticalButtonTheme[2],
    linkButtonTheme: _$YgButtonThemes.linkButtonTheme[2],
    primaryButtonTheme: _$YgButtonThemes.primaryButtonTheme[2],
    secondaryButtonTheme: _$YgButtonThemes.secondaryButtonTheme[2],
    textButtonTheme: _$YgButtonThemes.textButtonTheme[2],
    paddingSmall: _$YgButtonThemes.paddingSmall[2],
    paddingMedium: _$YgButtonThemes.paddingMedium[2],
    paddingLarge: _$YgButtonThemes.paddingLarge[2],
    iconSpacing: _$YgButtonThemes.iconSpacing[2],
    borderRadius: _$YgButtonThemes.borderRadius[2],
    borderWidth: _$YgButtonThemes.borderWidth[2],
  );

  static final YgButtonThemes professionalDark = YgButtonThemes(
    criticalButtonTheme: _$YgButtonThemes.criticalButtonTheme[3],
    linkButtonTheme: _$YgButtonThemes.linkButtonTheme[3],
    primaryButtonTheme: _$YgButtonThemes.primaryButtonTheme[3],
    secondaryButtonTheme: _$YgButtonThemes.secondaryButtonTheme[3],
    textButtonTheme: _$YgButtonThemes.textButtonTheme[3],
    paddingSmall: _$YgButtonThemes.paddingSmall[3],
    paddingMedium: _$YgButtonThemes.paddingMedium[3],
    paddingLarge: _$YgButtonThemes.paddingLarge[3],
    iconSpacing: _$YgButtonThemes.iconSpacing[3],
    borderRadius: _$YgButtonThemes.borderRadius[3],
    borderWidth: _$YgButtonThemes.borderWidth[3],
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
    EdgeInsets? paddingSmall,
    EdgeInsets? paddingMedium,
    EdgeInsets? paddingLarge,
    double? iconSpacing,
    BorderRadius? borderRadius,
    double? borderWidth,
  }) {
    return YgButtonThemes(
      criticalButtonTheme: criticalButtonTheme ?? this.criticalButtonTheme,
      linkButtonTheme: linkButtonTheme ?? this.linkButtonTheme,
      primaryButtonTheme: primaryButtonTheme ?? this.primaryButtonTheme,
      secondaryButtonTheme: secondaryButtonTheme ?? this.secondaryButtonTheme,
      textButtonTheme: textButtonTheme ?? this.textButtonTheme,
      paddingSmall: paddingSmall ?? this.paddingSmall,
      paddingMedium: paddingMedium ?? this.paddingMedium,
      paddingLarge: paddingLarge ?? this.paddingLarge,
      iconSpacing: iconSpacing ?? this.iconSpacing,
      borderRadius: borderRadius ?? this.borderRadius,
      borderWidth: borderWidth ?? this.borderWidth,
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
      paddingSmall: t < 0.5 ? paddingSmall : other.paddingSmall,
      paddingMedium: t < 0.5 ? paddingMedium : other.paddingMedium,
      paddingLarge: t < 0.5 ? paddingLarge : other.paddingLarge,
      iconSpacing: t < 0.5 ? iconSpacing : other.iconSpacing,
      borderRadius: t < 0.5 ? borderRadius : other.borderRadius,
      borderWidth: t < 0.5 ? borderWidth : other.borderWidth,
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
                .equals(paddingSmall, other.paddingSmall) &&
            const DeepCollectionEquality()
                .equals(paddingMedium, other.paddingMedium) &&
            const DeepCollectionEquality()
                .equals(paddingLarge, other.paddingLarge) &&
            const DeepCollectionEquality()
                .equals(iconSpacing, other.iconSpacing) &&
            const DeepCollectionEquality()
                .equals(borderRadius, other.borderRadius) &&
            const DeepCollectionEquality()
                .equals(borderWidth, other.borderWidth));
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
        const DeepCollectionEquality().hash(paddingSmall),
        const DeepCollectionEquality().hash(paddingMedium),
        const DeepCollectionEquality().hash(paddingLarge),
        const DeepCollectionEquality().hash(iconSpacing),
        const DeepCollectionEquality().hash(borderRadius),
        const DeepCollectionEquality().hash(borderWidth));
  }
}
