// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'list_tile_themes.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgListTileThemes extends ThemeExtension<YgListTileThemes> {
  const YgListTileThemes({
    required this.contentSpacing,
    required this.iconSize,
    required this.padding,
    required this.subtitleTextStyle,
    required this.titleTextStyle,
  });

  final double contentSpacing;
  final double iconSize;
  final EdgeInsets padding;
  final TextStyle subtitleTextStyle;
  final TextStyle titleTextStyle;

  static final YgListTileThemes consumerLight = YgListTileThemes(
    contentSpacing: _$YgListTileThemes.contentSpacing[0],
    iconSize: _$YgListTileThemes.iconSize[0],
    padding: _$YgListTileThemes.padding[0],
    subtitleTextStyle: _$YgListTileThemes.subtitleTextStyle[0],
    titleTextStyle: _$YgListTileThemes.titleTextStyle[0],
  );

  static final YgListTileThemes consumerDark = YgListTileThemes(
    contentSpacing: _$YgListTileThemes.contentSpacing[1],
    iconSize: _$YgListTileThemes.iconSize[1],
    padding: _$YgListTileThemes.padding[1],
    subtitleTextStyle: _$YgListTileThemes.subtitleTextStyle[1],
    titleTextStyle: _$YgListTileThemes.titleTextStyle[1],
  );

  static final YgListTileThemes professionalLight = YgListTileThemes(
    contentSpacing: _$YgListTileThemes.contentSpacing[2],
    iconSize: _$YgListTileThemes.iconSize[2],
    padding: _$YgListTileThemes.padding[2],
    subtitleTextStyle: _$YgListTileThemes.subtitleTextStyle[2],
    titleTextStyle: _$YgListTileThemes.titleTextStyle[2],
  );

  static final YgListTileThemes professionalDark = YgListTileThemes(
    contentSpacing: _$YgListTileThemes.contentSpacing[3],
    iconSize: _$YgListTileThemes.iconSize[3],
    padding: _$YgListTileThemes.padding[3],
    subtitleTextStyle: _$YgListTileThemes.subtitleTextStyle[3],
    titleTextStyle: _$YgListTileThemes.titleTextStyle[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgListTileThemes copyWith({
    double? contentSpacing,
    double? iconSize,
    EdgeInsets? padding,
    TextStyle? subtitleTextStyle,
    TextStyle? titleTextStyle,
  }) {
    return YgListTileThemes(
      contentSpacing: contentSpacing ?? this.contentSpacing,
      iconSize: iconSize ?? this.iconSize,
      padding: padding ?? this.padding,
      subtitleTextStyle: subtitleTextStyle ?? this.subtitleTextStyle,
      titleTextStyle: titleTextStyle ?? this.titleTextStyle,
    );
  }

  @override
  YgListTileThemes lerp(
      covariant ThemeExtension<YgListTileThemes>? other, double t) {
    if (other is! YgListTileThemes) return this as YgListTileThemes;
    return YgListTileThemes(
      contentSpacing: t < 0.5 ? contentSpacing : other.contentSpacing,
      iconSize: t < 0.5 ? iconSize : other.iconSize,
      padding: t < 0.5 ? padding : other.padding,
      subtitleTextStyle:
          TextStyle.lerp(subtitleTextStyle, other.subtitleTextStyle, t)!,
      titleTextStyle: TextStyle.lerp(titleTextStyle, other.titleTextStyle, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgListTileThemes &&
            const DeepCollectionEquality()
                .equals(contentSpacing, other.contentSpacing) &&
            const DeepCollectionEquality().equals(iconSize, other.iconSize) &&
            const DeepCollectionEquality().equals(padding, other.padding) &&
            const DeepCollectionEquality()
                .equals(subtitleTextStyle, other.subtitleTextStyle) &&
            const DeepCollectionEquality()
                .equals(titleTextStyle, other.titleTextStyle));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(contentSpacing),
      const DeepCollectionEquality().hash(iconSize),
      const DeepCollectionEquality().hash(padding),
      const DeepCollectionEquality().hash(subtitleTextStyle),
      const DeepCollectionEquality().hash(titleTextStyle),
    );
  }
}
