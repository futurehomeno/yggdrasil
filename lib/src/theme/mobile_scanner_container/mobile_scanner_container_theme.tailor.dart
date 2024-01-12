// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'mobile_scanner_container_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgMobileScannerContainerTheme
    extends ThemeExtension<YgMobileScannerContainerTheme> {
  const YgMobileScannerContainerTheme({
    required this.borderRadius,
    required this.size,
  });

  final BorderRadius borderRadius;
  final Size size;

  static final YgMobileScannerContainerTheme consumerLight =
      YgMobileScannerContainerTheme(
    borderRadius: _$YgMobileScannerContainerTheme.borderRadius[0],
    size: _$YgMobileScannerContainerTheme.size[0],
  );

  static final YgMobileScannerContainerTheme consumerDark =
      YgMobileScannerContainerTheme(
    borderRadius: _$YgMobileScannerContainerTheme.borderRadius[1],
    size: _$YgMobileScannerContainerTheme.size[1],
  );

  static final YgMobileScannerContainerTheme professionalLight =
      YgMobileScannerContainerTheme(
    borderRadius: _$YgMobileScannerContainerTheme.borderRadius[2],
    size: _$YgMobileScannerContainerTheme.size[2],
  );

  static final YgMobileScannerContainerTheme professionalDark =
      YgMobileScannerContainerTheme(
    borderRadius: _$YgMobileScannerContainerTheme.borderRadius[3],
    size: _$YgMobileScannerContainerTheme.size[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgMobileScannerContainerTheme copyWith({
    BorderRadius? borderRadius,
    Size? size,
  }) {
    return YgMobileScannerContainerTheme(
      borderRadius: borderRadius ?? this.borderRadius,
      size: size ?? this.size,
    );
  }

  @override
  YgMobileScannerContainerTheme lerp(
      covariant ThemeExtension<YgMobileScannerContainerTheme>? other,
      double t) {
    if (other is! YgMobileScannerContainerTheme)
      return this as YgMobileScannerContainerTheme;
    return YgMobileScannerContainerTheme(
      borderRadius: t < 0.5 ? borderRadius : other.borderRadius,
      size: t < 0.5 ? size : other.size,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgMobileScannerContainerTheme &&
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
