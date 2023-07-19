// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'icon_tap_size_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgIconTapSizeTheme extends ThemeExtension<YgIconTapSizeTheme> {
  const YgIconTapSizeTheme({
    required this.larger,
    required this.largest,
  });

  final double larger;
  final double largest;

  static final YgIconTapSizeTheme consumerLight = YgIconTapSizeTheme(
    larger: _$YgIconTapSizeTheme.larger[0],
    largest: _$YgIconTapSizeTheme.largest[0],
  );

  static final YgIconTapSizeTheme consumerDark = YgIconTapSizeTheme(
    larger: _$YgIconTapSizeTheme.larger[1],
    largest: _$YgIconTapSizeTheme.largest[1],
  );

  static final YgIconTapSizeTheme professionalLight = YgIconTapSizeTheme(
    larger: _$YgIconTapSizeTheme.larger[2],
    largest: _$YgIconTapSizeTheme.largest[2],
  );

  static final YgIconTapSizeTheme professionalDark = YgIconTapSizeTheme(
    larger: _$YgIconTapSizeTheme.larger[3],
    largest: _$YgIconTapSizeTheme.largest[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgIconTapSizeTheme copyWith({
    double? larger,
    double? largest,
  }) {
    return YgIconTapSizeTheme(
      larger: larger ?? this.larger,
      largest: largest ?? this.largest,
    );
  }

  @override
  YgIconTapSizeTheme lerp(
      covariant ThemeExtension<YgIconTapSizeTheme>? other, double t) {
    if (other is! YgIconTapSizeTheme) return this as YgIconTapSizeTheme;
    return YgIconTapSizeTheme(
      larger: t < 0.5 ? larger : other.larger,
      largest: t < 0.5 ? largest : other.largest,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgIconTapSizeTheme &&
            const DeepCollectionEquality().equals(larger, other.larger) &&
            const DeepCollectionEquality().equals(largest, other.largest));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(larger),
      const DeepCollectionEquality().hash(largest),
    );
  }
}
