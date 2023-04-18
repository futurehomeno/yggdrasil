// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'tag_themes.dart';

// **************************************************************************
// ThemeTailorGenerator
// **************************************************************************

class YgTagThemes extends ThemeExtension<YgTagThemes> {
  const YgTagThemes({
    required this.neutralTagTheme,
    required this.informativeTagTheme,
    required this.positiveTagTheme,
    required this.warningTagTheme,
    required this.negativeTagTheme,
    required this.paddingSmall,
    required this.paddingMedium,
    required this.iconSpacing,
    required this.borderRadius,
    required this.borderWidth,
  });

  final NeutralTagTheme neutralTagTheme;
  final InformativeTagTheme informativeTagTheme;
  final PositiveTagTheme positiveTagTheme;
  final WarningTagTheme warningTagTheme;
  final NegativeTagTheme negativeTagTheme;
  final EdgeInsets paddingSmall;
  final EdgeInsets paddingMedium;
  final double iconSpacing;
  final BorderRadius borderRadius;
  final double borderWidth;

  static final YgTagThemes consumerLight = YgTagThemes(
    neutralTagTheme: _$YgTagThemes.neutralTagTheme[0],
    informativeTagTheme: _$YgTagThemes.informativeTagTheme[0],
    positiveTagTheme: _$YgTagThemes.positiveTagTheme[0],
    warningTagTheme: _$YgTagThemes.warningTagTheme[0],
    negativeTagTheme: _$YgTagThemes.negativeTagTheme[0],
    paddingSmall: _$YgTagThemes.paddingSmall[0],
    paddingMedium: _$YgTagThemes.paddingMedium[0],
    iconSpacing: _$YgTagThemes.iconSpacing[0],
    borderRadius: _$YgTagThemes.borderRadius[0],
    borderWidth: _$YgTagThemes.borderWidth[0],
  );

  static final YgTagThemes consumerDark = YgTagThemes(
    neutralTagTheme: _$YgTagThemes.neutralTagTheme[1],
    informativeTagTheme: _$YgTagThemes.informativeTagTheme[1],
    positiveTagTheme: _$YgTagThemes.positiveTagTheme[1],
    warningTagTheme: _$YgTagThemes.warningTagTheme[1],
    negativeTagTheme: _$YgTagThemes.negativeTagTheme[1],
    paddingSmall: _$YgTagThemes.paddingSmall[1],
    paddingMedium: _$YgTagThemes.paddingMedium[1],
    iconSpacing: _$YgTagThemes.iconSpacing[1],
    borderRadius: _$YgTagThemes.borderRadius[1],
    borderWidth: _$YgTagThemes.borderWidth[1],
  );

  static final YgTagThemes professionalLight = YgTagThemes(
    neutralTagTheme: _$YgTagThemes.neutralTagTheme[2],
    informativeTagTheme: _$YgTagThemes.informativeTagTheme[2],
    positiveTagTheme: _$YgTagThemes.positiveTagTheme[2],
    warningTagTheme: _$YgTagThemes.warningTagTheme[2],
    negativeTagTheme: _$YgTagThemes.negativeTagTheme[2],
    paddingSmall: _$YgTagThemes.paddingSmall[2],
    paddingMedium: _$YgTagThemes.paddingMedium[2],
    iconSpacing: _$YgTagThemes.iconSpacing[2],
    borderRadius: _$YgTagThemes.borderRadius[2],
    borderWidth: _$YgTagThemes.borderWidth[2],
  );

