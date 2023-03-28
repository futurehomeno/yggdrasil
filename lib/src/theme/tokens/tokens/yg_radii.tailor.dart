// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'yg_radii.dart';

// **************************************************************************
// ThemeTailorGenerator
// **************************************************************************

class YgRadius extends ThemeExtension<YgRadius> {
  const YgRadius({
    required this.none,
    required this.xxs,
    required this.xs,
    required this.sm,
    required this.md,
    required this.lg,
    required this.xl,
    required this.xxl,
  });

  final BorderRadius none;
  final BorderRadius xxs;
  final BorderRadius xs;
  final BorderRadius sm;
  final BorderRadius md;
  final BorderRadius lg;
  final BorderRadius xl;
  final BorderRadius xxl;

  static final YgRadius consumerLight = YgRadius(
    none: _$YgRadius.none[0],
    xxs: _$YgRadius.xxs[0],
    xs: _$YgRadius.xs[0],
    sm: _$YgRadius.sm[0],
    md: _$YgRadius.md[0],
    lg: _$YgRadius.lg[0],
    xl: _$YgRadius.xl[0],
    xxl: _$YgRadius.xxl[0],
  );

  static final YgRadius consumerDark = YgRadius(
    none: _$YgRadius.none[1],
    xxs: _$YgRadius.xxs[1],
    xs: _$YgRadius.xs[1],
    sm: _$YgRadius.sm[1],
    md: _$YgRadius.md[1],
    lg: _$YgRadius.lg[1],
    xl: _$YgRadius.xl[1],
    xxl: _$YgRadius.xxl[1],
  );

  static final YgRadius professionalLight = YgRadius(
    none: _$YgRadius.none[2],
    xxs: _$YgRadius.xxs[2],
    xs: _$YgRadius.xs[2],
    sm: _$YgRadius.sm[2],
    md: _$YgRadius.md[2],
    lg: _$YgRadius.lg[2],
    xl: _$YgRadius.xl[2],
    xxl: _$YgRadius.xxl[2],
  );

  static final YgRadius professionalDark = YgRadius(
    none: _$YgRadius.none[3],
    xxs: _$YgRadius.xxs[3],
    xs: _$YgRadius.xs[3],
    sm: _$YgRadius.sm[3],
    md: _$YgRadius.md[3],
    lg: _$YgRadius.lg[3],
    xl: _$YgRadius.xl[3],
    xxl: _$YgRadius.xxl[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgRadius copyWith({
    BorderRadius? none,
    BorderRadius? xxs,
    BorderRadius? xs,
    BorderRadius? sm,
    BorderRadius? md,
    BorderRadius? lg,
    BorderRadius? xl,
    BorderRadius? xxl,
  }) {
    return YgRadius(
      none: none ?? this.none,
      xxs: xxs ?? this.xxs,
      xs: xs ?? this.xs,
      sm: sm ?? this.sm,
      md: md ?? this.md,
      lg: lg ?? this.lg,
      xl: xl ?? this.xl,
      xxl: xxl ?? this.xxl,
    );
  }

  @override
  YgRadius lerp(ThemeExtension<YgRadius>? other, double t) {
    if (other is! YgRadius) return this;
    return YgRadius(
      none: t < 0.5 ? none : other.none,
      xxs: t < 0.5 ? xxs : other.xxs,
      xs: t < 0.5 ? xs : other.xs,
      sm: t < 0.5 ? sm : other.sm,
      md: t < 0.5 ? md : other.md,
      lg: t < 0.5 ? lg : other.lg,
      xl: t < 0.5 ? xl : other.xl,
      xxl: t < 0.5 ? xxl : other.xxl,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgRadius &&
            const DeepCollectionEquality().equals(none, other.none) &&
            const DeepCollectionEquality().equals(xxs, other.xxs) &&
            const DeepCollectionEquality().equals(xs, other.xs) &&
            const DeepCollectionEquality().equals(sm, other.sm) &&
            const DeepCollectionEquality().equals(md, other.md) &&
            const DeepCollectionEquality().equals(lg, other.lg) &&
            const DeepCollectionEquality().equals(xl, other.xl) &&
            const DeepCollectionEquality().equals(xxl, other.xxl));
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        const DeepCollectionEquality().hash(none),
        const DeepCollectionEquality().hash(xxs),
        const DeepCollectionEquality().hash(xs),
        const DeepCollectionEquality().hash(sm),
        const DeepCollectionEquality().hash(md),
        const DeepCollectionEquality().hash(lg),
        const DeepCollectionEquality().hash(xl),
        const DeepCollectionEquality().hash(xxl));
  }
}
