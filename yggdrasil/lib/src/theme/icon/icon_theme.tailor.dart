// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'icon_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgIconTheme extends ThemeExtension<YgIconTheme> {
  const YgIconTheme({
    required this.size,
    required this.tapSize,
  });

  final YgIconSizeTheme size;
  final YgIconTapSizeTheme tapSize;

  static final YgIconTheme consumerLight = YgIconTheme(
    size: _$YgIconTheme.size[0],
    tapSize: _$YgIconTheme.tapSize[0],
  );

  static final YgIconTheme consumerDark = YgIconTheme(
    size: _$YgIconTheme.size[1],
    tapSize: _$YgIconTheme.tapSize[1],
  );

  static final YgIconTheme professionalLight = YgIconTheme(
    size: _$YgIconTheme.size[2],
    tapSize: _$YgIconTheme.tapSize[2],
  );

  static final YgIconTheme professionalDark = YgIconTheme(
    size: _$YgIconTheme.size[3],
    tapSize: _$YgIconTheme.tapSize[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgIconTheme copyWith({
    YgIconSizeTheme? size,
    YgIconTapSizeTheme? tapSize,
  }) {
    return YgIconTheme(
      size: size ?? this.size,
      tapSize: tapSize ?? this.tapSize,
    );
  }

  @override
  YgIconTheme lerp(covariant ThemeExtension<YgIconTheme>? other, double t) {
    if (other is! YgIconTheme) return this as YgIconTheme;
    return YgIconTheme(
      size: size.lerp(other.size, t) as YgIconSizeTheme,
      tapSize: tapSize.lerp(other.tapSize, t) as YgIconTapSizeTheme,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgIconTheme &&
            const DeepCollectionEquality().equals(size, other.size) &&
            const DeepCollectionEquality().equals(tapSize, other.tapSize));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(size),
      const DeepCollectionEquality().hash(tapSize),
    );
  }
}
