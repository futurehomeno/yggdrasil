// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'yg_border.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgBorder extends ThemeExtension<YgBorder> {
  const YgBorder({
    required this.lg,
    required this.md,
    required this.none,
    required this.sm,
  });

  final Border lg;
  final Border md;
  final Border none;
  final Border sm;

  static final YgBorder consumerLight = YgBorder(
    lg: _$YgBorder.lg[0],
    md: _$YgBorder.md[0],
    none: _$YgBorder.none[0],
    sm: _$YgBorder.sm[0],
  );

  static final YgBorder consumerDark = YgBorder(
    lg: _$YgBorder.lg[1],
    md: _$YgBorder.md[1],
    none: _$YgBorder.none[1],
    sm: _$YgBorder.sm[1],
  );

  static final YgBorder professionalLight = YgBorder(
    lg: _$YgBorder.lg[2],
    md: _$YgBorder.md[2],
    none: _$YgBorder.none[2],
    sm: _$YgBorder.sm[2],
  );

  static final YgBorder professionalDark = YgBorder(
    lg: _$YgBorder.lg[3],
    md: _$YgBorder.md[3],
    none: _$YgBorder.none[3],
    sm: _$YgBorder.sm[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgBorder copyWith({
    Border? lg,
    Border? md,
    Border? none,
    Border? sm,
  }) {
    return YgBorder(
      lg: lg ?? this.lg,
      md: md ?? this.md,
      none: none ?? this.none,
      sm: sm ?? this.sm,
    );
  }

  @override
  YgBorder lerp(covariant ThemeExtension<YgBorder>? other, double t) {
    if (other is! YgBorder) return this as YgBorder;
    return YgBorder(
      lg: t < 0.5 ? lg : other.lg,
      md: t < 0.5 ? md : other.md,
      none: t < 0.5 ? none : other.none,
      sm: t < 0.5 ? sm : other.sm,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgBorder &&
            const DeepCollectionEquality().equals(lg, other.lg) &&
            const DeepCollectionEquality().equals(md, other.md) &&
            const DeepCollectionEquality().equals(none, other.none) &&
            const DeepCollectionEquality().equals(sm, other.sm));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(lg),
      const DeepCollectionEquality().hash(md),
      const DeepCollectionEquality().hash(none),
      const DeepCollectionEquality().hash(sm),
    );
  }
}
