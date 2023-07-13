// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'highlight_snackbar_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class HighlightSnackbarTheme extends ThemeExtension<HighlightSnackbarTheme> {
  const HighlightSnackbarTheme({
    required this.iconColor,
    required this.iconContainerColor,
  });

  final Color iconColor;
  final Color iconContainerColor;

  static final HighlightSnackbarTheme consumerLight = HighlightSnackbarTheme(
    iconColor: _$HighlightSnackbarTheme.iconColor[0],
    iconContainerColor: _$HighlightSnackbarTheme.iconContainerColor[0],
  );

  static final HighlightSnackbarTheme consumerDark = HighlightSnackbarTheme(
    iconColor: _$HighlightSnackbarTheme.iconColor[1],
    iconContainerColor: _$HighlightSnackbarTheme.iconContainerColor[1],
  );

  static final HighlightSnackbarTheme professionalLight =
      HighlightSnackbarTheme(
    iconColor: _$HighlightSnackbarTheme.iconColor[2],
    iconContainerColor: _$HighlightSnackbarTheme.iconContainerColor[2],
  );

  static final HighlightSnackbarTheme professionalDark = HighlightSnackbarTheme(
    iconColor: _$HighlightSnackbarTheme.iconColor[3],
    iconContainerColor: _$HighlightSnackbarTheme.iconContainerColor[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  HighlightSnackbarTheme copyWith({
    Color? iconColor,
    Color? iconContainerColor,
  }) {
    return HighlightSnackbarTheme(
      iconColor: iconColor ?? this.iconColor,
      iconContainerColor: iconContainerColor ?? this.iconContainerColor,
    );
  }

  @override
  HighlightSnackbarTheme lerp(
      covariant ThemeExtension<HighlightSnackbarTheme>? other, double t) {
    if (other is! HighlightSnackbarTheme) return this as HighlightSnackbarTheme;
    return HighlightSnackbarTheme(
      iconColor: Color.lerp(iconColor, other.iconColor, t)!,
      iconContainerColor:
          Color.lerp(iconContainerColor, other.iconContainerColor, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HighlightSnackbarTheme &&
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
