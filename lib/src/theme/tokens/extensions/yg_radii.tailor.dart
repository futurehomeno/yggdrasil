// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'yg_radii.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgRadius extends ThemeExtension<YgRadius> {
  const YgRadius({
    required this.lg,
    required this.md,
    required this.none,
    required this.sm,
    required this.xl,
    required this.xs,
    required this.xxl,
    required this.xxs,
  });

  final BorderRadius lg;
  final BorderRadius md;
  final BorderRadius none;
  final BorderRadius sm;
  final BorderRadius xl;
  final BorderRadius xs;
  final BorderRadius xxl;
  final BorderRadius xxs;

  static const YgRadius consumerLight = YgRadius(
    lg: consumer_light.FhRadii.lg,
    md: consumer_light.FhRadii.md,
    none: consumer_light.FhRadii.none,
    sm: consumer_light.FhRadii.sm,
    xl: consumer_light.FhRadii.xl,
    xs: consumer_light.FhRadii.xs,
    xxl: consumer_light.FhRadii.xxl,
    xxs: consumer_light.FhRadii.xxs,
  );

  static const YgRadius consumerDark = YgRadius(
    lg: consumer_dark.FhRadii.lg,
    md: consumer_dark.FhRadii.md,
    none: consumer_dark.FhRadii.none,
    sm: consumer_dark.FhRadii.sm,
    xl: consumer_dark.FhRadii.xl,
    xs: consumer_dark.FhRadii.xs,
    xxl: consumer_dark.FhRadii.xxl,
    xxs: consumer_dark.FhRadii.xxs,
  );

  static const YgRadius professionalLight = YgRadius(
    lg: professional_light.FhRadii.lg,
    md: professional_light.FhRadii.md,
    none: professional_light.FhRadii.none,
    sm: professional_light.FhRadii.sm,
    xl: professional_light.FhRadii.xl,
    xs: professional_light.FhRadii.xs,
    xxl: professional_light.FhRadii.xxl,
    xxs: professional_light.FhRadii.xxs,
  );

  static const YgRadius professionalDark = YgRadius(
    lg: professional_dark.FhRadii.lg,
    md: professional_dark.FhRadii.md,
    none: professional_dark.FhRadii.none,
    sm: professional_dark.FhRadii.sm,
    xl: professional_dark.FhRadii.xl,
    xs: professional_dark.FhRadii.xs,
    xxl: professional_dark.FhRadii.xxl,
    xxs: professional_dark.FhRadii.xxs,
  );

  static const themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgRadius copyWith({
    BorderRadius? lg,
    BorderRadius? md,
    BorderRadius? none,
    BorderRadius? sm,
    BorderRadius? xl,
    BorderRadius? xs,
    BorderRadius? xxl,
    BorderRadius? xxs,
  }) {
    return YgRadius(
      lg: lg ?? this.lg,
      md: md ?? this.md,
      none: none ?? this.none,
      sm: sm ?? this.sm,
      xl: xl ?? this.xl,
      xs: xs ?? this.xs,
      xxl: xxl ?? this.xxl,
      xxs: xxs ?? this.xxs,
    );
  }

  @override
  YgRadius lerp(covariant ThemeExtension<YgRadius>? other, double t) {
    if (other is! YgRadius) return this as YgRadius;
    return YgRadius(
      lg: t < 0.5 ? lg : other.lg,
      md: t < 0.5 ? md : other.md,
      none: t < 0.5 ? none : other.none,
      sm: t < 0.5 ? sm : other.sm,
      xl: t < 0.5 ? xl : other.xl,
      xs: t < 0.5 ? xs : other.xs,
      xxl: t < 0.5 ? xxl : other.xxl,
      xxs: t < 0.5 ? xxs : other.xxs,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgRadius &&
            const DeepCollectionEquality().equals(lg, other.lg) &&
            const DeepCollectionEquality().equals(md, other.md) &&
            const DeepCollectionEquality().equals(none, other.none) &&
            const DeepCollectionEquality().equals(sm, other.sm) &&
            const DeepCollectionEquality().equals(xl, other.xl) &&
            const DeepCollectionEquality().equals(xs, other.xs) &&
            const DeepCollectionEquality().equals(xxl, other.xxl) &&
            const DeepCollectionEquality().equals(xxs, other.xxs));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(lg),
      const DeepCollectionEquality().hash(md),
      const DeepCollectionEquality().hash(none),
      const DeepCollectionEquality().hash(sm),
      const DeepCollectionEquality().hash(xl),
      const DeepCollectionEquality().hash(xs),
      const DeepCollectionEquality().hash(xxl),
      const DeepCollectionEquality().hash(xxs),
    );
  }
}
