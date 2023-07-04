// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'yg_dimensions.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgDimension extends ThemeExtension<YgDimension> {
  const YgDimension({
    required this.lg,
    required this.md,
    required this.none,
    required this.sm,
    required this.xl,
    required this.xs,
    required this.xxl,
    required this.xxs,
  });

  final double lg;
  final double md;
  final double none;
  final double sm;
  final double xl;
  final double xs;
  final double xxl;
  final double xxs;

  static final YgDimension consumerLight = YgDimension(
    lg: _$YgDimension.lg[0],
    md: _$YgDimension.md[0],
    none: _$YgDimension.none[0],
    sm: _$YgDimension.sm[0],
    xl: _$YgDimension.xl[0],
    xs: _$YgDimension.xs[0],
    xxl: _$YgDimension.xxl[0],
    xxs: _$YgDimension.xxs[0],
  );

  static final YgDimension consumerDark = YgDimension(
    lg: _$YgDimension.lg[1],
    md: _$YgDimension.md[1],
    none: _$YgDimension.none[1],
    sm: _$YgDimension.sm[1],
    xl: _$YgDimension.xl[1],
    xs: _$YgDimension.xs[1],
    xxl: _$YgDimension.xxl[1],
    xxs: _$YgDimension.xxs[1],
  );

  static final YgDimension professionalLight = YgDimension(
    lg: _$YgDimension.lg[2],
    md: _$YgDimension.md[2],
    none: _$YgDimension.none[2],
    sm: _$YgDimension.sm[2],
    xl: _$YgDimension.xl[2],
    xs: _$YgDimension.xs[2],
    xxl: _$YgDimension.xxl[2],
    xxs: _$YgDimension.xxs[2],
  );

  static final YgDimension professionalDark = YgDimension(
    lg: _$YgDimension.lg[3],
    md: _$YgDimension.md[3],
    none: _$YgDimension.none[3],
    sm: _$YgDimension.sm[3],
    xl: _$YgDimension.xl[3],
    xs: _$YgDimension.xs[3],
    xxl: _$YgDimension.xxl[3],
    xxs: _$YgDimension.xxs[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgDimension copyWith({
    double? lg,
    double? md,
    double? none,
    double? sm,
    double? xl,
    double? xs,
    double? xxl,
    double? xxs,
  }) {
    return YgDimension(
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
  YgDimension lerp(covariant ThemeExtension<YgDimension>? other, double t) {
    if (other is! YgDimension) return this as YgDimension;
    return YgDimension(
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
            other is YgDimension &&
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
