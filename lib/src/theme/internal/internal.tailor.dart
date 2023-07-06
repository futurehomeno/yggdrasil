// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'internal.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgInternalThemes extends ThemeExtension<YgInternalThemes> {
  const YgInternalThemes({
    required this.scrollShadowThemes,
  });

  final YgScrollShadowThemes scrollShadowThemes;

  static final YgInternalThemes consumerLight = YgInternalThemes(
    scrollShadowThemes: _$YgInternalTheme.scrollShadow[0],
  );

  static final YgInternalThemes consumerDark = YgInternalThemes(
    scrollShadowThemes: _$YgInternalTheme.scrollShadow[1],
  );

  static final YgInternalThemes professionalLight = YgInternalThemes(
    scrollShadowThemes: _$YgInternalTheme.scrollShadow[2],
  );

  static final YgInternalThemes professionalDark = YgInternalThemes(
    scrollShadowThemes: _$YgInternalTheme.scrollShadow[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgInternalThemes copyWith({
    YgScrollShadowThemes? scrollShadow,
  }) {
    return YgInternalThemes(
      scrollShadowThemes: scrollShadow ?? this.scrollShadowThemes,
    );
  }

  @override
  YgInternalThemes lerp(covariant ThemeExtension<YgInternalThemes>? other, double t) {
    if (other is! YgInternalThemes) return this as YgInternalThemes;
    return YgInternalThemes(
      scrollShadowThemes: scrollShadowThemes.lerp(other.scrollShadowThemes, t) as YgScrollShadowThemes,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgInternalThemes &&
            const DeepCollectionEquality().equals(scrollShadowThemes, other.scrollShadowThemes));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(scrollShadowThemes),
    );
  }
}
