// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'highlight_snack_bar_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class HighlightSnackBarTheme extends ThemeExtension<HighlightSnackBarTheme> {
  const HighlightSnackBarTheme({
    required this.iconColor,
    required this.iconContainerColor,
  });

  final Color iconColor;
  final Color iconContainerColor;

  static final HighlightSnackBarTheme consumerLight = HighlightSnackBarTheme(
    iconColor: _$HighlightSnackBarTheme.iconColor[0],
    iconContainerColor: _$HighlightSnackBarTheme.iconContainerColor[0],
  );

  static final HighlightSnackBarTheme consumerDark = HighlightSnackBarTheme(
    iconColor: _$HighlightSnackBarTheme.iconColor[1],
    iconContainerColor: _$HighlightSnackBarTheme.iconContainerColor[1],
  );

  static final HighlightSnackBarTheme professionalLight = HighlightSnackBarTheme(
    iconColor: _$HighlightSnackBarTheme.iconColor[2],
    iconContainerColor: _$HighlightSnackBarTheme.iconContainerColor[2],
  );

  static final HighlightSnackBarTheme professionalDark = HighlightSnackBarTheme(
    iconColor: _$HighlightSnackBarTheme.iconColor[3],
    iconContainerColor: _$HighlightSnackBarTheme.iconContainerColor[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  HighlightSnackBarTheme copyWith({
    Color? iconColor,
    Color? iconContainerColor,
  }) {
    return HighlightSnackBarTheme(
      iconColor: iconColor ?? this.iconColor,
      iconContainerColor: iconContainerColor ?? this.iconContainerColor,
    );
  }

  @override
  HighlightSnackBarTheme lerp(covariant ThemeExtension<HighlightSnackBarTheme>? other, double t) {
    if (other is! HighlightSnackBarTheme) return this as HighlightSnackBarTheme;
    return HighlightSnackBarTheme(
      iconColor: Color.lerp(iconColor, other.iconColor, t)!,
      iconContainerColor: Color.lerp(iconContainerColor, other.iconContainerColor, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HighlightSnackBarTheme &&
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
