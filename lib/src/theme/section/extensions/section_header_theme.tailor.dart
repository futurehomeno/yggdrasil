// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'section_header_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgSectionHeaderTheme extends ThemeExtension<YgSectionHeaderTheme> {
  const YgSectionHeaderTheme({
    required this.padding,
    required this.subtitleTextStyle,
    required this.titleSubtitleSpacing,
    required this.titleTextStyle,
  });

  final EdgeInsets padding;
  final TextStyle subtitleTextStyle;
  final double titleSubtitleSpacing;
  final TextStyle titleTextStyle;

  static final YgSectionHeaderTheme consumerLight = YgSectionHeaderTheme(
    padding: _$YgSectionHeaderTheme.padding[0],
    subtitleTextStyle: _$YgSectionHeaderTheme.subtitleTextStyle[0],
    titleSubtitleSpacing: _$YgSectionHeaderTheme.titleSubtitleSpacing[0],
    titleTextStyle: _$YgSectionHeaderTheme.titleTextStyle[0],
  );

  static final YgSectionHeaderTheme consumerDark = YgSectionHeaderTheme(
    padding: _$YgSectionHeaderTheme.padding[1],
    subtitleTextStyle: _$YgSectionHeaderTheme.subtitleTextStyle[1],
    titleSubtitleSpacing: _$YgSectionHeaderTheme.titleSubtitleSpacing[1],
    titleTextStyle: _$YgSectionHeaderTheme.titleTextStyle[1],
  );

  static final YgSectionHeaderTheme professionalLight = YgSectionHeaderTheme(
    padding: _$YgSectionHeaderTheme.padding[2],
    subtitleTextStyle: _$YgSectionHeaderTheme.subtitleTextStyle[2],
    titleSubtitleSpacing: _$YgSectionHeaderTheme.titleSubtitleSpacing[2],
    titleTextStyle: _$YgSectionHeaderTheme.titleTextStyle[2],
  );

  static final YgSectionHeaderTheme professionalDark = YgSectionHeaderTheme(
    padding: _$YgSectionHeaderTheme.padding[3],
    subtitleTextStyle: _$YgSectionHeaderTheme.subtitleTextStyle[3],
    titleSubtitleSpacing: _$YgSectionHeaderTheme.titleSubtitleSpacing[3],
    titleTextStyle: _$YgSectionHeaderTheme.titleTextStyle[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgSectionHeaderTheme copyWith({
    EdgeInsets? padding,
    TextStyle? subtitleTextStyle,
    double? titleSubtitleSpacing,
    TextStyle? titleTextStyle,
  }) {
    return YgSectionHeaderTheme(
      padding: padding ?? this.padding,
      subtitleTextStyle: subtitleTextStyle ?? this.subtitleTextStyle,
      titleSubtitleSpacing: titleSubtitleSpacing ?? this.titleSubtitleSpacing,
      titleTextStyle: titleTextStyle ?? this.titleTextStyle,
    );
  }

  @override
  YgSectionHeaderTheme lerp(
      covariant ThemeExtension<YgSectionHeaderTheme>? other, double t) {
    if (other is! YgSectionHeaderTheme) return this as YgSectionHeaderTheme;
    return YgSectionHeaderTheme(
      padding: t < 0.5 ? padding : other.padding,
      subtitleTextStyle:
          TextStyle.lerp(subtitleTextStyle, other.subtitleTextStyle, t)!,
      titleSubtitleSpacing:
          t < 0.5 ? titleSubtitleSpacing : other.titleSubtitleSpacing,
      titleTextStyle: TextStyle.lerp(titleTextStyle, other.titleTextStyle, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgSectionHeaderTheme &&
            const DeepCollectionEquality().equals(padding, other.padding) &&
            const DeepCollectionEquality()
                .equals(subtitleTextStyle, other.subtitleTextStyle) &&
            const DeepCollectionEquality()
                .equals(titleSubtitleSpacing, other.titleSubtitleSpacing) &&
            const DeepCollectionEquality()
                .equals(titleTextStyle, other.titleTextStyle));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(padding),
      const DeepCollectionEquality().hash(subtitleTextStyle),
      const DeepCollectionEquality().hash(titleSubtitleSpacing),
      const DeepCollectionEquality().hash(titleTextStyle),
    );
  }
}
