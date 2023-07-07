// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'internal.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgInternalThemes extends ThemeExtension<YgInternalThemes> {
  const YgInternalThemes({
    required this.scrollShadow,
  });

  final YgScrollShadowThemes scrollShadow;

  static final YgInternalThemes consumerLight = YgInternalThemes(
    scrollShadow: _$YgInternalThemes.scrollShadow[0],
  );

  static final YgInternalThemes consumerDark = YgInternalThemes(
    scrollShadow: _$YgInternalThemes.scrollShadow[1],
  );

  static final YgInternalThemes professionalLight = YgInternalThemes(
    scrollShadow: _$YgInternalThemes.scrollShadow[2],
  );

  static final YgInternalThemes professionalDark = YgInternalThemes(
    scrollShadow: _$YgInternalThemes.scrollShadow[3],
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
      scrollShadow: scrollShadow ?? this.scrollShadow,
    );
  }

  @override
  YgInternalThemes lerp(
      covariant ThemeExtension<YgInternalThemes>? other, double t) {
    if (other is! YgInternalThemes) return this as YgInternalThemes;
    return YgInternalThemes(
      scrollShadow:
          scrollShadow.lerp(other.scrollShadow, t) as YgScrollShadowThemes,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgInternalThemes &&
            const DeepCollectionEquality()
                .equals(scrollShadow, other.scrollShadow));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(scrollShadow),
    );
  }
}
