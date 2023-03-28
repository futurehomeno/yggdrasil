// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'yg_shadows.dart';

// **************************************************************************
// ThemeTailorGenerator
// **************************************************************************

class YgShadow extends ThemeExtension<YgShadow> {
  const YgShadow();

  static final YgShadow consumerLight = YgShadow();

  static final YgShadow consumerDark = YgShadow();

  static final YgShadow professionalLight = YgShadow();

  static final YgShadow professionalDark = YgShadow();

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  ThemeExtension<YgShadow> copyWith() => YgShadow();

  @override
  YgShadow lerp(ThemeExtension<YgShadow>? other, double t) {
    if (other is! YgShadow) return this;
    return YgShadow();
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is YgShadow);
  }

  @override
  int get hashCode {
    return runtimeType.hashCode;
  }
}
