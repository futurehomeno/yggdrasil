// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'internal.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgInternalTheme extends ThemeExtension<YgInternalTheme> {
  const YgInternalTheme({
    required this.scrollShadow,
  });

  final YgScrollShadowThemes scrollShadow;

  static final YgInternalTheme consumerLight = YgInternalTheme(
    scrollShadow: _$YgInternalTheme.scrollShadow[0],
  );

  static final YgInternalTheme consumerDark = YgInternalTheme(
    scrollShadow: _$YgInternalTheme.scrollShadow[1],
  );

  static final YgInternalTheme professionalLight = YgInternalTheme(
    scrollShadow: _$YgInternalTheme.scrollShadow[2],
  );

  static final YgInternalTheme professionalDark = YgInternalTheme(
    scrollShadow: _$YgInternalTheme.scrollShadow[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgInternalTheme copyWith({
    YgScrollShadowThemes? scrollShadow,
  }) {
    return YgInternalTheme(
      scrollShadow: scrollShadow ?? this.scrollShadow,
    );
  }

  @override
  YgInternalTheme lerp(covariant ThemeExtension<YgInternalTheme>? other, double t) {
    if (other is! YgInternalTheme) return this as YgInternalTheme;
    return YgInternalTheme(
      scrollShadow: scrollShadow.lerp(other.scrollShadow, t) as YgScrollShadowThemes,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgInternalTheme &&
            const DeepCollectionEquality().equals(scrollShadow, other.scrollShadow));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(scrollShadow),
    );
  }
}
