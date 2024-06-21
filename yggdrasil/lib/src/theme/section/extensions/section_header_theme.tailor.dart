// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'section_header_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgSectionHeaderTheme extends ThemeExtension<YgSectionHeaderTheme> {
  const YgSectionHeaderTheme({
    required this.iconPadding,
    required this.minAvailableTrailingWidth,
    required this.padding,
    required this.subtitlePadding,
    required this.subtitleTextStyle,
    required this.titleTextStyle,
    required this.trailingSpacing,
  });

  final EdgeInsets iconPadding;
  final double minAvailableTrailingWidth;
  final EdgeInsets padding;
  final EdgeInsets subtitlePadding;
  final TextStyle subtitleTextStyle;
  final TextStyle titleTextStyle;
  final double trailingSpacing;

  static final YgSectionHeaderTheme consumerLight = YgSectionHeaderTheme(
    iconPadding: _$YgSectionHeaderTheme.iconPadding[0],
    minAvailableTrailingWidth: _$YgSectionHeaderTheme.minAvailableTrailingWidth[0],
    padding: _$YgSectionHeaderTheme.padding[0],
    subtitlePadding: _$YgSectionHeaderTheme.subtitlePadding[0],
    subtitleTextStyle: _$YgSectionHeaderTheme.subtitleTextStyle[0],
    titleTextStyle: _$YgSectionHeaderTheme.titleTextStyle[0],
    trailingSpacing: _$YgSectionHeaderTheme.trailingSpacing[0],
  );

  static final YgSectionHeaderTheme consumerDark = YgSectionHeaderTheme(
    iconPadding: _$YgSectionHeaderTheme.iconPadding[1],
    minAvailableTrailingWidth: _$YgSectionHeaderTheme.minAvailableTrailingWidth[1],
    padding: _$YgSectionHeaderTheme.padding[1],
    subtitlePadding: _$YgSectionHeaderTheme.subtitlePadding[1],
    subtitleTextStyle: _$YgSectionHeaderTheme.subtitleTextStyle[1],
    titleTextStyle: _$YgSectionHeaderTheme.titleTextStyle[1],
    trailingSpacing: _$YgSectionHeaderTheme.trailingSpacing[1],
  );

  static final YgSectionHeaderTheme professionalLight = YgSectionHeaderTheme(
    iconPadding: _$YgSectionHeaderTheme.iconPadding[2],
    minAvailableTrailingWidth: _$YgSectionHeaderTheme.minAvailableTrailingWidth[2],
    padding: _$YgSectionHeaderTheme.padding[2],
    subtitlePadding: _$YgSectionHeaderTheme.subtitlePadding[2],
    subtitleTextStyle: _$YgSectionHeaderTheme.subtitleTextStyle[2],
    titleTextStyle: _$YgSectionHeaderTheme.titleTextStyle[2],
    trailingSpacing: _$YgSectionHeaderTheme.trailingSpacing[2],
  );

  static final YgSectionHeaderTheme professionalDark = YgSectionHeaderTheme(
    iconPadding: _$YgSectionHeaderTheme.iconPadding[3],
    minAvailableTrailingWidth: _$YgSectionHeaderTheme.minAvailableTrailingWidth[3],
    padding: _$YgSectionHeaderTheme.padding[3],
    subtitlePadding: _$YgSectionHeaderTheme.subtitlePadding[3],
    subtitleTextStyle: _$YgSectionHeaderTheme.subtitleTextStyle[3],
    titleTextStyle: _$YgSectionHeaderTheme.titleTextStyle[3],
    trailingSpacing: _$YgSectionHeaderTheme.trailingSpacing[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgSectionHeaderTheme copyWith({
    EdgeInsets? iconPadding,
    double? minAvailableTrailingWidth,
    EdgeInsets? padding,
    EdgeInsets? subtitlePadding,
    TextStyle? subtitleTextStyle,
    TextStyle? titleTextStyle,
    double? trailingSpacing,
  }) {
    return YgSectionHeaderTheme(
      iconPadding: iconPadding ?? this.iconPadding,
      minAvailableTrailingWidth: minAvailableTrailingWidth ?? this.minAvailableTrailingWidth,
      padding: padding ?? this.padding,
      subtitlePadding: subtitlePadding ?? this.subtitlePadding,
      subtitleTextStyle: subtitleTextStyle ?? this.subtitleTextStyle,
      titleTextStyle: titleTextStyle ?? this.titleTextStyle,
      trailingSpacing: trailingSpacing ?? this.trailingSpacing,
    );
  }

  @override
  YgSectionHeaderTheme lerp(covariant ThemeExtension<YgSectionHeaderTheme>? other, double t) {
    if (other is! YgSectionHeaderTheme) return this as YgSectionHeaderTheme;
    return YgSectionHeaderTheme(
      iconPadding: t < 0.5 ? iconPadding : other.iconPadding,
      minAvailableTrailingWidth: t < 0.5 ? minAvailableTrailingWidth : other.minAvailableTrailingWidth,
      padding: t < 0.5 ? padding : other.padding,
      subtitlePadding: t < 0.5 ? subtitlePadding : other.subtitlePadding,
      subtitleTextStyle: TextStyle.lerp(subtitleTextStyle, other.subtitleTextStyle, t)!,
      titleTextStyle: TextStyle.lerp(titleTextStyle, other.titleTextStyle, t)!,
      trailingSpacing: t < 0.5 ? trailingSpacing : other.trailingSpacing,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgSectionHeaderTheme &&
            const DeepCollectionEquality().equals(iconPadding, other.iconPadding) &&
            const DeepCollectionEquality().equals(minAvailableTrailingWidth, other.minAvailableTrailingWidth) &&
            const DeepCollectionEquality().equals(padding, other.padding) &&
            const DeepCollectionEquality().equals(subtitlePadding, other.subtitlePadding) &&
            const DeepCollectionEquality().equals(subtitleTextStyle, other.subtitleTextStyle) &&
            const DeepCollectionEquality().equals(titleTextStyle, other.titleTextStyle) &&
            const DeepCollectionEquality().equals(trailingSpacing, other.trailingSpacing));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(iconPadding),
      const DeepCollectionEquality().hash(minAvailableTrailingWidth),
      const DeepCollectionEquality().hash(padding),
      const DeepCollectionEquality().hash(subtitlePadding),
      const DeepCollectionEquality().hash(subtitleTextStyle),
      const DeepCollectionEquality().hash(titleTextStyle),
      const DeepCollectionEquality().hash(trailingSpacing),
    );
  }
}
