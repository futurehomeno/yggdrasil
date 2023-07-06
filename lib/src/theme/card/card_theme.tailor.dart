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
    required this.elevatedBackgroundColor,
    required this.filledBackgroundColor,
    required this.outlinedBackgroundColor,
    required this.outlinedBorderColor,
    required this.verticalCardMargin,
  });

  final BorderRadius borderRadius;
  final Color elevatedBackgroundColor;
  final Color filledBackgroundColor;
  final Color outlinedBackgroundColor;
  final Color outlinedBorderColor;
  final double verticalCardMargin;

  static final YgCardTheme consumerLight = YgCardTheme(
    borderRadius: _$YgCardTheme.borderRadius[0],
    elevatedBackgroundColor: _$YgCardTheme.elevatedBackgroundColor[0],
    filledBackgroundColor: _$YgCardTheme.filledBackgroundColor[0],
    outlinedBackgroundColor: _$YgCardTheme.outlinedBackgroundColor[0],
    outlinedBorderColor: _$YgCardTheme.outlinedBorderColor[0],
    verticalCardMargin: _$YgCardTheme.verticalCardMargin[0],
  );

  static final YgCardTheme consumerDark = YgCardTheme(
    borderRadius: _$YgCardTheme.borderRadius[1],
    elevatedBackgroundColor: _$YgCardTheme.elevatedBackgroundColor[1],
    filledBackgroundColor: _$YgCardTheme.filledBackgroundColor[1],
    outlinedBackgroundColor: _$YgCardTheme.outlinedBackgroundColor[1],
    outlinedBorderColor: _$YgCardTheme.outlinedBorderColor[1],
    verticalCardMargin: _$YgCardTheme.verticalCardMargin[1],
  );

  static final YgCardTheme professionalLight = YgCardTheme(
    borderRadius: _$YgCardTheme.borderRadius[2],
    elevatedBackgroundColor: _$YgCardTheme.elevatedBackgroundColor[2],
    filledBackgroundColor: _$YgCardTheme.filledBackgroundColor[2],
    outlinedBackgroundColor: _$YgCardTheme.outlinedBackgroundColor[2],
    outlinedBorderColor: _$YgCardTheme.outlinedBorderColor[2],
    verticalCardMargin: _$YgCardTheme.verticalCardMargin[2],
  );

  static final YgCardTheme professionalDark = YgCardTheme(
    borderRadius: _$YgCardTheme.borderRadius[3],
    elevatedBackgroundColor: _$YgCardTheme.elevatedBackgroundColor[3],
    filledBackgroundColor: _$YgCardTheme.filledBackgroundColor[3],
    outlinedBackgroundColor: _$YgCardTheme.outlinedBackgroundColor[3],
    outlinedBorderColor: _$YgCardTheme.outlinedBorderColor[3],
    verticalCardMargin: _$YgCardTheme.verticalCardMargin[3],
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
    Color? elevatedBackgroundColor,
    Color? filledBackgroundColor,
    Color? outlinedBackgroundColor,
    Color? outlinedBorderColor,
    double? verticalCardMargin,
  }) {
    return YgCardTheme(
      borderRadius: borderRadius ?? this.borderRadius,
      elevatedBackgroundColor:
          elevatedBackgroundColor ?? this.elevatedBackgroundColor,
      filledBackgroundColor:
          filledBackgroundColor ?? this.filledBackgroundColor,
      outlinedBackgroundColor:
          outlinedBackgroundColor ?? this.outlinedBackgroundColor,
      outlinedBorderColor: outlinedBorderColor ?? this.outlinedBorderColor,
      verticalCardMargin: verticalCardMargin ?? this.verticalCardMargin,
    );
  }

  @override
  YgCardTheme lerp(covariant ThemeExtension<YgCardTheme>? other, double t) {
    if (other is! YgCardTheme) return this as YgCardTheme;
    return YgCardTheme(
      borderRadius: t < 0.5 ? borderRadius : other.borderRadius,
      elevatedBackgroundColor: Color.lerp(
          elevatedBackgroundColor, other.elevatedBackgroundColor, t)!,
      filledBackgroundColor:
          Color.lerp(filledBackgroundColor, other.filledBackgroundColor, t)!,
      outlinedBackgroundColor: Color.lerp(
          outlinedBackgroundColor, other.outlinedBackgroundColor, t)!,
      outlinedBorderColor:
          Color.lerp(outlinedBorderColor, other.outlinedBorderColor, t)!,
      verticalCardMargin:
          t < 0.5 ? verticalCardMargin : other.verticalCardMargin,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgCardTheme &&
            const DeepCollectionEquality()
                .equals(borderRadius, other.borderRadius) &&
            const DeepCollectionEquality().equals(
                elevatedBackgroundColor, other.elevatedBackgroundColor) &&
            const DeepCollectionEquality()
                .equals(filledBackgroundColor, other.filledBackgroundColor) &&
            const DeepCollectionEquality().equals(
                outlinedBackgroundColor, other.outlinedBackgroundColor) &&
            const DeepCollectionEquality()
                .equals(outlinedBorderColor, other.outlinedBorderColor) &&
            const DeepCollectionEquality()
                .equals(verticalCardMargin, other.verticalCardMargin));
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
      const DeepCollectionEquality().hash(verticalCardMargin),
    );
  }
}
