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
    required this.outerPadding,
    required this.splashRadius,
    required this.subtitleSubtitleIconSpacing,
    required this.subtitleTextStyle,
    required this.titleInfoSpacing,
    required this.titleSubtitleSpacing,
    required this.titleTextStyle,
  });

  final double contentSpacing;
  final double iconSize;
  final EdgeInsets outerPadding;
  final double splashRadius;
  final double subtitleSubtitleIconSpacing;
  final TextStyle subtitleTextStyle;
  final double titleInfoSpacing;
  final double titleSubtitleSpacing;
  final TextStyle titleTextStyle;

  static final YgListTileTheme consumerLight = YgListTileTheme(
    contentSpacing: _$YgListTileTheme.contentSpacing[0],
    iconSize: _$YgListTileTheme.iconSize[0],
    outerPadding: _$YgListTileTheme.outerPadding[0],
    splashRadius: _$YgListTileTheme.splashRadius[0],
    subtitleSubtitleIconSpacing:
        _$YgListTileTheme.subtitleSubtitleIconSpacing[0],
    subtitleTextStyle: _$YgListTileTheme.subtitleTextStyle[0],
    titleInfoSpacing: _$YgListTileTheme.titleInfoSpacing[0],
    titleSubtitleSpacing: _$YgListTileTheme.titleSubtitleSpacing[0],
    titleTextStyle: _$YgListTileTheme.titleTextStyle[0],
  );

  static final YgListTileTheme consumerDark = YgListTileTheme(
    contentSpacing: _$YgListTileTheme.contentSpacing[1],
    iconSize: _$YgListTileTheme.iconSize[1],
    outerPadding: _$YgListTileTheme.outerPadding[1],
    splashRadius: _$YgListTileTheme.splashRadius[1],
    subtitleSubtitleIconSpacing:
        _$YgListTileTheme.subtitleSubtitleIconSpacing[1],
    subtitleTextStyle: _$YgListTileTheme.subtitleTextStyle[1],
    titleInfoSpacing: _$YgListTileTheme.titleInfoSpacing[1],
    titleSubtitleSpacing: _$YgListTileTheme.titleSubtitleSpacing[1],
    titleTextStyle: _$YgListTileTheme.titleTextStyle[1],
  );

  static final YgListTileTheme professionalLight = YgListTileTheme(
    contentSpacing: _$YgListTileTheme.contentSpacing[2],
    iconSize: _$YgListTileTheme.iconSize[2],
    outerPadding: _$YgListTileTheme.outerPadding[2],
    splashRadius: _$YgListTileTheme.splashRadius[2],
    subtitleSubtitleIconSpacing:
        _$YgListTileTheme.subtitleSubtitleIconSpacing[2],
    subtitleTextStyle: _$YgListTileTheme.subtitleTextStyle[2],
    titleInfoSpacing: _$YgListTileTheme.titleInfoSpacing[2],
    titleSubtitleSpacing: _$YgListTileTheme.titleSubtitleSpacing[2],
    titleTextStyle: _$YgListTileTheme.titleTextStyle[2],
  );

  static final YgListTileTheme professionalDark = YgListTileTheme(
    contentSpacing: _$YgListTileTheme.contentSpacing[3],
    iconSize: _$YgListTileTheme.iconSize[3],
    outerPadding: _$YgListTileTheme.outerPadding[3],
    splashRadius: _$YgListTileTheme.splashRadius[3],
    subtitleSubtitleIconSpacing:
        _$YgListTileTheme.subtitleSubtitleIconSpacing[3],
    subtitleTextStyle: _$YgListTileTheme.subtitleTextStyle[3],
    titleInfoSpacing: _$YgListTileTheme.titleInfoSpacing[3],
    titleSubtitleSpacing: _$YgListTileTheme.titleSubtitleSpacing[3],
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
    EdgeInsets? outerPadding,
    double? splashRadius,
    double? subtitleSubtitleIconSpacing,
    TextStyle? subtitleTextStyle,
    double? titleInfoSpacing,
    double? titleSubtitleSpacing,
    TextStyle? titleTextStyle,
  }) {
    return YgListTileTheme(
      contentSpacing: contentSpacing ?? this.contentSpacing,
      iconSize: iconSize ?? this.iconSize,
      outerPadding: outerPadding ?? this.outerPadding,
      splashRadius: splashRadius ?? this.splashRadius,
      subtitleSubtitleIconSpacing:
          subtitleSubtitleIconSpacing ?? this.subtitleSubtitleIconSpacing,
      subtitleTextStyle: subtitleTextStyle ?? this.subtitleTextStyle,
      titleInfoSpacing: titleInfoSpacing ?? this.titleInfoSpacing,
      titleSubtitleSpacing: titleSubtitleSpacing ?? this.titleSubtitleSpacing,
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
      outerPadding: t < 0.5 ? outerPadding : other.outerPadding,
      splashRadius: t < 0.5 ? splashRadius : other.splashRadius,
      subtitleSubtitleIconSpacing: t < 0.5
          ? subtitleSubtitleIconSpacing
          : other.subtitleSubtitleIconSpacing,
      subtitleTextStyle:
          TextStyle.lerp(subtitleTextStyle, other.subtitleTextStyle, t)!,
      titleInfoSpacing: t < 0.5 ? titleInfoSpacing : other.titleInfoSpacing,
      titleSubtitleSpacing:
          t < 0.5 ? titleSubtitleSpacing : other.titleSubtitleSpacing,
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
            const DeepCollectionEquality()
                .equals(outerPadding, other.outerPadding) &&
            const DeepCollectionEquality()
                .equals(splashRadius, other.splashRadius) &&
            const DeepCollectionEquality().equals(subtitleSubtitleIconSpacing,
                other.subtitleSubtitleIconSpacing) &&
            const DeepCollectionEquality()
                .equals(subtitleTextStyle, other.subtitleTextStyle) &&
            const DeepCollectionEquality()
                .equals(titleInfoSpacing, other.titleInfoSpacing) &&
            const DeepCollectionEquality()
                .equals(titleSubtitleSpacing, other.titleSubtitleSpacing) &&
            const DeepCollectionEquality()
                .equals(titleTextStyle, other.titleTextStyle));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(contentSpacing),
      const DeepCollectionEquality().hash(iconSize),
      const DeepCollectionEquality().hash(outerPadding),
      const DeepCollectionEquality().hash(splashRadius),
      const DeepCollectionEquality().hash(subtitleSubtitleIconSpacing),
      const DeepCollectionEquality().hash(subtitleTextStyle),
      const DeepCollectionEquality().hash(titleInfoSpacing),
      const DeepCollectionEquality().hash(titleSubtitleSpacing),
      const DeepCollectionEquality().hash(titleTextStyle),
    );
  }
}
