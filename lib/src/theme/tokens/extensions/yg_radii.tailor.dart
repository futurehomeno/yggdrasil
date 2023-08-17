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

  static const final YgRadius consumerLight = YgRadius(
    lg: _$YgRadius.lg[0],
    md: _$YgRadius.md[0],
    none: _$YgRadius.none[0],
    sm: _$YgRadius.sm[0],
    xl: _$YgRadius.xl[0],
    xs: _$YgRadius.xs[0],
    xxl: _$YgRadius.xxl[0],
    xxs: _$YgRadius.xxs[0],
  );

  static const final YgRadius consumerDark = YgRadius(
    lg: _$YgRadius.lg[1],
    md: _$YgRadius.md[1],
    none: _$YgRadius.none[1],
    sm: _$YgRadius.sm[1],
    xl: _$YgRadius.xl[1],
    xs: _$YgRadius.xs[1],
    xxl: _$YgRadius.xxl[1],
    xxs: _$YgRadius.xxs[1],
  );

  static const final YgRadius professionalLight = YgRadius(
    lg: _$YgRadius.lg[2],
    md: _$YgRadius.md[2],
    none: _$YgRadius.none[2],
    sm: _$YgRadius.sm[2],
    xl: _$YgRadius.xl[2],
    xs: _$YgRadius.xs[2],
    xxl: _$YgRadius.xxl[2],
    xxs: _$YgRadius.xxs[2],
  );

  static const final YgRadius professionalDark = YgRadius(
    lg: _$YgRadius.lg[3],
    md: _$YgRadius.md[3],
    none: _$YgRadius.none[3],
    sm: _$YgRadius.sm[3],
    xl: _$YgRadius.xl[3],
    xs: _$YgRadius.xs[3],
    xxl: _$YgRadius.xxl[3],
    xxs: _$YgRadius.xxs[3],
  );

  static const final themes = [
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
