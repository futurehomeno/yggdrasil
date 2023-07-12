// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'critical_snackbar_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class CriticalSnackbarTheme extends ThemeExtension<CriticalSnackbarTheme> {
  const CriticalSnackbarTheme({
    required this.containerIconColor,
    required this.iconColor,
  });

  final Color containerIconColor;
  final Color iconColor;

  static final CriticalSnackbarTheme consumerLight = CriticalSnackbarTheme(
    containerIconColor: _$CriticalSnackbarTheme.containerIconColor[0],
    iconColor: _$CriticalSnackbarTheme.iconColor[0],
  );

  static final CriticalSnackbarTheme consumerDark = CriticalSnackbarTheme(
    containerIconColor: _$CriticalSnackbarTheme.containerIconColor[1],
    iconColor: _$CriticalSnackbarTheme.iconColor[1],
  );

  static final CriticalSnackbarTheme professionalLight = CriticalSnackbarTheme(
    containerIconColor: _$CriticalSnackbarTheme.containerIconColor[2],
    iconColor: _$CriticalSnackbarTheme.iconColor[2],
  );

  static final CriticalSnackbarTheme professionalDark = CriticalSnackbarTheme(
    containerIconColor: _$CriticalSnackbarTheme.containerIconColor[3],
    iconColor: _$CriticalSnackbarTheme.iconColor[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  CriticalSnackbarTheme copyWith({
    Color? containerIconColor,
    Color? iconColor,
  }) {
    return CriticalSnackbarTheme(
      containerIconColor: containerIconColor ?? this.containerIconColor,
      iconColor: iconColor ?? this.iconColor,
    );
  }

  @override
  CriticalSnackbarTheme lerp(
      covariant ThemeExtension<CriticalSnackbarTheme>? other, double t) {
    if (other is! CriticalSnackbarTheme) return this as CriticalSnackbarTheme;
    return CriticalSnackbarTheme(
      containerIconColor:
          Color.lerp(containerIconColor, other.containerIconColor, t)!,
      iconColor: Color.lerp(iconColor, other.iconColor, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CriticalSnackbarTheme &&
            const DeepCollectionEquality()
                .equals(containerIconColor, other.containerIconColor) &&
            const DeepCollectionEquality().equals(iconColor, other.iconColor));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(containerIconColor),
      const DeepCollectionEquality().hash(iconColor),
    );
  }
}
