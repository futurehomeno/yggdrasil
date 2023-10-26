// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'app_bar_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgAppBarTheme extends ThemeExtension<YgAppBarTheme> {
  const YgAppBarTheme({
    required this.actionEdgeSpacing,
    required this.backgroundColor,
    required this.borderColor,
    required this.collapsedHeight,
    required this.elevation,
    required this.largeAppBarTheme,
    required this.mediumAppBarTheme,
    required this.scrolledUnderElevation,
    required this.titleExpandedPadding,
    required this.titleSpacing,
    required this.titleTextStyle,
    required this.toolbarHeight,
  });

  final double actionEdgeSpacing;
  final Color backgroundColor;
  final Color borderColor;
  final double collapsedHeight;

  /// Elevation when the app bar is at the top.
  final double elevation;
  final LargeAppBarTheme largeAppBarTheme;
  final MediumAppBarTheme mediumAppBarTheme;

  /// Elevation when there's content "under" the app bar.
  final double scrolledUnderElevation;

  /// Spacing between edge and title on both sides when it's expanded.
  final double titleExpandedPadding;
  final double titleSpacing;
  final TextStyle titleTextStyle;
  final double toolbarHeight;

  static final YgAppBarTheme consumerLight = YgAppBarTheme(
    actionEdgeSpacing: _$YgAppBarTheme.actionEdgeSpacing[0],
    backgroundColor: _$YgAppBarTheme.backgroundColor[0],
    borderColor: _$YgAppBarTheme.borderColor[0],
    collapsedHeight: _$YgAppBarTheme.collapsedHeight[0],
    elevation: _$YgAppBarTheme.elevation[0],
    largeAppBarTheme: _$YgAppBarTheme.largeAppBarTheme[0],
    mediumAppBarTheme: _$YgAppBarTheme.mediumAppBarTheme[0],
    scrolledUnderElevation: _$YgAppBarTheme.scrolledUnderElevation[0],
    titleExpandedPadding: _$YgAppBarTheme.titleExpandedPadding[0],
    titleSpacing: _$YgAppBarTheme.titleSpacing[0],
    titleTextStyle: _$YgAppBarTheme.titleTextStyle[0],
    toolbarHeight: _$YgAppBarTheme.toolbarHeight[0],
  );

  static final YgAppBarTheme consumerDark = YgAppBarTheme(
    actionEdgeSpacing: _$YgAppBarTheme.actionEdgeSpacing[1],
    backgroundColor: _$YgAppBarTheme.backgroundColor[1],
    borderColor: _$YgAppBarTheme.borderColor[1],
    collapsedHeight: _$YgAppBarTheme.collapsedHeight[1],
    elevation: _$YgAppBarTheme.elevation[1],
    largeAppBarTheme: _$YgAppBarTheme.largeAppBarTheme[1],
    mediumAppBarTheme: _$YgAppBarTheme.mediumAppBarTheme[1],
    scrolledUnderElevation: _$YgAppBarTheme.scrolledUnderElevation[1],
    titleExpandedPadding: _$YgAppBarTheme.titleExpandedPadding[1],
    titleSpacing: _$YgAppBarTheme.titleSpacing[1],
    titleTextStyle: _$YgAppBarTheme.titleTextStyle[1],
    toolbarHeight: _$YgAppBarTheme.toolbarHeight[1],
  );

  static final YgAppBarTheme professionalLight = YgAppBarTheme(
    actionEdgeSpacing: _$YgAppBarTheme.actionEdgeSpacing[2],
    backgroundColor: _$YgAppBarTheme.backgroundColor[2],
    borderColor: _$YgAppBarTheme.borderColor[2],
    collapsedHeight: _$YgAppBarTheme.collapsedHeight[2],
    elevation: _$YgAppBarTheme.elevation[2],
    largeAppBarTheme: _$YgAppBarTheme.largeAppBarTheme[2],
    mediumAppBarTheme: _$YgAppBarTheme.mediumAppBarTheme[2],
    scrolledUnderElevation: _$YgAppBarTheme.scrolledUnderElevation[2],
    titleExpandedPadding: _$YgAppBarTheme.titleExpandedPadding[2],
    titleSpacing: _$YgAppBarTheme.titleSpacing[2],
    titleTextStyle: _$YgAppBarTheme.titleTextStyle[2],
    toolbarHeight: _$YgAppBarTheme.toolbarHeight[2],
  );

  static final YgAppBarTheme professionalDark = YgAppBarTheme(
    actionEdgeSpacing: _$YgAppBarTheme.actionEdgeSpacing[3],
    backgroundColor: _$YgAppBarTheme.backgroundColor[3],
    borderColor: _$YgAppBarTheme.borderColor[3],
    collapsedHeight: _$YgAppBarTheme.collapsedHeight[3],
    elevation: _$YgAppBarTheme.elevation[3],
    largeAppBarTheme: _$YgAppBarTheme.largeAppBarTheme[3],
    mediumAppBarTheme: _$YgAppBarTheme.mediumAppBarTheme[3],
    scrolledUnderElevation: _$YgAppBarTheme.scrolledUnderElevation[3],
    titleExpandedPadding: _$YgAppBarTheme.titleExpandedPadding[3],
    titleSpacing: _$YgAppBarTheme.titleSpacing[3],
    titleTextStyle: _$YgAppBarTheme.titleTextStyle[3],
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
    double? actionEdgeSpacing,
    Color? backgroundColor,
    Color? borderColor,
    double? collapsedHeight,
    double? elevation,
    LargeAppBarTheme? largeAppBarTheme,
    MediumAppBarTheme? mediumAppBarTheme,
    double? scrolledUnderElevation,
    double? titleExpandedPadding,
    double? titleSpacing,
    TextStyle? titleTextStyle,
    double? toolbarHeight,
  }) {
    return YgAppBarTheme(
      actionEdgeSpacing: actionEdgeSpacing ?? this.actionEdgeSpacing,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      borderColor: borderColor ?? this.borderColor,
      collapsedHeight: collapsedHeight ?? this.collapsedHeight,
      elevation: elevation ?? this.elevation,
      largeAppBarTheme: largeAppBarTheme ?? this.largeAppBarTheme,
      mediumAppBarTheme: mediumAppBarTheme ?? this.mediumAppBarTheme,
      scrolledUnderElevation:
          scrolledUnderElevation ?? this.scrolledUnderElevation,
      titleExpandedPadding: titleExpandedPadding ?? this.titleExpandedPadding,
      titleSpacing: titleSpacing ?? this.titleSpacing,
      titleTextStyle: titleTextStyle ?? this.titleTextStyle,
      toolbarHeight: toolbarHeight ?? this.toolbarHeight,
    );
  }

  @override
  YgAppBarTheme lerp(covariant ThemeExtension<YgAppBarTheme>? other, double t) {
    if (other is! YgAppBarTheme) return this as YgAppBarTheme;
    return YgAppBarTheme(
      actionEdgeSpacing: t < 0.5 ? actionEdgeSpacing : other.actionEdgeSpacing,
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      borderColor: Color.lerp(borderColor, other.borderColor, t)!,
      collapsedHeight: t < 0.5 ? collapsedHeight : other.collapsedHeight,
      elevation: t < 0.5 ? elevation : other.elevation,
      largeAppBarTheme:
          largeAppBarTheme.lerp(other.largeAppBarTheme, t) as LargeAppBarTheme,
      mediumAppBarTheme: mediumAppBarTheme.lerp(other.mediumAppBarTheme, t)
          as MediumAppBarTheme,
      scrolledUnderElevation:
          t < 0.5 ? scrolledUnderElevation : other.scrolledUnderElevation,
      titleExpandedPadding:
          t < 0.5 ? titleExpandedPadding : other.titleExpandedPadding,
      titleSpacing: t < 0.5 ? titleSpacing : other.titleSpacing,
      titleTextStyle: TextStyle.lerp(titleTextStyle, other.titleTextStyle, t)!,
      toolbarHeight: t < 0.5 ? toolbarHeight : other.toolbarHeight,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgAppBarTheme &&
            const DeepCollectionEquality()
                .equals(actionEdgeSpacing, other.actionEdgeSpacing) &&
            const DeepCollectionEquality()
                .equals(backgroundColor, other.backgroundColor) &&
            const DeepCollectionEquality()
                .equals(borderColor, other.borderColor) &&
            const DeepCollectionEquality()
                .equals(collapsedHeight, other.collapsedHeight) &&
            const DeepCollectionEquality().equals(elevation, other.elevation) &&
            const DeepCollectionEquality()
                .equals(largeAppBarTheme, other.largeAppBarTheme) &&
            const DeepCollectionEquality()
                .equals(mediumAppBarTheme, other.mediumAppBarTheme) &&
            const DeepCollectionEquality()
                .equals(scrolledUnderElevation, other.scrolledUnderElevation) &&
            const DeepCollectionEquality()
                .equals(titleExpandedPadding, other.titleExpandedPadding) &&
            const DeepCollectionEquality()
                .equals(titleSpacing, other.titleSpacing) &&
            const DeepCollectionEquality()
                .equals(titleTextStyle, other.titleTextStyle) &&
            const DeepCollectionEquality()
                .equals(toolbarHeight, other.toolbarHeight));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(actionEdgeSpacing),
      const DeepCollectionEquality().hash(backgroundColor),
      const DeepCollectionEquality().hash(borderColor),
      const DeepCollectionEquality().hash(collapsedHeight),
      const DeepCollectionEquality().hash(elevation),
      const DeepCollectionEquality().hash(largeAppBarTheme),
      const DeepCollectionEquality().hash(mediumAppBarTheme),
      const DeepCollectionEquality().hash(scrolledUnderElevation),
      const DeepCollectionEquality().hash(titleExpandedPadding),
      const DeepCollectionEquality().hash(titleSpacing),
      const DeepCollectionEquality().hash(titleTextStyle),
      const DeepCollectionEquality().hash(toolbarHeight),
    );
  }
}
