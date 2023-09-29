// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'medium_app_bar_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class MediumAppBarTheme extends ThemeExtension<MediumAppBarTheme> {
  const MediumAppBarTheme({
    required this.bottomTitlePadding,
    required this.expandedHeight,
    required this.titleTextStyle,
    required this.topTitlePadding,
  });

  final double bottomTitlePadding;
  final double expandedHeight;
  final TextStyle titleTextStyle;
  final double topTitlePadding;

  static final MediumAppBarTheme consumerLight = MediumAppBarTheme(
    bottomTitlePadding: _$MediumAppBarTheme.bottomTitlePadding[0],
    expandedHeight: _$MediumAppBarTheme.expandedHeight[0],
    titleTextStyle: _$MediumAppBarTheme.titleTextStyle[0],
    topTitlePadding: _$MediumAppBarTheme.topTitlePadding[0],
  );

  static final MediumAppBarTheme consumerDark = MediumAppBarTheme(
    bottomTitlePadding: _$MediumAppBarTheme.bottomTitlePadding[1],
    expandedHeight: _$MediumAppBarTheme.expandedHeight[1],
    titleTextStyle: _$MediumAppBarTheme.titleTextStyle[1],
    topTitlePadding: _$MediumAppBarTheme.topTitlePadding[1],
  );

  static final MediumAppBarTheme professionalLight = MediumAppBarTheme(
    bottomTitlePadding: _$MediumAppBarTheme.bottomTitlePadding[2],
    expandedHeight: _$MediumAppBarTheme.expandedHeight[2],
    titleTextStyle: _$MediumAppBarTheme.titleTextStyle[2],
    topTitlePadding: _$MediumAppBarTheme.topTitlePadding[2],
  );

  static final MediumAppBarTheme professionalDark = MediumAppBarTheme(
    bottomTitlePadding: _$MediumAppBarTheme.bottomTitlePadding[3],
    expandedHeight: _$MediumAppBarTheme.expandedHeight[3],
    titleTextStyle: _$MediumAppBarTheme.titleTextStyle[3],
    topTitlePadding: _$MediumAppBarTheme.topTitlePadding[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  MediumAppBarTheme copyWith({
    double? bottomTitlePadding,
    double? expandedHeight,
    TextStyle? titleTextStyle,
    double? topTitlePadding,
  }) {
    return MediumAppBarTheme(
      bottomTitlePadding: bottomTitlePadding ?? this.bottomTitlePadding,
      expandedHeight: expandedHeight ?? this.expandedHeight,
      titleTextStyle: titleTextStyle ?? this.titleTextStyle,
      topTitlePadding: topTitlePadding ?? this.topTitlePadding,
    );
  }

  @override
  MediumAppBarTheme lerp(
      covariant ThemeExtension<MediumAppBarTheme>? other, double t) {
    if (other is! MediumAppBarTheme) return this as MediumAppBarTheme;
    return MediumAppBarTheme(
      bottomTitlePadding:
          t < 0.5 ? bottomTitlePadding : other.bottomTitlePadding,
      expandedHeight: t < 0.5 ? expandedHeight : other.expandedHeight,
      titleTextStyle: TextStyle.lerp(titleTextStyle, other.titleTextStyle, t)!,
      topTitlePadding: t < 0.5 ? topTitlePadding : other.topTitlePadding,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MediumAppBarTheme &&
            const DeepCollectionEquality()
                .equals(bottomTitlePadding, other.bottomTitlePadding) &&
            const DeepCollectionEquality()
                .equals(expandedHeight, other.expandedHeight) &&
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
      const DeepCollectionEquality().hash(titleTextStyle),
      const DeepCollectionEquality().hash(topTitlePadding),
    );
  }
}
