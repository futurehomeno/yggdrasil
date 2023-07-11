// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'card_themes.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgCardThemes extends ThemeExtension<YgCardThemes> {
  const YgCardThemes({
    required this.borderRadius,
    required this.elevatedBackgroundColor,
    required this.filledBackgroundColor,
    required this.outlinedBackgroundColor,
    required this.outlinedBorderColor,
  });

  final BorderRadius borderRadius;
  final Color elevatedBackgroundColor;
  final Color filledBackgroundColor;
  final Color outlinedBackgroundColor;
  final Color outlinedBorderColor;

  static final YgCardThemes consumerLight = YgCardThemes(
    borderRadius: _$YgCardThemes.borderRadius[0],
    elevatedBackgroundColor: _$YgCardThemes.elevatedBackgroundColor[0],
    filledBackgroundColor: _$YgCardThemes.filledBackgroundColor[0],
    outlinedBackgroundColor: _$YgCardThemes.outlinedBackgroundColor[0],
    outlinedBorderColor: _$YgCardThemes.outlinedBorderColor[0],
  );

  static final YgCardThemes consumerDark = YgCardThemes(
    borderRadius: _$YgCardThemes.borderRadius[1],
    elevatedBackgroundColor: _$YgCardThemes.elevatedBackgroundColor[1],
    filledBackgroundColor: _$YgCardThemes.filledBackgroundColor[1],
    outlinedBackgroundColor: _$YgCardThemes.outlinedBackgroundColor[1],
    outlinedBorderColor: _$YgCardThemes.outlinedBorderColor[1],
  );

  static final YgCardThemes professionalLight = YgCardThemes(
    borderRadius: _$YgCardThemes.borderRadius[2],
    elevatedBackgroundColor: _$YgCardThemes.elevatedBackgroundColor[2],
    filledBackgroundColor: _$YgCardThemes.filledBackgroundColor[2],
    outlinedBackgroundColor: _$YgCardThemes.outlinedBackgroundColor[2],
    outlinedBorderColor: _$YgCardThemes.outlinedBorderColor[2],
  );

  static final YgCardThemes professionalDark = YgCardThemes(
    borderRadius: _$YgCardThemes.borderRadius[3],
    elevatedBackgroundColor: _$YgCardThemes.elevatedBackgroundColor[3],
    filledBackgroundColor: _$YgCardThemes.filledBackgroundColor[3],
    outlinedBackgroundColor: _$YgCardThemes.outlinedBackgroundColor[3],
    outlinedBorderColor: _$YgCardThemes.outlinedBorderColor[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgCardThemes copyWith({
    BorderRadius? borderRadius,
    Color? elevatedBackgroundColor,
    Color? filledBackgroundColor,
    Color? outlinedBackgroundColor,
    Color? outlinedBorderColor,
  }) {
    return YgCardThemes(
      borderRadius: borderRadius ?? this.borderRadius,
      elevatedBackgroundColor:
          elevatedBackgroundColor ?? this.elevatedBackgroundColor,
      filledBackgroundColor:
          filledBackgroundColor ?? this.filledBackgroundColor,
      outlinedBackgroundColor:
          outlinedBackgroundColor ?? this.outlinedBackgroundColor,
      outlinedBorderColor: outlinedBorderColor ?? this.outlinedBorderColor,
    );
  }

  @override
  YgCardThemes lerp(covariant ThemeExtension<YgCardThemes>? other, double t) {
    if (other is! YgCardThemes) return this as YgCardThemes;
    return YgCardThemes(
      borderRadius: t < 0.5 ? borderRadius : other.borderRadius,
      elevatedBackgroundColor: Color.lerp(
          elevatedBackgroundColor, other.elevatedBackgroundColor, t)!,
      filledBackgroundColor:
          Color.lerp(filledBackgroundColor, other.filledBackgroundColor, t)!,
      outlinedBackgroundColor: Color.lerp(
          outlinedBackgroundColor, other.outlinedBackgroundColor, t)!,
      outlinedBorderColor:
          Color.lerp(outlinedBorderColor, other.outlinedBorderColor, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgCardThemes &&
            const DeepCollectionEquality()
                .equals(borderRadius, other.borderRadius) &&
            const DeepCollectionEquality().equals(
                elevatedBackgroundColor, other.elevatedBackgroundColor) &&
            const DeepCollectionEquality()
                .equals(filledBackgroundColor, other.filledBackgroundColor) &&
            const DeepCollectionEquality().equals(
                outlinedBackgroundColor, other.outlinedBackgroundColor) &&
            const DeepCollectionEquality()
                .equals(outlinedBorderColor, other.outlinedBorderColor));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(borderRadius),
      const DeepCollectionEquality().hash(elevatedBackgroundColor),
      const DeepCollectionEquality().hash(filledBackgroundColor),
      const DeepCollectionEquality().hash(outlinedBackgroundColor),
      const DeepCollectionEquality().hash(outlinedBorderColor),
    );
  }
}
