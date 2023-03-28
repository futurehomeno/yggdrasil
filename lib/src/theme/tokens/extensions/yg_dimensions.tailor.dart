// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'yg_dimensions.dart';

// **************************************************************************
// ThemeTailorGenerator
// **************************************************************************

class YgDimension extends ThemeExtension<YgDimension> {
  const YgDimension({
    required this.none,
    required this.xxs,
    required this.xs,
    required this.sm,
    required this.md,
    required this.lg,
    required this.xl,
    required this.xxl,
  });

  final double none;
  final double xxs;
  final double xs;
  final double sm;
  final double md;
  final double lg;
  final double xl;
  final double xxl;

  static final YgDimension consumerLight = YgDimension(
    none: _$YgDimension.none[0],
    xxs: _$YgDimension.xxs[0],
    xs: _$YgDimension.xs[0],
    sm: _$YgDimension.sm[0],
    md: _$YgDimension.md[0],
    lg: _$YgDimension.lg[0],
    xl: _$YgDimension.xl[0],
    xxl: _$YgDimension.xxl[0],
  );

  static final YgDimension consumerDark = YgDimension(
    none: _$YgDimension.none[1],
    xxs: _$YgDimension.xxs[1],
    xs: _$YgDimension.xs[1],
    sm: _$YgDimension.sm[1],
    md: _$YgDimension.md[1],
    lg: _$YgDimension.lg[1],
    xl: _$YgDimension.xl[1],
    xxl: _$YgDimension.xxl[1],
  );

  static final YgDimension professionalLight = YgDimension(
    none: _$YgDimension.none[2],
    xxs: _$YgDimension.xxs[2],
    xs: _$YgDimension.xs[2],
    sm: _$YgDimension.sm[2],
    md: _$YgDimension.md[2],
    lg: _$YgDimension.lg[2],
    xl: _$YgDimension.xl[2],
    xxl: _$YgDimension.xxl[2],
  );

  static final YgDimension professionalDark = YgDimension(
    none: _$YgDimension.none[3],
    xxs: _$YgDimension.xxs[3],
    xs: _$YgDimension.xs[3],
    sm: _$YgDimension.sm[3],
    md: _$YgDimension.md[3],
    lg: _$YgDimension.lg[3],
    xl: _$YgDimension.xl[3],
    xxl: _$YgDimension.xxl[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgDimension copyWith({
    double? none,
    double? xxs,
    double? xs,
    double? sm,
    double? md,
    double? lg,
    double? xl,
    double? xxl,
  }) {
    return YgDimension(
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
  YgDimension lerp(ThemeExtension<YgDimension>? other, double t) {
    if (other is! YgDimension) return this;
    return YgDimension(
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
            other is YgDimension &&
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
