// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'icon_size_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgIconSizeTheme extends ThemeExtension<YgIconSizeTheme> {
  const YgIconSizeTheme({
    required this.large,
    required this.small,
  });

  final double large;
  final double small;

  static final YgIconSizeTheme consumerLight = YgIconSizeTheme(
    large: _$YgIconSizeTheme.large[0],
    small: _$YgIconSizeTheme.small[0],
  );

  static final YgIconSizeTheme consumerDark = YgIconSizeTheme(
    large: _$YgIconSizeTheme.large[1],
    small: _$YgIconSizeTheme.small[1],
  );

  static final YgIconSizeTheme professionalLight = YgIconSizeTheme(
    large: _$YgIconSizeTheme.large[2],
    small: _$YgIconSizeTheme.small[2],
  );

  static final YgIconSizeTheme professionalDark = YgIconSizeTheme(
    large: _$YgIconSizeTheme.large[3],
    small: _$YgIconSizeTheme.small[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgIconSizeTheme copyWith({
    double? large,
    double? small,
  }) {
    return YgIconSizeTheme(
      large: large ?? this.large,
      small: small ?? this.small,
    );
  }

  @override
  YgIconSizeTheme lerp(covariant ThemeExtension<YgIconSizeTheme>? other, double t) {
    if (other is! YgIconSizeTheme) return this as YgIconSizeTheme;
    return YgIconSizeTheme(
      large: t < 0.5 ? large : other.large,
      small: t < 0.5 ? small : other.small,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgIconSizeTheme &&
            const DeepCollectionEquality().equals(large, other.large) &&
            const DeepCollectionEquality().equals(small, other.small));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(large),
      const DeepCollectionEquality().hash(small),
    );
  }
}
