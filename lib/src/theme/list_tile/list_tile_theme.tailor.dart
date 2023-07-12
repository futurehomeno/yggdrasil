// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'list_tile_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgListTileTheme extends ThemeExtension<YgListTileTheme> {
  const YgListTileTheme({
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

  static final YgListTileTheme consumerLight = YgListTileTheme(
    contentSpacing: _$YgListTileTheme.contentSpacing[0],
    iconSize: _$YgListTileTheme.iconSize[0],
    padding: _$YgListTileTheme.padding[0],
    subtitleTextStyle: _$YgListTileTheme.subtitleTextStyle[0],
    titleTextStyle: _$YgListTileTheme.titleTextStyle[0],
  );

  static final YgListTileTheme consumerDark = YgListTileTheme(
    contentSpacing: _$YgListTileTheme.contentSpacing[1],
    iconSize: _$YgListTileTheme.iconSize[1],
    padding: _$YgListTileTheme.padding[1],
    subtitleTextStyle: _$YgListTileTheme.subtitleTextStyle[1],
    titleTextStyle: _$YgListTileTheme.titleTextStyle[1],
  );

  static final YgListTileTheme professionalLight = YgListTileTheme(
    contentSpacing: _$YgListTileTheme.contentSpacing[2],
    iconSize: _$YgListTileTheme.iconSize[2],
    padding: _$YgListTileTheme.padding[2],
    subtitleTextStyle: _$YgListTileTheme.subtitleTextStyle[2],
    titleTextStyle: _$YgListTileTheme.titleTextStyle[2],
  );

  static final YgListTileTheme professionalDark = YgListTileTheme(
    contentSpacing: _$YgListTileTheme.contentSpacing[3],
    iconSize: _$YgListTileTheme.iconSize[3],
    padding: _$YgListTileTheme.padding[3],
    subtitleTextStyle: _$YgListTileTheme.subtitleTextStyle[3],
    titleTextStyle: _$YgListTileTheme.titleTextStyle[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgListTileTheme copyWith({
    double? contentSpacing,
    double? iconSize,
    EdgeInsets? padding,
    TextStyle? subtitleTextStyle,
    TextStyle? titleTextStyle,
  }) {
    return YgListTileTheme(
      contentSpacing: contentSpacing ?? this.contentSpacing,
      iconSize: iconSize ?? this.iconSize,
      padding: padding ?? this.padding,
      subtitleTextStyle: subtitleTextStyle ?? this.subtitleTextStyle,
      titleTextStyle: titleTextStyle ?? this.titleTextStyle,
    );
  }

  @override
  YgListTileTheme lerp(
      covariant ThemeExtension<YgListTileTheme>? other, double t) {
    if (other is! YgListTileTheme) return this as YgListTileTheme;
    return YgListTileTheme(
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
            other is YgListTileTheme &&
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
