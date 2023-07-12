// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'success_snackbar_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class SuccessSnackbarTheme extends ThemeExtension<SuccessSnackbarTheme> {
  const SuccessSnackbarTheme({
    required this.containerIconColor,
    required this.iconColor,
  });

  final Color containerIconColor;
  final Color iconColor;

  static final SuccessSnackbarTheme consumerLight = SuccessSnackbarTheme(
    containerIconColor: _$SuccessSnackbarTheme.containerIconColor[0],
    iconColor: _$SuccessSnackbarTheme.iconColor[0],
  );

  static final SuccessSnackbarTheme consumerDark = SuccessSnackbarTheme(
    containerIconColor: _$SuccessSnackbarTheme.containerIconColor[1],
    iconColor: _$SuccessSnackbarTheme.iconColor[1],
  );

  static final SuccessSnackbarTheme professionalLight = SuccessSnackbarTheme(
    containerIconColor: _$SuccessSnackbarTheme.containerIconColor[2],
    iconColor: _$SuccessSnackbarTheme.iconColor[2],
  );

  static final SuccessSnackbarTheme professionalDark = SuccessSnackbarTheme(
    containerIconColor: _$SuccessSnackbarTheme.containerIconColor[3],
    iconColor: _$SuccessSnackbarTheme.iconColor[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  SuccessSnackbarTheme copyWith({
    Color? containerIconColor,
    Color? iconColor,
  }) {
    return SuccessSnackbarTheme(
      containerIconColor: containerIconColor ?? this.containerIconColor,
      iconColor: iconColor ?? this.iconColor,
    );
  }

  @override
  SuccessSnackbarTheme lerp(
      covariant ThemeExtension<SuccessSnackbarTheme>? other, double t) {
    if (other is! SuccessSnackbarTheme) return this as SuccessSnackbarTheme;
    return SuccessSnackbarTheme(
      containerIconColor:
          Color.lerp(containerIconColor, other.containerIconColor, t)!,
      iconColor: Color.lerp(iconColor, other.iconColor, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SuccessSnackbarTheme &&
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
