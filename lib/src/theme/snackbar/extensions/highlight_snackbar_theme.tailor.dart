// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'highlight_snackbar_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class HighlightSnackbarTheme extends ThemeExtension<HighlightSnackbarTheme> {
  const HighlightSnackbarTheme({
    required this.containerIconColor,
    required this.iconColor,
  });

  final Color containerIconColor;
  final Color iconColor;

  static final HighlightSnackbarTheme consumerLight = HighlightSnackbarTheme(
    containerIconColor: _$HighlightSnackbarTheme.containerIconColor[0],
    iconColor: _$HighlightSnackbarTheme.iconColor[0],
  );

  static final HighlightSnackbarTheme consumerDark = HighlightSnackbarTheme(
    containerIconColor: _$HighlightSnackbarTheme.containerIconColor[1],
    iconColor: _$HighlightSnackbarTheme.iconColor[1],
  );

  static final HighlightSnackbarTheme professionalLight =
      HighlightSnackbarTheme(
    containerIconColor: _$HighlightSnackbarTheme.containerIconColor[2],
    iconColor: _$HighlightSnackbarTheme.iconColor[2],
  );

  static final HighlightSnackbarTheme professionalDark = HighlightSnackbarTheme(
    containerIconColor: _$HighlightSnackbarTheme.containerIconColor[3],
    iconColor: _$HighlightSnackbarTheme.iconColor[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  HighlightSnackbarTheme copyWith({
    Color? containerIconColor,
    Color? iconColor,
  }) {
    return HighlightSnackbarTheme(
      containerIconColor: containerIconColor ?? this.containerIconColor,
      iconColor: iconColor ?? this.iconColor,
    );
  }

  @override
  HighlightSnackbarTheme lerp(
      covariant ThemeExtension<HighlightSnackbarTheme>? other, double t) {
    if (other is! HighlightSnackbarTheme) return this as HighlightSnackbarTheme;
    return HighlightSnackbarTheme(
      containerIconColor:
          Color.lerp(containerIconColor, other.containerIconColor, t)!,
      iconColor: Color.lerp(iconColor, other.iconColor, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HighlightSnackbarTheme &&
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
