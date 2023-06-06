// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'internal.dart';

// **************************************************************************
// ThemeTailorGenerator
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
  YgInternalTheme lerp(ThemeExtension<YgInternalTheme>? other, double t) {
    if (other is! YgInternalTheme) return this;
    return YgInternalTheme(
      scrollShadow: scrollShadow.lerp(other.scrollShadow, t),
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgInternalTheme &&
            const DeepCollectionEquality()
                .equals(scrollShadow, other.scrollShadow));
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType, const DeepCollectionEquality().hash(scrollShadow));
  }
}
