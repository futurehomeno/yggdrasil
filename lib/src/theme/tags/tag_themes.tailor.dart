// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'tag_themes.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgTagThemes extends ThemeExtension<YgTagThemes> {
  const YgTagThemes({
    required this.borderRadius,
    required this.borderWidth,
    required this.iconSize,
    required this.iconSpacing,
    required this.informativeTagTheme,
    required this.negativeTagTheme,
    required this.neutralTagTheme,
    required this.paddingMedium,
    required this.paddingSmall,
    required this.positiveTagTheme,
    required this.warningTagTheme,
  });

  final BorderRadius borderRadius;
  final double borderWidth;
  final double iconSize;
  final double iconSpacing;
  final InformativeTagTheme informativeTagTheme;
  final NegativeTagTheme negativeTagTheme;
  final NeutralTagTheme neutralTagTheme;
  final EdgeInsets paddingMedium;
  final EdgeInsets paddingSmall;
  final PositiveTagTheme positiveTagTheme;
  final WarningTagTheme warningTagTheme;

  static final YgTagThemes consumerLight = YgTagThemes(
    borderRadius: _$YgTagThemes.borderRadius[0],
    borderWidth: _$YgTagThemes.borderWidth[0],
    iconSize: _$YgTagThemes.iconSize[0],
    iconSpacing: _$YgTagThemes.iconSpacing[0],
    informativeTagTheme: _$YgTagThemes.informativeTagTheme[0],
    negativeTagTheme: _$YgTagThemes.negativeTagTheme[0],
    neutralTagTheme: _$YgTagThemes.neutralTagTheme[0],
    paddingMedium: _$YgTagThemes.paddingMedium[0],
    paddingSmall: _$YgTagThemes.paddingSmall[0],
    positiveTagTheme: _$YgTagThemes.positiveTagTheme[0],
    warningTagTheme: _$YgTagThemes.warningTagTheme[0],
  );

  static final YgTagThemes consumerDark = YgTagThemes(
    borderRadius: _$YgTagThemes.borderRadius[1],
    borderWidth: _$YgTagThemes.borderWidth[1],
    iconSize: _$YgTagThemes.iconSize[1],
    iconSpacing: _$YgTagThemes.iconSpacing[1],
    informativeTagTheme: _$YgTagThemes.informativeTagTheme[1],
    negativeTagTheme: _$YgTagThemes.negativeTagTheme[1],
    neutralTagTheme: _$YgTagThemes.neutralTagTheme[1],
    paddingMedium: _$YgTagThemes.paddingMedium[1],
    paddingSmall: _$YgTagThemes.paddingSmall[1],
    positiveTagTheme: _$YgTagThemes.positiveTagTheme[1],
    warningTagTheme: _$YgTagThemes.warningTagTheme[1],
  );

  static final YgTagThemes professionalLight = YgTagThemes(
    borderRadius: _$YgTagThemes.borderRadius[2],
    borderWidth: _$YgTagThemes.borderWidth[2],
    iconSize: _$YgTagThemes.iconSize[2],
    iconSpacing: _$YgTagThemes.iconSpacing[2],
    informativeTagTheme: _$YgTagThemes.informativeTagTheme[2],
    negativeTagTheme: _$YgTagThemes.negativeTagTheme[2],
    neutralTagTheme: _$YgTagThemes.neutralTagTheme[2],
    paddingMedium: _$YgTagThemes.paddingMedium[2],
    paddingSmall: _$YgTagThemes.paddingSmall[2],
    positiveTagTheme: _$YgTagThemes.positiveTagTheme[2],
    warningTagTheme: _$YgTagThemes.warningTagTheme[2],
  );

  static final YgTagThemes professionalDark = YgTagThemes(
    borderRadius: _$YgTagThemes.borderRadius[3],
    borderWidth: _$YgTagThemes.borderWidth[3],
    iconSize: _$YgTagThemes.iconSize[3],
    iconSpacing: _$YgTagThemes.iconSpacing[3],
    informativeTagTheme: _$YgTagThemes.informativeTagTheme[3],
    negativeTagTheme: _$YgTagThemes.negativeTagTheme[3],
    neutralTagTheme: _$YgTagThemes.neutralTagTheme[3],
    paddingMedium: _$YgTagThemes.paddingMedium[3],
    paddingSmall: _$YgTagThemes.paddingSmall[3],
    positiveTagTheme: _$YgTagThemes.positiveTagTheme[3],
    warningTagTheme: _$YgTagThemes.warningTagTheme[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgTagThemes copyWith({
    BorderRadius? borderRadius,
    double? borderWidth,
    double? iconSize,
    double? iconSpacing,
    InformativeTagTheme? informativeTagTheme,
    NegativeTagTheme? negativeTagTheme,
    NeutralTagTheme? neutralTagTheme,
    EdgeInsets? paddingMedium,
    EdgeInsets? paddingSmall,
    PositiveTagTheme? positiveTagTheme,
    WarningTagTheme? warningTagTheme,
  }) {
    return YgTagThemes(
      borderRadius: borderRadius ?? this.borderRadius,
      borderWidth: borderWidth ?? this.borderWidth,
      iconSize: iconSize ?? this.iconSize,
      iconSpacing: iconSpacing ?? this.iconSpacing,
      informativeTagTheme: informativeTagTheme ?? this.informativeTagTheme,
      negativeTagTheme: negativeTagTheme ?? this.negativeTagTheme,
      neutralTagTheme: neutralTagTheme ?? this.neutralTagTheme,
      paddingMedium: paddingMedium ?? this.paddingMedium,
      paddingSmall: paddingSmall ?? this.paddingSmall,
      positiveTagTheme: positiveTagTheme ?? this.positiveTagTheme,
      warningTagTheme: warningTagTheme ?? this.warningTagTheme,
    );
  }

  @override
  YgTagThemes lerp(covariant ThemeExtension<YgTagThemes>? other, double t) {
    if (other is! YgTagThemes) return this as YgTagThemes;
    return YgTagThemes(
      borderRadius: t < 0.5 ? borderRadius : other.borderRadius,
      borderWidth: t < 0.5 ? borderWidth : other.borderWidth,
      iconSize: t < 0.5 ? iconSize : other.iconSize,
      iconSpacing: t < 0.5 ? iconSpacing : other.iconSpacing,
      informativeTagTheme: informativeTagTheme.lerp(
          other.informativeTagTheme, t) as InformativeTagTheme,
      negativeTagTheme:
          negativeTagTheme.lerp(other.negativeTagTheme, t) as NegativeTagTheme,
      neutralTagTheme:
          neutralTagTheme.lerp(other.neutralTagTheme, t) as NeutralTagTheme,
      paddingMedium: t < 0.5 ? paddingMedium : other.paddingMedium,
      paddingSmall: t < 0.5 ? paddingSmall : other.paddingSmall,
      positiveTagTheme:
          positiveTagTheme.lerp(other.positiveTagTheme, t) as PositiveTagTheme,
      warningTagTheme:
          warningTagTheme.lerp(other.warningTagTheme, t) as WarningTagTheme,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgTagThemes &&
            const DeepCollectionEquality()
                .equals(borderRadius, other.borderRadius) &&
            const DeepCollectionEquality()
                .equals(borderWidth, other.borderWidth) &&
            const DeepCollectionEquality().equals(iconSize, other.iconSize) &&
            const DeepCollectionEquality()
                .equals(iconSpacing, other.iconSpacing) &&
            const DeepCollectionEquality()
                .equals(informativeTagTheme, other.informativeTagTheme) &&
            const DeepCollectionEquality()
                .equals(negativeTagTheme, other.negativeTagTheme) &&
            const DeepCollectionEquality()
                .equals(neutralTagTheme, other.neutralTagTheme) &&
            const DeepCollectionEquality()
                .equals(paddingMedium, other.paddingMedium) &&
            const DeepCollectionEquality()
                .equals(paddingSmall, other.paddingSmall) &&
            const DeepCollectionEquality()
                .equals(positiveTagTheme, other.positiveTagTheme) &&
            const DeepCollectionEquality()
                .equals(warningTagTheme, other.warningTagTheme));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(borderRadius),
      const DeepCollectionEquality().hash(borderWidth),
      const DeepCollectionEquality().hash(iconSize),
      const DeepCollectionEquality().hash(iconSpacing),
      const DeepCollectionEquality().hash(informativeTagTheme),
      const DeepCollectionEquality().hash(negativeTagTheme),
      const DeepCollectionEquality().hash(neutralTagTheme),
      const DeepCollectionEquality().hash(paddingMedium),
      const DeepCollectionEquality().hash(paddingSmall),
      const DeepCollectionEquality().hash(positiveTagTheme),
      const DeepCollectionEquality().hash(warningTagTheme),
    );
  }
}
