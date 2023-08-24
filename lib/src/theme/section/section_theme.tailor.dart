// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'section_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgSectionTheme extends ThemeExtension<YgSectionTheme> {
  const YgSectionTheme({
    required this.padding,
    required this.sectionHeader,
  });

  final EdgeInsets padding;
  final YgSectionHeaderTheme sectionHeader;

  static final YgSectionTheme consumerLight = YgSectionTheme(
    padding: _$YgSectionTheme.padding[0],
    sectionHeader: _$YgSectionTheme.sectionHeader[0],
  );

  static final YgSectionTheme consumerDark = YgSectionTheme(
    padding: _$YgSectionTheme.padding[1],
    sectionHeader: _$YgSectionTheme.sectionHeader[1],
  );

  static final YgSectionTheme professionalLight = YgSectionTheme(
    padding: _$YgSectionTheme.padding[2],
    sectionHeader: _$YgSectionTheme.sectionHeader[2],
  );

  static final YgSectionTheme professionalDark = YgSectionTheme(
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
    EdgeInsets? padding,
    YgSectionHeaderTheme? sectionHeader,
  }) {
    return YgSectionTheme(
      padding: padding ?? this.padding,
      sectionHeader: sectionHeader ?? this.sectionHeader,
    );
  }

  @override
  YgSectionTheme lerp(
      covariant ThemeExtension<YgSectionTheme>? other, double t) {
    if (other is! YgSectionTheme) return this as YgSectionTheme;
    return YgSectionTheme(
      padding: t < 0.5 ? padding : other.padding,
      sectionHeader:
          sectionHeader.lerp(other.sectionHeader, t) as YgSectionHeaderTheme,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgSectionTheme &&
            const DeepCollectionEquality().equals(padding, other.padding) &&
            const DeepCollectionEquality()
                .equals(sectionHeader, other.sectionHeader));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(padding),
      const DeepCollectionEquality().hash(sectionHeader),
    );
  }
}
