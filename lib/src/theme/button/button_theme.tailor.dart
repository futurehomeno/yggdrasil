// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'button_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgButtonTheme extends ThemeExtension<YgButtonTheme> {
  const YgButtonTheme({
    required this.borderRadius,
    required this.borderWidth,
    required this.criticalButtonTheme,
    required this.iconSize,
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
  final double iconSize;
  final double iconSpacing;
  final LinkButtonTheme linkButtonTheme;
  final EdgeInsets paddingLarge;
  final EdgeInsets paddingMedium;
  final EdgeInsets paddingSmall;
  final PrimaryButtonTheme primaryButtonTheme;
  final SecondaryButtonTheme secondaryButtonTheme;
  final TextButtonTheme textButtonTheme;

  static final YgButtonTheme consumerLight = YgButtonTheme(
    borderRadius: _$YgButtonTheme.borderRadius[0],
    borderWidth: _$YgButtonTheme.borderWidth[0],
    criticalButtonTheme: _$YgButtonTheme.criticalButtonTheme[0],
    iconSize: _$YgButtonTheme.iconSize[0],
    iconSpacing: _$YgButtonTheme.iconSpacing[0],
    linkButtonTheme: _$YgButtonTheme.linkButtonTheme[0],
    paddingLarge: _$YgButtonTheme.paddingLarge[0],
    paddingMedium: _$YgButtonTheme.paddingMedium[0],
    paddingSmall: _$YgButtonTheme.paddingSmall[0],
    primaryButtonTheme: _$YgButtonTheme.primaryButtonTheme[0],
    secondaryButtonTheme: _$YgButtonTheme.secondaryButtonTheme[0],
    textButtonTheme: _$YgButtonTheme.textButtonTheme[0],
  );

  static final YgButtonTheme consumerDark = YgButtonTheme(
    borderRadius: _$YgButtonTheme.borderRadius[1],
    borderWidth: _$YgButtonTheme.borderWidth[1],
    criticalButtonTheme: _$YgButtonTheme.criticalButtonTheme[1],
    iconSize: _$YgButtonTheme.iconSize[1],
    iconSpacing: _$YgButtonTheme.iconSpacing[1],
    linkButtonTheme: _$YgButtonTheme.linkButtonTheme[1],
    paddingLarge: _$YgButtonTheme.paddingLarge[1],
    paddingMedium: _$YgButtonTheme.paddingMedium[1],
    paddingSmall: _$YgButtonTheme.paddingSmall[1],
    primaryButtonTheme: _$YgButtonTheme.primaryButtonTheme[1],
    secondaryButtonTheme: _$YgButtonTheme.secondaryButtonTheme[1],
    textButtonTheme: _$YgButtonTheme.textButtonTheme[1],
  );

  static final YgButtonTheme professionalLight = YgButtonTheme(
    borderRadius: _$YgButtonTheme.borderRadius[2],
    borderWidth: _$YgButtonTheme.borderWidth[2],
    criticalButtonTheme: _$YgButtonTheme.criticalButtonTheme[2],
    iconSize: _$YgButtonTheme.iconSize[2],
    iconSpacing: _$YgButtonTheme.iconSpacing[2],
    linkButtonTheme: _$YgButtonTheme.linkButtonTheme[2],
    paddingLarge: _$YgButtonTheme.paddingLarge[2],
    paddingMedium: _$YgButtonTheme.paddingMedium[2],
    paddingSmall: _$YgButtonTheme.paddingSmall[2],
    primaryButtonTheme: _$YgButtonTheme.primaryButtonTheme[2],
    secondaryButtonTheme: _$YgButtonTheme.secondaryButtonTheme[2],
    textButtonTheme: _$YgButtonTheme.textButtonTheme[2],
  );

  static final YgButtonTheme professionalDark = YgButtonTheme(
    borderRadius: _$YgButtonTheme.borderRadius[3],
    borderWidth: _$YgButtonTheme.borderWidth[3],
    criticalButtonTheme: _$YgButtonTheme.criticalButtonTheme[3],
    iconSize: _$YgButtonTheme.iconSize[3],
    iconSpacing: _$YgButtonTheme.iconSpacing[3],
    linkButtonTheme: _$YgButtonTheme.linkButtonTheme[3],
    paddingLarge: _$YgButtonTheme.paddingLarge[3],
    paddingMedium: _$YgButtonTheme.paddingMedium[3],
    paddingSmall: _$YgButtonTheme.paddingSmall[3],
    primaryButtonTheme: _$YgButtonTheme.primaryButtonTheme[3],
    secondaryButtonTheme: _$YgButtonTheme.secondaryButtonTheme[3],
    textButtonTheme: _$YgButtonTheme.textButtonTheme[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgButtonTheme copyWith({
    BorderRadius? borderRadius,
    double? borderWidth,
    CriticalButtonTheme? criticalButtonTheme,
    double? iconSize,
    double? iconSpacing,
    LinkButtonTheme? linkButtonTheme,
    EdgeInsets? paddingLarge,
    EdgeInsets? paddingMedium,
    EdgeInsets? paddingSmall,
    PrimaryButtonTheme? primaryButtonTheme,
    SecondaryButtonTheme? secondaryButtonTheme,
    TextButtonTheme? textButtonTheme,
  }) {
    return YgButtonTheme(
      borderRadius: borderRadius ?? this.borderRadius,
      borderWidth: borderWidth ?? this.borderWidth,
      criticalButtonTheme: criticalButtonTheme ?? this.criticalButtonTheme,
      iconSize: iconSize ?? this.iconSize,
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
  YgButtonTheme lerp(covariant ThemeExtension<YgButtonTheme>? other, double t) {
    if (other is! YgButtonTheme) return this as YgButtonTheme;
    return YgButtonTheme(
      borderRadius: t < 0.5 ? borderRadius : other.borderRadius,
      borderWidth: t < 0.5 ? borderWidth : other.borderWidth,
      criticalButtonTheme: criticalButtonTheme.lerp(
          other.criticalButtonTheme, t) as CriticalButtonTheme,
      iconSize: t < 0.5 ? iconSize : other.iconSize,
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
            other is YgButtonTheme &&
            const DeepCollectionEquality()
                .equals(borderRadius, other.borderRadius) &&
            const DeepCollectionEquality()
                .equals(borderWidth, other.borderWidth) &&
            const DeepCollectionEquality()
                .equals(criticalButtonTheme, other.criticalButtonTheme) &&
            const DeepCollectionEquality().equals(iconSize, other.iconSize) &&
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
      const DeepCollectionEquality().hash(iconSize),
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
