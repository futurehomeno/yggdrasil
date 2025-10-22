// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'mobile_scanner_container_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgMobileScannerContainerTheme extends ThemeExtension<YgMobileScannerContainerTheme> {
  const YgMobileScannerContainerTheme({
    required this.backgroundColor,
    required this.borderRadius,
    required this.width,
  });

  final Color backgroundColor;
  final BorderRadius borderRadius;
  final double width;

  static final YgMobileScannerContainerTheme consumerLight = YgMobileScannerContainerTheme(
    backgroundColor: _$YgMobileScannerContainerTheme.backgroundColor[0],
    borderRadius: _$YgMobileScannerContainerTheme.borderRadius[0],
    width: _$YgMobileScannerContainerTheme.width[0],
  );

  static final YgMobileScannerContainerTheme consumerDark = YgMobileScannerContainerTheme(
    backgroundColor: _$YgMobileScannerContainerTheme.backgroundColor[1],
    borderRadius: _$YgMobileScannerContainerTheme.borderRadius[1],
    width: _$YgMobileScannerContainerTheme.width[1],
  );

  static final YgMobileScannerContainerTheme professionalLight = YgMobileScannerContainerTheme(
    backgroundColor: _$YgMobileScannerContainerTheme.backgroundColor[2],
    borderRadius: _$YgMobileScannerContainerTheme.borderRadius[2],
    width: _$YgMobileScannerContainerTheme.width[2],
  );

  static final YgMobileScannerContainerTheme professionalDark = YgMobileScannerContainerTheme(
    backgroundColor: _$YgMobileScannerContainerTheme.backgroundColor[3],
    borderRadius: _$YgMobileScannerContainerTheme.borderRadius[3],
    width: _$YgMobileScannerContainerTheme.width[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgMobileScannerContainerTheme copyWith({
    Color? backgroundColor,
    BorderRadius? borderRadius,
    double? width,
  }) {
    return YgMobileScannerContainerTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      borderRadius: borderRadius ?? this.borderRadius,
      width: width ?? this.width,
    );
  }

  @override
  YgMobileScannerContainerTheme lerp(covariant ThemeExtension<YgMobileScannerContainerTheme>? other, double t) {
    if (other is! YgMobileScannerContainerTheme) return this as YgMobileScannerContainerTheme;
    return YgMobileScannerContainerTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      borderRadius: t < 0.5 ? borderRadius : other.borderRadius,
      width: t < 0.5 ? width : other.width,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgMobileScannerContainerTheme &&
            const DeepCollectionEquality().equals(backgroundColor, other.backgroundColor) &&
            const DeepCollectionEquality().equals(borderRadius, other.borderRadius) &&
            const DeepCollectionEquality().equals(width, other.width));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(backgroundColor),
      const DeepCollectionEquality().hash(borderRadius),
      const DeepCollectionEquality().hash(width),
    );
  }
}
