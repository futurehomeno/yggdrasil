// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'avatar_stack_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgAvatarStackTheme extends ThemeExtension<YgAvatarStackTheme> {
  const YgAvatarStackTheme({
    required this.overlapDistance,
  });

  final double overlapDistance;

  static final YgAvatarStackTheme consumerLight = YgAvatarStackTheme(
    overlapDistance: _$YgAvatarStackTheme.overlapDistance[0],
  );

  static final YgAvatarStackTheme consumerDark = YgAvatarStackTheme(
    overlapDistance: _$YgAvatarStackTheme.overlapDistance[1],
  );

  static final YgAvatarStackTheme professionalLight = YgAvatarStackTheme(
    overlapDistance: _$YgAvatarStackTheme.overlapDistance[2],
  );

  static final YgAvatarStackTheme professionalDark = YgAvatarStackTheme(
    overlapDistance: _$YgAvatarStackTheme.overlapDistance[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgAvatarStackTheme copyWith({
    double? overlapDistance,
  }) {
    return YgAvatarStackTheme(
      overlapDistance: overlapDistance ?? this.overlapDistance,
    );
  }

  @override
  YgAvatarStackTheme lerp(covariant ThemeExtension<YgAvatarStackTheme>? other, double t) {
    if (other is! YgAvatarStackTheme) return this as YgAvatarStackTheme;
    return YgAvatarStackTheme(
      overlapDistance: t < 0.5 ? overlapDistance : other.overlapDistance,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgAvatarStackTheme &&
            const DeepCollectionEquality().equals(overlapDistance, other.overlapDistance));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(overlapDistance),
    );
  }
}
