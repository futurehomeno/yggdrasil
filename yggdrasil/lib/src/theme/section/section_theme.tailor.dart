// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'section_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgSectionTheme extends ThemeExtension<YgSectionTheme> {
  const YgSectionTheme({
    required this.animationCurve,
    required this.animationDuration,
    required this.padding,
    required this.sectionHeader,
  });

  final Curve animationCurve;
  final Duration animationDuration;
  final EdgeInsets padding;
  final YgSectionHeaderTheme sectionHeader;

  static final YgSectionTheme consumerLight = YgSectionTheme(
    animationCurve: _$YgSectionTheme.animationCurve[0],
    animationDuration: _$YgSectionTheme.animationDuration[0],
    padding: _$YgSectionTheme.padding[0],
    sectionHeader: _$YgSectionTheme.sectionHeader[0],
  );

  static final YgSectionTheme consumerDark = YgSectionTheme(
    animationCurve: _$YgSectionTheme.animationCurve[1],
    animationDuration: _$YgSectionTheme.animationDuration[1],
    padding: _$YgSectionTheme.padding[1],
    sectionHeader: _$YgSectionTheme.sectionHeader[1],
  );

  static final YgSectionTheme professionalLight = YgSectionTheme(
    animationCurve: _$YgSectionTheme.animationCurve[2],
    animationDuration: _$YgSectionTheme.animationDuration[2],
    padding: _$YgSectionTheme.padding[2],
    sectionHeader: _$YgSectionTheme.sectionHeader[2],
  );

  static final YgSectionTheme professionalDark = YgSectionTheme(
    animationCurve: _$YgSectionTheme.animationCurve[3],
    animationDuration: _$YgSectionTheme.animationDuration[3],
    padding: _$YgSectionTheme.padding[3],
    sectionHeader: _$YgSectionTheme.sectionHeader[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgSectionTheme copyWith({
    Curve? animationCurve,
    Duration? animationDuration,
    EdgeInsets? padding,
    YgSectionHeaderTheme? sectionHeader,
  }) {
    return YgSectionTheme(
      animationCurve: animationCurve ?? this.animationCurve,
      animationDuration: animationDuration ?? this.animationDuration,
      padding: padding ?? this.padding,
      sectionHeader: sectionHeader ?? this.sectionHeader,
    );
  }

  @override
  YgSectionTheme lerp(covariant ThemeExtension<YgSectionTheme>? other, double t) {
    if (other is! YgSectionTheme) return this as YgSectionTheme;
    return YgSectionTheme(
      animationCurve: t < 0.5 ? animationCurve : other.animationCurve,
      animationDuration: t < 0.5 ? animationDuration : other.animationDuration,
      padding: t < 0.5 ? padding : other.padding,
      sectionHeader: sectionHeader.lerp(other.sectionHeader, t) as YgSectionHeaderTheme,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgSectionTheme &&
            const DeepCollectionEquality().equals(animationCurve, other.animationCurve) &&
            const DeepCollectionEquality().equals(animationDuration, other.animationDuration) &&
            const DeepCollectionEquality().equals(padding, other.padding) &&
            const DeepCollectionEquality().equals(sectionHeader, other.sectionHeader));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(animationCurve),
      const DeepCollectionEquality().hash(animationDuration),
      const DeepCollectionEquality().hash(padding),
      const DeepCollectionEquality().hash(sectionHeader),
    );
  }
}