  static final YgTagThemes professionalDark = YgTagThemes(
    neutralTagTheme: _$YgTagThemes.neutralTagTheme[3],
    informativeTagTheme: _$YgTagThemes.informativeTagTheme[3],
    positiveTagTheme: _$YgTagThemes.positiveTagTheme[3],
    warningTagTheme: _$YgTagThemes.warningTagTheme[3],
    negativeTagTheme: _$YgTagThemes.negativeTagTheme[3],
    paddingSmall: _$YgTagThemes.paddingSmall[3],
    paddingMedium: _$YgTagThemes.paddingMedium[3],
    iconSpacing: _$YgTagThemes.iconSpacing[3],
    borderRadius: _$YgTagThemes.borderRadius[3],
    borderWidth: _$YgTagThemes.borderWidth[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgTagThemes copyWith({
    NeutralTagTheme? neutralTagTheme,
    InformativeTagTheme? informativeTagTheme,
    PositiveTagTheme? positiveTagTheme,
    WarningTagTheme? warningTagTheme,
    NegativeTagTheme? negativeTagTheme,
    EdgeInsets? paddingSmall,
    EdgeInsets? paddingMedium,
    double? iconSpacing,
    BorderRadius? borderRadius,
    double? borderWidth,
  }) {
    return YgTagThemes(
      neutralTagTheme: neutralTagTheme ?? this.neutralTagTheme,
      informativeTagTheme: informativeTagTheme ?? this.informativeTagTheme,
      positiveTagTheme: positiveTagTheme ?? this.positiveTagTheme,
      warningTagTheme: warningTagTheme ?? this.warningTagTheme,
      negativeTagTheme: negativeTagTheme ?? this.negativeTagTheme,
      paddingSmall: paddingSmall ?? this.paddingSmall,
      paddingMedium: paddingMedium ?? this.paddingMedium,
      iconSpacing: iconSpacing ?? this.iconSpacing,
      borderRadius: borderRadius ?? this.borderRadius,
      borderWidth: borderWidth ?? this.borderWidth,
    );
  }

  @override
  YgTagThemes lerp(ThemeExtension<YgTagThemes>? other, double t) {
    if (other is! YgTagThemes) return this;
    return YgTagThemes(
      neutralTagTheme: neutralTagTheme.lerp(other.neutralTagTheme, t),
      informativeTagTheme:
          informativeTagTheme.lerp(other.informativeTagTheme, t),
      positiveTagTheme: positiveTagTheme.lerp(other.positiveTagTheme, t),
      warningTagTheme: warningTagTheme.lerp(other.warningTagTheme, t),
      negativeTagTheme: negativeTagTheme.lerp(other.negativeTagTheme, t),
      paddingSmall: t < 0.5 ? paddingSmall : other.paddingSmall,
      paddingMedium: t < 0.5 ? paddingMedium : other.paddingMedium,
      iconSpacing: t < 0.5 ? iconSpacing : other.iconSpacing,
      borderRadius: t < 0.5 ? borderRadius : other.borderRadius,
      borderWidth: t < 0.5 ? borderWidth : other.borderWidth,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgTagThemes &&
            const DeepCollectionEquality()
                .equals(neutralTagTheme, other.neutralTagTheme) &&
            const DeepCollectionEquality()
                .equals(informativeTagTheme, other.informativeTagTheme) &&
            const DeepCollectionEquality()
                .equals(positiveTagTheme, other.positiveTagTheme) &&
            const DeepCollectionEquality()
                .equals(warningTagTheme, other.warningTagTheme) &&
            const DeepCollectionEquality()
                .equals(negativeTagTheme, other.negativeTagTheme) &&
            const DeepCollectionEquality()
                .equals(paddingSmall, other.paddingSmall) &&
            const DeepCollectionEquality()
                .equals(paddingMedium, other.paddingMedium) &&
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
        const DeepCollectionEquality().hash(neutralTagTheme),
        const DeepCollectionEquality().hash(informativeTagTheme),
        const DeepCollectionEquality().hash(positiveTagTheme),
        const DeepCollectionEquality().hash(warningTagTheme),
        const DeepCollectionEquality().hash(negativeTagTheme),
        const DeepCollectionEquality().hash(paddingSmall),
        const DeepCollectionEquality().hash(paddingMedium),
        const DeepCollectionEquality().hash(iconSpacing),
        const DeepCollectionEquality().hash(borderRadius),
        const DeepCollectionEquality().hash(borderWidth));
  }
}
