// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'highlight_callout_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class HighlightCalloutTheme extends ThemeExtension<HighlightCalloutTheme> {
  const HighlightCalloutTheme({
    required this.backgroundColor,
    required this.borderColor,
  });

  final Color backgroundColor;
  final Color borderColor;

  static final HighlightCalloutTheme consumerLight = HighlightCalloutTheme(
    backgroundColor: _$HighlightCalloutTheme.backgroundColor[0],
    borderColor: _$HighlightCalloutTheme.borderColor[0],
  );

  static final HighlightCalloutTheme consumerDark = HighlightCalloutTheme(
    backgroundColor: _$HighlightCalloutTheme.backgroundColor[1],
    borderColor: _$HighlightCalloutTheme.borderColor[1],
  );

  static final HighlightCalloutTheme professionalLight = HighlightCalloutTheme(
    backgroundColor: _$HighlightCalloutTheme.backgroundColor[2],
    borderColor: _$HighlightCalloutTheme.borderColor[2],
  );

  static final HighlightCalloutTheme professionalDark = HighlightCalloutTheme(
    backgroundColor: _$HighlightCalloutTheme.backgroundColor[3],
    borderColor: _$HighlightCalloutTheme.borderColor[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  HighlightCalloutTheme copyWith({
    Color? backgroundColor,
    Color? borderColor,
  }) {
    return HighlightCalloutTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      borderColor: borderColor ?? this.borderColor,
    );
  }

  @override
  HighlightCalloutTheme lerp(
      covariant ThemeExtension<HighlightCalloutTheme>? other, double t) {
    if (other is! HighlightCalloutTheme) return this as HighlightCalloutTheme;
    return HighlightCalloutTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      borderColor: Color.lerp(borderColor, other.borderColor, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HighlightCalloutTheme &&
            const DeepCollectionEquality()
                .equals(backgroundColor, other.backgroundColor) &&
            const DeepCollectionEquality()
                .equals(borderColor, other.borderColor));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(backgroundColor),
      const DeepCollectionEquality().hash(borderColor),
    );
  }
}
