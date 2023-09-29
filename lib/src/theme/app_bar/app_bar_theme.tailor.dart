// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'app_bar_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgAppBarTheme extends ThemeExtension<YgAppBarTheme> {
  const YgAppBarTheme({
    required this.backgroundColor,
    required this.borderColor,
    required this.collapsedHeight,
    required this.largeAppBarTheme,
    required this.leadingIconSize,
    required this.leadingWidth,
    required this.mediumAppBarTheme,
    required this.smallAppBarTheme,
    required this.titleSpacing,
    required this.toolbarHeight,
    required this.trailingIconSize,
  });

  final Color backgroundColor;
  final Color borderColor;
  final double collapsedHeight;
  final LargeAppBarTheme largeAppBarTheme;
  final double leadingIconSize;
  final double leadingWidth;
  final MediumAppBarTheme mediumAppBarTheme;
  final SmallAppBarTheme smallAppBarTheme;
  final double titleSpacing;
  final double toolbarHeight;
  final double trailingIconSize;

  static final YgAppBarTheme consumerLight = YgAppBarTheme(
    backgroundColor: _$YgAppBarTheme.backgroundColor[0],
    borderColor: _$YgAppBarTheme.borderColor[0],
    collapsedHeight: _$YgAppBarTheme.collapsedHeight[0],
    largeAppBarTheme: _$YgAppBarTheme.largeAppBarTheme[0],
    leadingIconSize: _$YgAppBarTheme.leadingIconSize[0],
    leadingWidth: _$YgAppBarTheme.leadingWidth[0],
    mediumAppBarTheme: _$YgAppBarTheme.mediumAppBarTheme[0],
    smallAppBarTheme: _$YgAppBarTheme.smallAppBarTheme[0],
    titleSpacing: _$YgAppBarTheme.titleSpacing[0],
    toolbarHeight: _$YgAppBarTheme.toolbarHeight[0],
    trailingIconSize: _$YgAppBarTheme.trailingIconSize[0],
  );

  static final YgAppBarTheme consumerDark = YgAppBarTheme(
    backgroundColor: _$YgAppBarTheme.backgroundColor[1],
    borderColor: _$YgAppBarTheme.borderColor[1],
    collapsedHeight: _$YgAppBarTheme.collapsedHeight[1],
    largeAppBarTheme: _$YgAppBarTheme.largeAppBarTheme[1],
    leadingIconSize: _$YgAppBarTheme.leadingIconSize[1],
    leadingWidth: _$YgAppBarTheme.leadingWidth[1],
    mediumAppBarTheme: _$YgAppBarTheme.mediumAppBarTheme[1],
    smallAppBarTheme: _$YgAppBarTheme.smallAppBarTheme[1],
    titleSpacing: _$YgAppBarTheme.titleSpacing[1],
    toolbarHeight: _$YgAppBarTheme.toolbarHeight[1],
    trailingIconSize: _$YgAppBarTheme.trailingIconSize[1],
  );

  static final YgAppBarTheme professionalLight = YgAppBarTheme(
    backgroundColor: _$YgAppBarTheme.backgroundColor[2],
    borderColor: _$YgAppBarTheme.borderColor[2],
    collapsedHeight: _$YgAppBarTheme.collapsedHeight[2],
    largeAppBarTheme: _$YgAppBarTheme.largeAppBarTheme[2],
    leadingIconSize: _$YgAppBarTheme.leadingIconSize[2],
    leadingWidth: _$YgAppBarTheme.leadingWidth[2],
    mediumAppBarTheme: _$YgAppBarTheme.mediumAppBarTheme[2],
    smallAppBarTheme: _$YgAppBarTheme.smallAppBarTheme[2],
    titleSpacing: _$YgAppBarTheme.titleSpacing[2],
    toolbarHeight: _$YgAppBarTheme.toolbarHeight[2],
    trailingIconSize: _$YgAppBarTheme.trailingIconSize[2],
  );

  static final YgAppBarTheme professionalDark = YgAppBarTheme(
    backgroundColor: _$YgAppBarTheme.backgroundColor[3],
    borderColor: _$YgAppBarTheme.borderColor[3],
    collapsedHeight: _$YgAppBarTheme.collapsedHeight[3],
    largeAppBarTheme: _$YgAppBarTheme.largeAppBarTheme[3],
    leadingIconSize: _$YgAppBarTheme.leadingIconSize[3],
    leadingWidth: _$YgAppBarTheme.leadingWidth[3],
    mediumAppBarTheme: _$YgAppBarTheme.mediumAppBarTheme[3],
    smallAppBarTheme: _$YgAppBarTheme.smallAppBarTheme[3],
    titleSpacing: _$YgAppBarTheme.titleSpacing[3],
    toolbarHeight: _$YgAppBarTheme.toolbarHeight[3],
    trailingIconSize: _$YgAppBarTheme.trailingIconSize[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgAppBarTheme copyWith({
    Color? backgroundColor,
    Color? borderColor,
    double? collapsedHeight,
    LargeAppBarTheme? largeAppBarTheme,
    double? leadingIconSize,
    double? leadingWidth,
    MediumAppBarTheme? mediumAppBarTheme,
    SmallAppBarTheme? smallAppBarTheme,
    double? titleSpacing,
    double? toolbarHeight,
    double? trailingIconSize,
  }) {
    return YgAppBarTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      borderColor: borderColor ?? this.borderColor,
      collapsedHeight: collapsedHeight ?? this.collapsedHeight,
      largeAppBarTheme: largeAppBarTheme ?? this.largeAppBarTheme,
      leadingIconSize: leadingIconSize ?? this.leadingIconSize,
      leadingWidth: leadingWidth ?? this.leadingWidth,
      mediumAppBarTheme: mediumAppBarTheme ?? this.mediumAppBarTheme,
      smallAppBarTheme: smallAppBarTheme ?? this.smallAppBarTheme,
      titleSpacing: titleSpacing ?? this.titleSpacing,
      toolbarHeight: toolbarHeight ?? this.toolbarHeight,
      trailingIconSize: trailingIconSize ?? this.trailingIconSize,
    );
  }

  @override
  YgAppBarTheme lerp(covariant ThemeExtension<YgAppBarTheme>? other, double t) {
    if (other is! YgAppBarTheme) return this as YgAppBarTheme;
    return YgAppBarTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      borderColor: Color.lerp(borderColor, other.borderColor, t)!,
      collapsedHeight: t < 0.5 ? collapsedHeight : other.collapsedHeight,
      largeAppBarTheme:
          largeAppBarTheme.lerp(other.largeAppBarTheme, t) as LargeAppBarTheme,
      leadingIconSize: t < 0.5 ? leadingIconSize : other.leadingIconSize,
      leadingWidth: t < 0.5 ? leadingWidth : other.leadingWidth,
      mediumAppBarTheme: mediumAppBarTheme.lerp(other.mediumAppBarTheme, t)
          as MediumAppBarTheme,
      smallAppBarTheme:
          smallAppBarTheme.lerp(other.smallAppBarTheme, t) as SmallAppBarTheme,
      titleSpacing: t < 0.5 ? titleSpacing : other.titleSpacing,
      toolbarHeight: t < 0.5 ? toolbarHeight : other.toolbarHeight,
      trailingIconSize: t < 0.5 ? trailingIconSize : other.trailingIconSize,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgAppBarTheme &&
            const DeepCollectionEquality()
                .equals(backgroundColor, other.backgroundColor) &&
            const DeepCollectionEquality()
                .equals(borderColor, other.borderColor) &&
            const DeepCollectionEquality()
                .equals(collapsedHeight, other.collapsedHeight) &&
            const DeepCollectionEquality()
                .equals(largeAppBarTheme, other.largeAppBarTheme) &&
            const DeepCollectionEquality()
                .equals(leadingIconSize, other.leadingIconSize) &&
            const DeepCollectionEquality()
                .equals(leadingWidth, other.leadingWidth) &&
            const DeepCollectionEquality()
                .equals(mediumAppBarTheme, other.mediumAppBarTheme) &&
            const DeepCollectionEquality()
                .equals(smallAppBarTheme, other.smallAppBarTheme) &&
            const DeepCollectionEquality()
                .equals(titleSpacing, other.titleSpacing) &&
            const DeepCollectionEquality()
                .equals(toolbarHeight, other.toolbarHeight) &&
            const DeepCollectionEquality()
                .equals(trailingIconSize, other.trailingIconSize));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(backgroundColor),
      const DeepCollectionEquality().hash(borderColor),
      const DeepCollectionEquality().hash(collapsedHeight),
      const DeepCollectionEquality().hash(largeAppBarTheme),
      const DeepCollectionEquality().hash(leadingIconSize),
      const DeepCollectionEquality().hash(leadingWidth),
      const DeepCollectionEquality().hash(mediumAppBarTheme),
      const DeepCollectionEquality().hash(smallAppBarTheme),
      const DeepCollectionEquality().hash(titleSpacing),
      const DeepCollectionEquality().hash(toolbarHeight),
      const DeepCollectionEquality().hash(trailingIconSize),
    );
  }
}
