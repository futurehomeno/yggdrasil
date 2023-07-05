// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'button_themes.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgButtonThemes extends ThemeExtension<YgButtonThemes> {
  const YgButtonThemes({
    required this.borderRadius,
    required this.borderWidth,
    required this.criticalButtonTheme,
    required this.iconSpacing,
    required this.linkButtonTheme,
    required this.paddingLarge,
    required this.paddingMedium,
    required this.paddingSmall,
    required this.primaryButtonTheme,
    required this.secondaryButtonTheme,
    required this.textButtonTheme,
  });

  final BorderRadius borderRadius;
  final double borderWidth;
  final CriticalButtonTheme criticalButtonTheme;
  final double iconSpacing;
  final LinkButtonTheme linkButtonTheme;
  final EdgeInsets paddingLarge;
  final EdgeInsets paddingMedium;
  final EdgeInsets paddingSmall;
  final PrimaryButtonTheme primaryButtonTheme;
  final SecondaryButtonTheme secondaryButtonTheme;
  final TextButtonTheme textButtonTheme;

  static final YgButtonThemes consumerLight = YgButtonThemes(
    borderRadius: _$YgButtonThemes.borderRadius[0],
    borderWidth: _$YgButtonThemes.borderWidth[0],
    criticalButtonTheme: _$YgButtonThemes.criticalButtonTheme[0],
    iconSpacing: _$YgButtonThemes.iconSpacing[0],
    linkButtonTheme: _$YgButtonThemes.linkButtonTheme[0],
    paddingLarge: _$YgButtonThemes.paddingLarge[0],
    paddingMedium: _$YgButtonThemes.paddingMedium[0],
    paddingSmall: _$YgButtonThemes.paddingSmall[0],
    primaryButtonTheme: _$YgButtonThemes.primaryButtonTheme[0],
    secondaryButtonTheme: _$YgButtonThemes.secondaryButtonTheme[0],
    textButtonTheme: _$YgButtonThemes.textButtonTheme[0],
  );

  static final YgButtonThemes consumerDark = YgButtonThemes(
    borderRadius: _$YgButtonThemes.borderRadius[1],
    borderWidth: _$YgButtonThemes.borderWidth[1],
    criticalButtonTheme: _$YgButtonThemes.criticalButtonTheme[1],
    iconSpacing: _$YgButtonThemes.iconSpacing[1],
    linkButtonTheme: _$YgButtonThemes.linkButtonTheme[1],
    paddingLarge: _$YgButtonThemes.paddingLarge[1],
    paddingMedium: _$YgButtonThemes.paddingMedium[1],
    paddingSmall: _$YgButtonThemes.paddingSmall[1],
    primaryButtonTheme: _$YgButtonThemes.primaryButtonTheme[1],
    secondaryButtonTheme: _$YgButtonThemes.secondaryButtonTheme[1],
    textButtonTheme: _$YgButtonThemes.textButtonTheme[1],
  );

  static final YgButtonThemes professionalLight = YgButtonThemes(
    borderRadius: _$YgButtonThemes.borderRadius[2],
    borderWidth: _$YgButtonThemes.borderWidth[2],
    criticalButtonTheme: _$YgButtonThemes.criticalButtonTheme[2],
    iconSpacing: _$YgButtonThemes.iconSpacing[2],
    linkButtonTheme: _$YgButtonThemes.linkButtonTheme[2],
    paddingLarge: _$YgButtonThemes.paddingLarge[2],
    paddingMedium: _$YgButtonThemes.paddingMedium[2],
    paddingSmall: _$YgButtonThemes.paddingSmall[2],
    primaryButtonTheme: _$YgButtonThemes.primaryButtonTheme[2],
    secondaryButtonTheme: _$YgButtonThemes.secondaryButtonTheme[2],
    textButtonTheme: _$YgButtonThemes.textButtonTheme[2],
  );

  static final YgButtonThemes professionalDark = YgButtonThemes(
    borderRadius: _$YgButtonThemes.borderRadius[3],
    borderWidth: _$YgButtonThemes.borderWidth[3],
    criticalButtonTheme: _$YgButtonThemes.criticalButtonTheme[3],
    iconSpacing: _$YgButtonThemes.iconSpacing[3],
    linkButtonTheme: _$YgButtonThemes.linkButtonTheme[3],
    paddingLarge: _$YgButtonThemes.paddingLarge[3],
    paddingMedium: _$YgButtonThemes.paddingMedium[3],
    paddingSmall: _$YgButtonThemes.paddingSmall[3],
    primaryButtonTheme: _$YgButtonThemes.primaryButtonTheme[3],
    secondaryButtonTheme: _$YgButtonThemes.secondaryButtonTheme[3],
    textButtonTheme: _$YgButtonThemes.textButtonTheme[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgButtonThemes copyWith({
    BorderRadius? borderRadius,
    double? borderWidth,
    CriticalButtonTheme? criticalButtonTheme,
    double? iconSpacing,
    LinkButtonTheme? linkButtonTheme,
    EdgeInsets? paddingLarge,
    EdgeInsets? paddingMedium,
    EdgeInsets? paddingSmall,
    PrimaryButtonTheme? primaryButtonTheme,
    SecondaryButtonTheme? secondaryButtonTheme,
    TextButtonTheme? textButtonTheme,
  }) {
    return YgButtonThemes(
      borderRadius: borderRadius ?? this.borderRadius,
      borderWidth: borderWidth ?? this.borderWidth,
      criticalButtonTheme: criticalButtonTheme ?? this.criticalButtonTheme,
      iconSpacing: iconSpacing ?? this.iconSpacing,
      linkButtonTheme: linkButtonTheme ?? this.linkButtonTheme,
      paddingLarge: paddingLarge ?? this.paddingLarge,
      paddingMedium: paddingMedium ?? this.paddingMedium,
      paddingSmall: paddingSmall ?? this.paddingSmall,
      primaryButtonTheme: primaryButtonTheme ?? this.primaryButtonTheme,
      secondaryButtonTheme: secondaryButtonTheme ?? this.secondaryButtonTheme,
      textButtonTheme: textButtonTheme ?? this.textButtonTheme,
    );
  }

  @override
  YgButtonThemes lerp(
      covariant ThemeExtension<YgButtonThemes>? other, double t) {
    if (other is! YgButtonThemes) return this as YgButtonThemes;
    return YgButtonThemes(
      borderRadius: t < 0.5 ? borderRadius : other.borderRadius,
      borderWidth: t < 0.5 ? borderWidth : other.borderWidth,
      criticalButtonTheme: criticalButtonTheme.lerp(
          other.criticalButtonTheme, t) as CriticalButtonTheme,
      iconSpacing: t < 0.5 ? iconSpacing : other.iconSpacing,
      linkButtonTheme:
          linkButtonTheme.lerp(other.linkButtonTheme, t) as LinkButtonTheme,
      paddingLarge: t < 0.5 ? paddingLarge : other.paddingLarge,
      paddingMedium: t < 0.5 ? paddingMedium : other.paddingMedium,
      paddingSmall: t < 0.5 ? paddingSmall : other.paddingSmall,
      primaryButtonTheme: primaryButtonTheme.lerp(other.primaryButtonTheme, t)
          as PrimaryButtonTheme,
      secondaryButtonTheme: secondaryButtonTheme.lerp(
          other.secondaryButtonTheme, t) as SecondaryButtonTheme,
      textButtonTheme:
          textButtonTheme.lerp(other.textButtonTheme, t) as TextButtonTheme,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgButtonThemes &&
            const DeepCollectionEquality()
                .equals(borderRadius, other.borderRadius) &&
            const DeepCollectionEquality()
                .equals(borderWidth, other.borderWidth) &&
            const DeepCollectionEquality()
                .equals(criticalButtonTheme, other.criticalButtonTheme) &&
            const DeepCollectionEquality()
                .equals(iconSpacing, other.iconSpacing) &&
            const DeepCollectionEquality()
                .equals(linkButtonTheme, other.linkButtonTheme) &&
            const DeepCollectionEquality()
                .equals(paddingLarge, other.paddingLarge) &&
            const DeepCollectionEquality()
                .equals(paddingMedium, other.paddingMedium) &&
            const DeepCollectionEquality()
                .equals(paddingSmall, other.paddingSmall) &&
            const DeepCollectionEquality()
                .equals(primaryButtonTheme, other.primaryButtonTheme) &&
            const DeepCollectionEquality()
                .equals(secondaryButtonTheme, other.secondaryButtonTheme) &&
            const DeepCollectionEquality()
                .equals(textButtonTheme, other.textButtonTheme));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(borderRadius),
      const DeepCollectionEquality().hash(borderWidth),
      const DeepCollectionEquality().hash(criticalButtonTheme),
      const DeepCollectionEquality().hash(iconSpacing),
      const DeepCollectionEquality().hash(linkButtonTheme),
      const DeepCollectionEquality().hash(paddingLarge),
      const DeepCollectionEquality().hash(paddingMedium),
      const DeepCollectionEquality().hash(paddingSmall),
      const DeepCollectionEquality().hash(primaryButtonTheme),
      const DeepCollectionEquality().hash(secondaryButtonTheme),
      const DeepCollectionEquality().hash(textButtonTheme),
    );
  }
}
