// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'large_app_bar_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class LargeAppBarTheme extends ThemeExtension<LargeAppBarTheme> {
  const LargeAppBarTheme({
    required this.bottomTitlePadding,
    required this.expandedHeight,
    required this.expandedTitleScale,
    required this.titleTextStyle,
    required this.topTitlePadding,
  });

  final double bottomTitlePadding;
  final double expandedHeight;
  final double expandedTitleScale;
  final TextStyle titleTextStyle;
  final double topTitlePadding;

  static final LargeAppBarTheme consumerLight = LargeAppBarTheme(
    bottomTitlePadding: _$LargeAppBarTheme.bottomTitlePadding[0],
    expandedHeight: _$LargeAppBarTheme.expandedHeight[0],
    expandedTitleScale: _$LargeAppBarTheme.expandedTitleScale[0],
    titleTextStyle: _$LargeAppBarTheme.titleTextStyle[0],
    topTitlePadding: _$LargeAppBarTheme.topTitlePadding[0],
  );

  static final LargeAppBarTheme consumerDark = LargeAppBarTheme(
    bottomTitlePadding: _$LargeAppBarTheme.bottomTitlePadding[1],
    expandedHeight: _$LargeAppBarTheme.expandedHeight[1],
    expandedTitleScale: _$LargeAppBarTheme.expandedTitleScale[1],
    titleTextStyle: _$LargeAppBarTheme.titleTextStyle[1],
    topTitlePadding: _$LargeAppBarTheme.topTitlePadding[1],
  );

  static final LargeAppBarTheme professionalLight = LargeAppBarTheme(
    bottomTitlePadding: _$LargeAppBarTheme.bottomTitlePadding[2],
    expandedHeight: _$LargeAppBarTheme.expandedHeight[2],
    expandedTitleScale: _$LargeAppBarTheme.expandedTitleScale[2],
    titleTextStyle: _$LargeAppBarTheme.titleTextStyle[2],
    topTitlePadding: _$LargeAppBarTheme.topTitlePadding[2],
  );

  static final LargeAppBarTheme professionalDark = LargeAppBarTheme(
    bottomTitlePadding: _$LargeAppBarTheme.bottomTitlePadding[3],
    expandedHeight: _$LargeAppBarTheme.expandedHeight[3],
    expandedTitleScale: _$LargeAppBarTheme.expandedTitleScale[3],
    titleTextStyle: _$LargeAppBarTheme.titleTextStyle[3],
    topTitlePadding: _$LargeAppBarTheme.topTitlePadding[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  LargeAppBarTheme copyWith({
    double? bottomTitlePadding,
    double? expandedHeight,
    double? expandedTitleScale,
    TextStyle? titleTextStyle,
    double? topTitlePadding,
  }) {
    return LargeAppBarTheme(
      bottomTitlePadding: bottomTitlePadding ?? this.bottomTitlePadding,
      expandedHeight: expandedHeight ?? this.expandedHeight,
      expandedTitleScale: expandedTitleScale ?? this.expandedTitleScale,
      titleTextStyle: titleTextStyle ?? this.titleTextStyle,
      topTitlePadding: topTitlePadding ?? this.topTitlePadding,
    );
  }

  @override
  LargeAppBarTheme lerp(
      covariant ThemeExtension<LargeAppBarTheme>? other, double t) {
    if (other is! LargeAppBarTheme) return this as LargeAppBarTheme;
    return LargeAppBarTheme(
      bottomTitlePadding:
          t < 0.5 ? bottomTitlePadding : other.bottomTitlePadding,
      expandedHeight: t < 0.5 ? expandedHeight : other.expandedHeight,
      expandedTitleScale:
          t < 0.5 ? expandedTitleScale : other.expandedTitleScale,
      titleTextStyle: TextStyle.lerp(titleTextStyle, other.titleTextStyle, t)!,
      topTitlePadding: t < 0.5 ? topTitlePadding : other.topTitlePadding,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LargeAppBarTheme &&
            const DeepCollectionEquality()
                .equals(bottomTitlePadding, other.bottomTitlePadding) &&
            const DeepCollectionEquality()
                .equals(expandedHeight, other.expandedHeight) &&
            const DeepCollectionEquality()
                .equals(expandedTitleScale, other.expandedTitleScale) &&
            const DeepCollectionEquality()
                .equals(titleTextStyle, other.titleTextStyle) &&
            const DeepCollectionEquality()
                .equals(topTitlePadding, other.topTitlePadding));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(bottomTitlePadding),
      const DeepCollectionEquality().hash(expandedHeight),
      const DeepCollectionEquality().hash(expandedTitleScale),
      const DeepCollectionEquality().hash(titleTextStyle),
      const DeepCollectionEquality().hash(topTitlePadding),
    );
  }
}
