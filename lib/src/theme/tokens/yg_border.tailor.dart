// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'yg_border.dart';

// **************************************************************************
// ThemeTailorGenerator
// **************************************************************************

class YgBorder extends ThemeExtension<YgBorder> {
  const YgBorder({
    required this.none,
    required this.sm,
    required this.md,
    required this.lg,
  });

  final Border none;
  final Border sm;
  final Border md;
  final Border lg;

  static final YgBorder consumerLight = YgBorder(
    none: _$YgBorder.none[0],
    sm: _$YgBorder.sm[0],
    md: _$YgBorder.md[0],
    lg: _$YgBorder.lg[0],
  );

  static final YgBorder consumerDark = YgBorder(
    none: _$YgBorder.none[1],
    sm: _$YgBorder.sm[1],
    md: _$YgBorder.md[1],
    lg: _$YgBorder.lg[1],
  );

  static final YgBorder professionalLight = YgBorder(
    none: _$YgBorder.none[2],
    sm: _$YgBorder.sm[2],
    md: _$YgBorder.md[2],
    lg: _$YgBorder.lg[2],
  );

  static final YgBorder professionalDark = YgBorder(
    none: _$YgBorder.none[3],
    sm: _$YgBorder.sm[3],
    md: _$YgBorder.md[3],
    lg: _$YgBorder.lg[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgBorder copyWith({
    Border? none,
    Border? sm,
    Border? md,
    Border? lg,
  }) {
    return YgBorder(
      none: none ?? this.none,
      sm: sm ?? this.sm,
      md: md ?? this.md,
      lg: lg ?? this.lg,
    );
  }

  @override
  YgBorder lerp(ThemeExtension<YgBorder>? other, double t) {
    if (other is! YgBorder) return this;
    return YgBorder(
      none: t < 0.5 ? none : other.none,
      sm: t < 0.5 ? sm : other.sm,
      md: t < 0.5 ? md : other.md,
      lg: t < 0.5 ? lg : other.lg,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgBorder &&
            const DeepCollectionEquality().equals(none, other.none) &&
            const DeepCollectionEquality().equals(sm, other.sm) &&
            const DeepCollectionEquality().equals(md, other.md) &&
            const DeepCollectionEquality().equals(lg, other.lg));
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        const DeepCollectionEquality().hash(none),
        const DeepCollectionEquality().hash(sm),
        const DeepCollectionEquality().hash(md),
        const DeepCollectionEquality().hash(lg));
  }
}
