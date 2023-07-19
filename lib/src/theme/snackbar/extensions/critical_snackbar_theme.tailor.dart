// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'critical_snackbar_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class CriticalSnackbarTheme extends ThemeExtension<CriticalSnackbarTheme> {
  const CriticalSnackbarTheme({
    required this.iconColor,
    required this.iconContainerColor,
  });

  final Color iconColor;
  final Color iconContainerColor;

  static final CriticalSnackbarTheme consumerLight = CriticalSnackbarTheme(
    iconColor: _$CriticalSnackbarTheme.iconColor[0],
    iconContainerColor: _$CriticalSnackbarTheme.iconContainerColor[0],
  );

  static final CriticalSnackbarTheme consumerDark = CriticalSnackbarTheme(
    iconColor: _$CriticalSnackbarTheme.iconColor[1],
    iconContainerColor: _$CriticalSnackbarTheme.iconContainerColor[1],
  );

  static final CriticalSnackbarTheme professionalLight = CriticalSnackbarTheme(
    iconColor: _$CriticalSnackbarTheme.iconColor[2],
    iconContainerColor: _$CriticalSnackbarTheme.iconContainerColor[2],
  );

  static final CriticalSnackbarTheme professionalDark = CriticalSnackbarTheme(
    iconColor: _$CriticalSnackbarTheme.iconColor[3],
    iconContainerColor: _$CriticalSnackbarTheme.iconContainerColor[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  CriticalSnackbarTheme copyWith({
    Color? iconColor,
    Color? iconContainerColor,
  }) {
    return CriticalSnackbarTheme(
      iconColor: iconColor ?? this.iconColor,
      iconContainerColor: iconContainerColor ?? this.iconContainerColor,
    );
  }

  @override
  CriticalSnackbarTheme lerp(
      covariant ThemeExtension<CriticalSnackbarTheme>? other, double t) {
    if (other is! CriticalSnackbarTheme) return this as CriticalSnackbarTheme;
    return CriticalSnackbarTheme(
      iconColor: Color.lerp(iconColor, other.iconColor, t)!,
      iconContainerColor:
          Color.lerp(iconContainerColor, other.iconContainerColor, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CriticalSnackbarTheme &&
            const DeepCollectionEquality().equals(iconColor, other.iconColor) &&
            const DeepCollectionEquality()
                .equals(iconContainerColor, other.iconContainerColor));
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
