// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'critical_snack_bar_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class CriticalSnackBarTheme extends ThemeExtension<CriticalSnackBarTheme> {
  const CriticalSnackBarTheme({
    required this.iconColor,
    required this.iconContainerColor,
  });

  final Color iconColor;
  final Color iconContainerColor;

  static final CriticalSnackBarTheme consumerLight = CriticalSnackBarTheme(
    iconColor: _$CriticalSnackBarTheme.iconColor[0],
    iconContainerColor: _$CriticalSnackBarTheme.iconContainerColor[0],
  );

  static final CriticalSnackBarTheme consumerDark = CriticalSnackBarTheme(
    iconColor: _$CriticalSnackBarTheme.iconColor[1],
    iconContainerColor: _$CriticalSnackBarTheme.iconContainerColor[1],
  );

  static final CriticalSnackBarTheme professionalLight = CriticalSnackBarTheme(
    iconColor: _$CriticalSnackBarTheme.iconColor[2],
    iconContainerColor: _$CriticalSnackBarTheme.iconContainerColor[2],
  );

  static final CriticalSnackBarTheme professionalDark = CriticalSnackBarTheme(
    iconColor: _$CriticalSnackBarTheme.iconColor[3],
    iconContainerColor: _$CriticalSnackBarTheme.iconContainerColor[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  CriticalSnackBarTheme copyWith({
    Color? iconColor,
    Color? iconContainerColor,
  }) {
    return CriticalSnackBarTheme(
      iconColor: iconColor ?? this.iconColor,
      iconContainerColor: iconContainerColor ?? this.iconContainerColor,
    );
  }

  @override
  CriticalSnackBarTheme lerp(covariant ThemeExtension<CriticalSnackBarTheme>? other, double t) {
    if (other is! CriticalSnackBarTheme) return this as CriticalSnackBarTheme;
    return CriticalSnackBarTheme(
      iconColor: Color.lerp(iconColor, other.iconColor, t)!,
      iconContainerColor: Color.lerp(iconContainerColor, other.iconContainerColor, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CriticalSnackBarTheme &&
            const DeepCollectionEquality().equals(iconColor, other.iconColor) &&
            const DeepCollectionEquality().equals(iconContainerColor, other.iconContainerColor));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(iconColor),
      const DeepCollectionEquality().hash(iconContainerColor),
    );
  }
}
