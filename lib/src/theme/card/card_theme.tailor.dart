// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'card_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgCardTheme extends ThemeExtension<YgCardTheme> {
  const YgCardTheme({
    required this.borderRadius,
    required this.elevatedCardTheme,
    required this.elevation,
    required this.filledCardTheme,
    required this.outlinedCardTheme,
  });

  final BorderRadius borderRadius;
  final ElevatedCardTheme elevatedCardTheme;
  final double elevation;
  final FilledCardTheme filledCardTheme;
  final OutlinedCardTheme outlinedCardTheme;

  static final YgCardTheme consumerLight = YgCardTheme(
    borderRadius: _$YgCardTheme.borderRadius[0],
    elevatedCardTheme: _$YgCardTheme.elevatedCardTheme[0],
    elevation: _$YgCardTheme.elevation[0],
    filledCardTheme: _$YgCardTheme.filledCardTheme[0],
    outlinedCardTheme: _$YgCardTheme.outlinedCardTheme[0],
  );

  static final YgCardTheme consumerDark = YgCardTheme(
    borderRadius: _$YgCardTheme.borderRadius[1],
    elevatedCardTheme: _$YgCardTheme.elevatedCardTheme[1],
    elevation: _$YgCardTheme.elevation[1],
    filledCardTheme: _$YgCardTheme.filledCardTheme[1],
    outlinedCardTheme: _$YgCardTheme.outlinedCardTheme[1],
  );

  static final YgCardTheme professionalLight = YgCardTheme(
    borderRadius: _$YgCardTheme.borderRadius[2],
    elevatedCardTheme: _$YgCardTheme.elevatedCardTheme[2],
    elevation: _$YgCardTheme.elevation[2],
    filledCardTheme: _$YgCardTheme.filledCardTheme[2],
    outlinedCardTheme: _$YgCardTheme.outlinedCardTheme[2],
  );

  static final YgCardTheme professionalDark = YgCardTheme(
    borderRadius: _$YgCardTheme.borderRadius[3],
    elevatedCardTheme: _$YgCardTheme.elevatedCardTheme[3],
    elevation: _$YgCardTheme.elevation[3],
    filledCardTheme: _$YgCardTheme.filledCardTheme[3],
    outlinedCardTheme: _$YgCardTheme.outlinedCardTheme[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgCardTheme copyWith({
    BorderRadius? borderRadius,
    ElevatedCardTheme? elevatedCardTheme,
    double? elevation,
    FilledCardTheme? filledCardTheme,
    OutlinedCardTheme? outlinedCardTheme,
  }) {
    return YgCardTheme(
      borderRadius: borderRadius ?? this.borderRadius,
      elevatedCardTheme: elevatedCardTheme ?? this.elevatedCardTheme,
      elevation: elevation ?? this.elevation,
      filledCardTheme: filledCardTheme ?? this.filledCardTheme,
      outlinedCardTheme: outlinedCardTheme ?? this.outlinedCardTheme,
    );
  }

  @override
  YgCardTheme lerp(covariant ThemeExtension<YgCardTheme>? other, double t) {
    if (other is! YgCardTheme) return this as YgCardTheme;
    return YgCardTheme(
      borderRadius: t < 0.5 ? borderRadius : other.borderRadius,
      elevatedCardTheme: elevatedCardTheme.lerp(other.elevatedCardTheme, t)
          as ElevatedCardTheme,
      elevation: t < 0.5 ? elevation : other.elevation,
      filledCardTheme:
          filledCardTheme.lerp(other.filledCardTheme, t) as FilledCardTheme,
      outlinedCardTheme: outlinedCardTheme.lerp(other.outlinedCardTheme, t)
          as OutlinedCardTheme,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgCardTheme &&
            const DeepCollectionEquality()
                .equals(borderRadius, other.borderRadius) &&
            const DeepCollectionEquality()
                .equals(elevatedCardTheme, other.elevatedCardTheme) &&
            const DeepCollectionEquality().equals(elevation, other.elevation) &&
            const DeepCollectionEquality()
                .equals(filledCardTheme, other.filledCardTheme) &&
            const DeepCollectionEquality()
                .equals(outlinedCardTheme, other.outlinedCardTheme));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(borderRadius),
      const DeepCollectionEquality().hash(elevatedCardTheme),
      const DeepCollectionEquality().hash(elevation),
      const DeepCollectionEquality().hash(filledCardTheme),
      const DeepCollectionEquality().hash(outlinedCardTheme),
    );
  }
}
