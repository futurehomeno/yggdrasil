// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'mobile_scanner_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgMobileScannerTheme extends ThemeExtension<YgMobileScannerTheme> {
  const YgMobileScannerTheme({
    required this.borderRadius,
    required this.size,
  });

  final BorderRadius borderRadius;
  final Size size;

  static final YgMobileScannerTheme consumerLight = YgMobileScannerTheme(
    borderRadius: _$YgMobileScannerTheme.borderRadius[0],
    size: _$YgMobileScannerTheme.size[0],
  );

  static final YgMobileScannerTheme consumerDark = YgMobileScannerTheme(
    borderRadius: _$YgMobileScannerTheme.borderRadius[1],
    size: _$YgMobileScannerTheme.size[1],
  );

  static final YgMobileScannerTheme professionalLight = YgMobileScannerTheme(
    borderRadius: _$YgMobileScannerTheme.borderRadius[2],
    size: _$YgMobileScannerTheme.size[2],
  );

  static final YgMobileScannerTheme professionalDark = YgMobileScannerTheme(
    borderRadius: _$YgMobileScannerTheme.borderRadius[3],
    size: _$YgMobileScannerTheme.size[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgMobileScannerTheme copyWith({
    BorderRadius? borderRadius,
    Size? size,
  }) {
    return YgMobileScannerTheme(
      borderRadius: borderRadius ?? this.borderRadius,
      size: size ?? this.size,
    );
  }

  @override
  YgMobileScannerTheme lerp(
      covariant ThemeExtension<YgMobileScannerTheme>? other, double t) {
    if (other is! YgMobileScannerTheme) return this as YgMobileScannerTheme;
    return YgMobileScannerTheme(
      borderRadius: t < 0.5 ? borderRadius : other.borderRadius,
      size: t < 0.5 ? size : other.size,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgMobileScannerTheme &&
            const DeepCollectionEquality()
                .equals(borderRadius, other.borderRadius) &&
            const DeepCollectionEquality().equals(size, other.size));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(borderRadius),
      const DeepCollectionEquality().hash(size),
    );
  }
}
