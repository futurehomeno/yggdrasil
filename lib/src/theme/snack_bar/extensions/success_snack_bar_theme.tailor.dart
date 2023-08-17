// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'success_snack_bar_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class SuccessSnackBarTheme extends ThemeExtension<SuccessSnackBarTheme> {
  const SuccessSnackBarTheme({
    required this.iconColor,
    required this.iconContainerColor,
  });

  final Color iconColor;
  final Color iconContainerColor;

  static final SuccessSnackBarTheme consumerLight = SuccessSnackBarTheme(
    iconColor: _$SuccessSnackBarTheme.iconColor[0],
    iconContainerColor: _$SuccessSnackBarTheme.iconContainerColor[0],
  );

  static final SuccessSnackBarTheme consumerDark = SuccessSnackBarTheme(
    iconColor: _$SuccessSnackBarTheme.iconColor[1],
    iconContainerColor: _$SuccessSnackBarTheme.iconContainerColor[1],
  );

  static final SuccessSnackBarTheme professionalLight = SuccessSnackBarTheme(
    iconColor: _$SuccessSnackBarTheme.iconColor[2],
    iconContainerColor: _$SuccessSnackBarTheme.iconContainerColor[2],
  );

  static final SuccessSnackBarTheme professionalDark = SuccessSnackBarTheme(
    iconColor: _$SuccessSnackBarTheme.iconColor[3],
    iconContainerColor: _$SuccessSnackBarTheme.iconContainerColor[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  SuccessSnackBarTheme copyWith({
    Color? iconColor,
    Color? iconContainerColor,
  }) {
    return SuccessSnackBarTheme(
      iconColor: iconColor ?? this.iconColor,
      iconContainerColor: iconContainerColor ?? this.iconContainerColor,
    );
  }

  @override
  SuccessSnackBarTheme lerp(covariant ThemeExtension<SuccessSnackBarTheme>? other, double t) {
    if (other is! SuccessSnackBarTheme) return this as SuccessSnackBarTheme;
    return SuccessSnackBarTheme(
      iconColor: Color.lerp(iconColor, other.iconColor, t)!,
      iconContainerColor: Color.lerp(iconContainerColor, other.iconContainerColor, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SuccessSnackBarTheme &&
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
