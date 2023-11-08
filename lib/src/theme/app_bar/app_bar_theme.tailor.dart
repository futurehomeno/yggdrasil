// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'app_bar_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgAppBarTheme extends ThemeExtension<YgAppBarTheme> {
  const YgAppBarTheme({
    required this.appBarHorizontalPadding,
    required this.backgroundColor,
    required this.elevation,
    required this.largeAppBarTheme,
    required this.mediumAppBarTheme,
    required this.scrolledUnderElevation,
    required this.titleExpandedHorizontalPadding,
    required this.titleSpacing,
    required this.titleTextStyle,
    required this.titleVerticalPadding,
    required this.toolbarHeight,
  });

  final double appBarHorizontalPadding;
  final Color backgroundColor;

  /// Elevation when the app bar is at the top.
  final double elevation;
  final LargeAppBarTheme largeAppBarTheme;
  final MediumAppBarTheme mediumAppBarTheme;

  /// Elevation when there's content "under" the app bar.
  final double scrolledUnderElevation;

  /// Spacing between edge and title on both sides when it's expanded.
  final double titleExpandedHorizontalPadding;
  final double titleSpacing;
  final TextStyle titleTextStyle;
  final double titleVerticalPadding;

  /// For all intents and purposes, this is the height of the app bar.
  final double toolbarHeight;

  static final YgAppBarTheme consumerLight = YgAppBarTheme(
    appBarHorizontalPadding: _$YgAppBarTheme.appBarHorizontalPadding[0],
    backgroundColor: _$YgAppBarTheme.backgroundColor[0],
    elevation: _$YgAppBarTheme.elevation[0],
    largeAppBarTheme: _$YgAppBarTheme.largeAppBarTheme[0],
    mediumAppBarTheme: _$YgAppBarTheme.mediumAppBarTheme[0],
    scrolledUnderElevation: _$YgAppBarTheme.scrolledUnderElevation[0],
    titleExpandedHorizontalPadding:
        _$YgAppBarTheme.titleExpandedHorizontalPadding[0],
    titleSpacing: _$YgAppBarTheme.titleSpacing[0],
    titleTextStyle: _$YgAppBarTheme.titleTextStyle[0],
    titleVerticalPadding: _$YgAppBarTheme.titleVerticalPadding[0],
    toolbarHeight: _$YgAppBarTheme.toolbarHeight[0],
  );

  static final YgAppBarTheme consumerDark = YgAppBarTheme(
    appBarHorizontalPadding: _$YgAppBarTheme.appBarHorizontalPadding[1],
    backgroundColor: _$YgAppBarTheme.backgroundColor[1],
    elevation: _$YgAppBarTheme.elevation[1],
    largeAppBarTheme: _$YgAppBarTheme.largeAppBarTheme[1],
    mediumAppBarTheme: _$YgAppBarTheme.mediumAppBarTheme[1],
    scrolledUnderElevation: _$YgAppBarTheme.scrolledUnderElevation[1],
    titleExpandedHorizontalPadding:
        _$YgAppBarTheme.titleExpandedHorizontalPadding[1],
    titleSpacing: _$YgAppBarTheme.titleSpacing[1],
    titleTextStyle: _$YgAppBarTheme.titleTextStyle[1],
    titleVerticalPadding: _$YgAppBarTheme.titleVerticalPadding[1],
    toolbarHeight: _$YgAppBarTheme.toolbarHeight[1],
  );

  static final YgAppBarTheme professionalLight = YgAppBarTheme(
    appBarHorizontalPadding: _$YgAppBarTheme.appBarHorizontalPadding[2],
    backgroundColor: _$YgAppBarTheme.backgroundColor[2],
    elevation: _$YgAppBarTheme.elevation[2],
    largeAppBarTheme: _$YgAppBarTheme.largeAppBarTheme[2],
    mediumAppBarTheme: _$YgAppBarTheme.mediumAppBarTheme[2],
    scrolledUnderElevation: _$YgAppBarTheme.scrolledUnderElevation[2],
    titleExpandedHorizontalPadding:
        _$YgAppBarTheme.titleExpandedHorizontalPadding[2],
    titleSpacing: _$YgAppBarTheme.titleSpacing[2],
    titleTextStyle: _$YgAppBarTheme.titleTextStyle[2],
    titleVerticalPadding: _$YgAppBarTheme.titleVerticalPadding[2],
    toolbarHeight: _$YgAppBarTheme.toolbarHeight[2],
  );

  static final YgAppBarTheme professionalDark = YgAppBarTheme(
    appBarHorizontalPadding: _$YgAppBarTheme.appBarHorizontalPadding[3],
    backgroundColor: _$YgAppBarTheme.backgroundColor[3],
    elevation: _$YgAppBarTheme.elevation[3],
    largeAppBarTheme: _$YgAppBarTheme.largeAppBarTheme[3],
    mediumAppBarTheme: _$YgAppBarTheme.mediumAppBarTheme[3],
    scrolledUnderElevation: _$YgAppBarTheme.scrolledUnderElevation[3],
    titleExpandedHorizontalPadding:
        _$YgAppBarTheme.titleExpandedHorizontalPadding[3],
    titleSpacing: _$YgAppBarTheme.titleSpacing[3],
    titleTextStyle: _$YgAppBarTheme.titleTextStyle[3],
    titleVerticalPadding: _$YgAppBarTheme.titleVerticalPadding[3],
    toolbarHeight: _$YgAppBarTheme.toolbarHeight[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgAppBarTheme copyWith({
    double? appBarHorizontalPadding,
    Color? backgroundColor,
    double? elevation,
    LargeAppBarTheme? largeAppBarTheme,
    MediumAppBarTheme? mediumAppBarTheme,
    double? scrolledUnderElevation,
    double? titleExpandedHorizontalPadding,
    double? titleSpacing,
    TextStyle? titleTextStyle,
    double? titleVerticalPadding,
    double? toolbarHeight,
  }) {
    return YgAppBarTheme(
      appBarHorizontalPadding:
          appBarHorizontalPadding ?? this.appBarHorizontalPadding,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      elevation: elevation ?? this.elevation,
      largeAppBarTheme: largeAppBarTheme ?? this.largeAppBarTheme,
      mediumAppBarTheme: mediumAppBarTheme ?? this.mediumAppBarTheme,
      scrolledUnderElevation:
          scrolledUnderElevation ?? this.scrolledUnderElevation,
      titleExpandedHorizontalPadding:
          titleExpandedHorizontalPadding ?? this.titleExpandedHorizontalPadding,
      titleSpacing: titleSpacing ?? this.titleSpacing,
      titleTextStyle: titleTextStyle ?? this.titleTextStyle,
      titleVerticalPadding: titleVerticalPadding ?? this.titleVerticalPadding,
      toolbarHeight: toolbarHeight ?? this.toolbarHeight,
    );
  }

  @override
  YgAppBarTheme lerp(covariant ThemeExtension<YgAppBarTheme>? other, double t) {
    if (other is! YgAppBarTheme) return this as YgAppBarTheme;
    return YgAppBarTheme(
      appBarHorizontalPadding:
          t < 0.5 ? appBarHorizontalPadding : other.appBarHorizontalPadding,
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      elevation: t < 0.5 ? elevation : other.elevation,
      largeAppBarTheme:
          largeAppBarTheme.lerp(other.largeAppBarTheme, t) as LargeAppBarTheme,
      mediumAppBarTheme: mediumAppBarTheme.lerp(other.mediumAppBarTheme, t)
          as MediumAppBarTheme,
      scrolledUnderElevation:
          t < 0.5 ? scrolledUnderElevation : other.scrolledUnderElevation,
      titleExpandedHorizontalPadding: t < 0.5
          ? titleExpandedHorizontalPadding
          : other.titleExpandedHorizontalPadding,
      titleSpacing: t < 0.5 ? titleSpacing : other.titleSpacing,
      titleTextStyle: TextStyle.lerp(titleTextStyle, other.titleTextStyle, t)!,
      titleVerticalPadding:
          t < 0.5 ? titleVerticalPadding : other.titleVerticalPadding,
      toolbarHeight: t < 0.5 ? toolbarHeight : other.toolbarHeight,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgAppBarTheme &&
            const DeepCollectionEquality().equals(
                appBarHorizontalPadding, other.appBarHorizontalPadding) &&
            const DeepCollectionEquality()
                .equals(backgroundColor, other.backgroundColor) &&
            const DeepCollectionEquality().equals(elevation, other.elevation) &&
            const DeepCollectionEquality()
                .equals(largeAppBarTheme, other.largeAppBarTheme) &&
            const DeepCollectionEquality()
                .equals(mediumAppBarTheme, other.mediumAppBarTheme) &&
            const DeepCollectionEquality()
                .equals(scrolledUnderElevation, other.scrolledUnderElevation) &&
            const DeepCollectionEquality().equals(
                titleExpandedHorizontalPadding,
                other.titleExpandedHorizontalPadding) &&
            const DeepCollectionEquality()
                .equals(titleSpacing, other.titleSpacing) &&
            const DeepCollectionEquality()
                .equals(titleTextStyle, other.titleTextStyle) &&
            const DeepCollectionEquality()
                .equals(titleVerticalPadding, other.titleVerticalPadding) &&
            const DeepCollectionEquality()
                .equals(toolbarHeight, other.toolbarHeight));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(appBarHorizontalPadding),
      const DeepCollectionEquality().hash(backgroundColor),
      const DeepCollectionEquality().hash(elevation),
      const DeepCollectionEquality().hash(largeAppBarTheme),
      const DeepCollectionEquality().hash(mediumAppBarTheme),
      const DeepCollectionEquality().hash(scrolledUnderElevation),
      const DeepCollectionEquality().hash(titleExpandedHorizontalPadding),
      const DeepCollectionEquality().hash(titleSpacing),
      const DeepCollectionEquality().hash(titleTextStyle),
      const DeepCollectionEquality().hash(titleVerticalPadding),
      const DeepCollectionEquality().hash(toolbarHeight),
    );
  }
}
