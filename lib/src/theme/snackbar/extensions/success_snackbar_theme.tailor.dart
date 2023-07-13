// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'success_snackbar_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class SuccessSnackbarTheme extends ThemeExtension<SuccessSnackbarTheme> {
  const SuccessSnackbarTheme({
    required this.iconColor,
    required this.iconContainerColor,
  });

  final Color iconColor;
  final Color iconContainerColor;

  static final SuccessSnackbarTheme consumerLight = SuccessSnackbarTheme(
    iconColor: _$SuccessSnackbarTheme.iconColor[0],
    iconContainerColor: _$SuccessSnackbarTheme.iconContainerColor[0],
  );

  static final SuccessSnackbarTheme consumerDark = SuccessSnackbarTheme(
    iconColor: _$SuccessSnackbarTheme.iconColor[1],
    iconContainerColor: _$SuccessSnackbarTheme.iconContainerColor[1],
  );

  static final SuccessSnackbarTheme professionalLight = SuccessSnackbarTheme(
    iconColor: _$SuccessSnackbarTheme.iconColor[2],
    iconContainerColor: _$SuccessSnackbarTheme.iconContainerColor[2],
  );

  static final SuccessSnackbarTheme professionalDark = SuccessSnackbarTheme(
    iconColor: _$SuccessSnackbarTheme.iconColor[3],
    iconContainerColor: _$SuccessSnackbarTheme.iconContainerColor[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  SuccessSnackbarTheme copyWith({
    Color? iconColor,
    Color? iconContainerColor,
  }) {
    return SuccessSnackbarTheme(
      iconColor: iconColor ?? this.iconColor,
      iconContainerColor: iconContainerColor ?? this.iconContainerColor,
    );
  }

  @override
  SuccessSnackbarTheme lerp(
      covariant ThemeExtension<SuccessSnackbarTheme>? other, double t) {
    if (other is! SuccessSnackbarTheme) return this as SuccessSnackbarTheme;
    return SuccessSnackbarTheme(
      iconColor: Color.lerp(iconColor, other.iconColor, t)!,
      iconContainerColor:
          Color.lerp(iconContainerColor, other.iconContainerColor, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SuccessSnackbarTheme &&
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
