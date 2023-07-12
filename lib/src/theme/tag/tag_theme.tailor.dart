// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'tag_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgTagTheme extends ThemeExtension<YgTagTheme> {
  const YgTagTheme({
    required this.borderRadius,
    required this.borderWidth,
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
  final double iconSpacing;
  final InformativeTagTheme informativeTagTheme;
  final NegativeTagTheme negativeTagTheme;
  final NeutralTagTheme neutralTagTheme;
  final EdgeInsets paddingMedium;
  final EdgeInsets paddingSmall;
  final PositiveTagTheme positiveTagTheme;
  final WarningTagTheme warningTagTheme;

  static final YgTagTheme consumerLight = YgTagTheme(
    borderRadius: _$YgTagTheme.borderRadius[0],
    borderWidth: _$YgTagTheme.borderWidth[0],
    iconSpacing: _$YgTagTheme.iconSpacing[0],
    informativeTagTheme: _$YgTagTheme.informativeTagTheme[0],
    negativeTagTheme: _$YgTagTheme.negativeTagTheme[0],
    neutralTagTheme: _$YgTagTheme.neutralTagTheme[0],
    paddingMedium: _$YgTagTheme.paddingMedium[0],
    paddingSmall: _$YgTagTheme.paddingSmall[0],
    positiveTagTheme: _$YgTagTheme.positiveTagTheme[0],
    warningTagTheme: _$YgTagTheme.warningTagTheme[0],
  );

  static final YgTagTheme consumerDark = YgTagTheme(
    borderRadius: _$YgTagTheme.borderRadius[1],
    borderWidth: _$YgTagTheme.borderWidth[1],
    iconSpacing: _$YgTagTheme.iconSpacing[1],
    informativeTagTheme: _$YgTagTheme.informativeTagTheme[1],
    negativeTagTheme: _$YgTagTheme.negativeTagTheme[1],
    neutralTagTheme: _$YgTagTheme.neutralTagTheme[1],
    paddingMedium: _$YgTagTheme.paddingMedium[1],
    paddingSmall: _$YgTagTheme.paddingSmall[1],
    positiveTagTheme: _$YgTagTheme.positiveTagTheme[1],
    warningTagTheme: _$YgTagTheme.warningTagTheme[1],
  );

  static final YgTagTheme professionalLight = YgTagTheme(
    borderRadius: _$YgTagTheme.borderRadius[2],
    borderWidth: _$YgTagTheme.borderWidth[2],
    iconSpacing: _$YgTagTheme.iconSpacing[2],
    informativeTagTheme: _$YgTagTheme.informativeTagTheme[2],
    negativeTagTheme: _$YgTagTheme.negativeTagTheme[2],
    neutralTagTheme: _$YgTagTheme.neutralTagTheme[2],
    paddingMedium: _$YgTagTheme.paddingMedium[2],
    paddingSmall: _$YgTagTheme.paddingSmall[2],
    positiveTagTheme: _$YgTagTheme.positiveTagTheme[2],
    warningTagTheme: _$YgTagTheme.warningTagTheme[2],
  );

  static final YgTagTheme professionalDark = YgTagTheme(
    borderRadius: _$YgTagTheme.borderRadius[3],
    borderWidth: _$YgTagTheme.borderWidth[3],
    iconSpacing: _$YgTagTheme.iconSpacing[3],
    informativeTagTheme: _$YgTagTheme.informativeTagTheme[3],
    negativeTagTheme: _$YgTagTheme.negativeTagTheme[3],
    neutralTagTheme: _$YgTagTheme.neutralTagTheme[3],
    paddingMedium: _$YgTagTheme.paddingMedium[3],
    paddingSmall: _$YgTagTheme.paddingSmall[3],
    positiveTagTheme: _$YgTagTheme.positiveTagTheme[3],
    warningTagTheme: _$YgTagTheme.warningTagTheme[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgTagTheme copyWith({
    BorderRadius? borderRadius,
    double? borderWidth,
    double? iconSpacing,
    InformativeTagTheme? informativeTagTheme,
    NegativeTagTheme? negativeTagTheme,
    NeutralTagTheme? neutralTagTheme,
    EdgeInsets? paddingMedium,
    EdgeInsets? paddingSmall,
    PositiveTagTheme? positiveTagTheme,
    WarningTagTheme? warningTagTheme,
  }) {
    return YgTagTheme(
      borderRadius: borderRadius ?? this.borderRadius,
      borderWidth: borderWidth ?? this.borderWidth,
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
  YgTagTheme lerp(covariant ThemeExtension<YgTagTheme>? other, double t) {
    if (other is! YgTagTheme) return this as YgTagTheme;
    return YgTagTheme(
      borderRadius: t < 0.5 ? borderRadius : other.borderRadius,
      borderWidth: t < 0.5 ? borderWidth : other.borderWidth,
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
            other is YgTagTheme &&
            const DeepCollectionEquality()
                .equals(borderRadius, other.borderRadius) &&
            const DeepCollectionEquality()
                .equals(borderWidth, other.borderWidth) &&
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
