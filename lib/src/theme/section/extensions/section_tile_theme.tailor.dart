// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'section_tile_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgSectionTileTheme extends ThemeExtension<YgSectionTileTheme> {
  const YgSectionTileTheme({
    required this.padding,
    required this.subtitleTextStyle,
    required this.titleSubtitleSpacing,
    required this.titleTextStyle,
  });

  final EdgeInsets padding;
  final TextStyle subtitleTextStyle;
  final double titleSubtitleSpacing;
  final TextStyle titleTextStyle;

  static final YgSectionTileTheme consumerLight = YgSectionTileTheme(
    padding: _$YgSectionTileTheme.padding[0],
    subtitleTextStyle: _$YgSectionTileTheme.subtitleTextStyle[0],
    titleSubtitleSpacing: _$YgSectionTileTheme.titleSubtitleSpacing[0],
    titleTextStyle: _$YgSectionTileTheme.titleTextStyle[0],
  );

  static final YgSectionTileTheme consumerDark = YgSectionTileTheme(
    padding: _$YgSectionTileTheme.padding[1],
    subtitleTextStyle: _$YgSectionTileTheme.subtitleTextStyle[1],
    titleSubtitleSpacing: _$YgSectionTileTheme.titleSubtitleSpacing[1],
    titleTextStyle: _$YgSectionTileTheme.titleTextStyle[1],
  );

  static final YgSectionTileTheme professionalLight = YgSectionTileTheme(
    padding: _$YgSectionTileTheme.padding[2],
    subtitleTextStyle: _$YgSectionTileTheme.subtitleTextStyle[2],
    titleSubtitleSpacing: _$YgSectionTileTheme.titleSubtitleSpacing[2],
    titleTextStyle: _$YgSectionTileTheme.titleTextStyle[2],
  );

  static final YgSectionTileTheme professionalDark = YgSectionTileTheme(
    padding: _$YgSectionTileTheme.padding[3],
    subtitleTextStyle: _$YgSectionTileTheme.subtitleTextStyle[3],
    titleSubtitleSpacing: _$YgSectionTileTheme.titleSubtitleSpacing[3],
    titleTextStyle: _$YgSectionTileTheme.titleTextStyle[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgSectionTileTheme copyWith({
    EdgeInsets? padding,
    TextStyle? subtitleTextStyle,
    double? titleSubtitleSpacing,
    TextStyle? titleTextStyle,
  }) {
    return YgSectionTileTheme(
      padding: padding ?? this.padding,
      subtitleTextStyle: subtitleTextStyle ?? this.subtitleTextStyle,
      titleSubtitleSpacing: titleSubtitleSpacing ?? this.titleSubtitleSpacing,
      titleTextStyle: titleTextStyle ?? this.titleTextStyle,
    );
  }

  @override
  YgSectionTileTheme lerp(
      covariant ThemeExtension<YgSectionTileTheme>? other, double t) {
    if (other is! YgSectionTileTheme) return this as YgSectionTileTheme;
    return YgSectionTileTheme(
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
            other is YgSectionTileTheme &&
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
