// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'tokens.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgTokens extends ThemeExtension<YgTokens> {
  const YgTokens({
    required this.borders,
    required this.colors,
    required this.dimensions,
    required this.gradients,
    required this.radii,
    required this.shadows,
    required this.textStyles,
  });

  final YgBorder borders;
  final YgColor colors;
  final YgDimension dimensions;
  final YgGradient gradients;
  final YgRadius radii;
  final YgShadow shadows;
  final YgTextStyle textStyles;

  static final YgTokens consumerLight = YgTokens(
    borders: _$YgTokens.borders[0],
    colors: _$YgTokens.colors[0],
    dimensions: _$YgTokens.dimensions[0],
    gradients: _$YgTokens.gradients[0],
    radii: _$YgTokens.radii[0],
    shadows: _$YgTokens.shadows[0],
    textStyles: _$YgTokens.textStyles[0],
  );

  static final YgTokens consumerDark = YgTokens(
    borders: _$YgTokens.borders[1],
    colors: _$YgTokens.colors[1],
    dimensions: _$YgTokens.dimensions[1],
    gradients: _$YgTokens.gradients[1],
    radii: _$YgTokens.radii[1],
    shadows: _$YgTokens.shadows[1],
    textStyles: _$YgTokens.textStyles[1],
  );

  static final YgTokens professionalLight = YgTokens(
    borders: _$YgTokens.borders[2],
    colors: _$YgTokens.colors[2],
    dimensions: _$YgTokens.dimensions[2],
    gradients: _$YgTokens.gradients[2],
    radii: _$YgTokens.radii[2],
    shadows: _$YgTokens.shadows[2],
    textStyles: _$YgTokens.textStyles[2],
  );

  static final YgTokens professionalDark = YgTokens(
    borders: _$YgTokens.borders[3],
    colors: _$YgTokens.colors[3],
    dimensions: _$YgTokens.dimensions[3],
    gradients: _$YgTokens.gradients[3],
    radii: _$YgTokens.radii[3],
    shadows: _$YgTokens.shadows[3],
    textStyles: _$YgTokens.textStyles[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgTokens copyWith({
    YgBorder? borders,
    YgColor? colors,
    YgDimension? dimensions,
    YgGradient? gradients,
    YgRadius? radii,
    YgShadow? shadows,
    YgTextStyle? textStyles,
  }) {
    return YgTokens(
      borders: borders ?? this.borders,
      colors: colors ?? this.colors,
      dimensions: dimensions ?? this.dimensions,
      gradients: gradients ?? this.gradients,
      radii: radii ?? this.radii,
      shadows: shadows ?? this.shadows,
      textStyles: textStyles ?? this.textStyles,
    );
  }

  @override
  YgTokens lerp(covariant ThemeExtension<YgTokens>? other, double t) {
    if (other is! YgTokens) return this as YgTokens;
    return YgTokens(
      borders: borders.lerp(other.borders, t) as YgBorder,
      colors: colors.lerp(other.colors, t) as YgColor,
      dimensions: dimensions.lerp(other.dimensions, t) as YgDimension,
      gradients: gradients.lerp(other.gradients, t) as YgGradient,
      radii: radii.lerp(other.radii, t) as YgRadius,
      shadows: shadows.lerp(other.shadows, t) as YgShadow,
      textStyles: textStyles.lerp(other.textStyles, t) as YgTextStyle,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgTokens &&
            const DeepCollectionEquality().equals(borders, other.borders) &&
            const DeepCollectionEquality().equals(colors, other.colors) &&
            const DeepCollectionEquality().equals(dimensions, other.dimensions) &&
            const DeepCollectionEquality().equals(gradients, other.gradients) &&
            const DeepCollectionEquality().equals(radii, other.radii) &&
            const DeepCollectionEquality().equals(shadows, other.shadows) &&
            const DeepCollectionEquality().equals(textStyles, other.textStyles));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(borders),
      const DeepCollectionEquality().hash(colors),
      const DeepCollectionEquality().hash(dimensions),
      const DeepCollectionEquality().hash(gradients),
      const DeepCollectionEquality().hash(radii),
      const DeepCollectionEquality().hash(shadows),
      const DeepCollectionEquality().hash(textStyles),
    );
  }
}
