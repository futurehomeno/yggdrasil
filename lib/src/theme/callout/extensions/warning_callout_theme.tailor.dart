// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'warning_callout_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class WarningCalloutTheme extends ThemeExtension<WarningCalloutTheme> {
  const WarningCalloutTheme({
    required this.backgroundColor,
    required this.borderColor,
  });

  final Color backgroundColor;
  final Color borderColor;

  static final WarningCalloutTheme consumerLight = WarningCalloutTheme(
    backgroundColor: _$WarningCalloutTheme.backgroundColor[0],
    borderColor: _$WarningCalloutTheme.borderColor[0],
  );

  static final WarningCalloutTheme consumerDark = WarningCalloutTheme(
    backgroundColor: _$WarningCalloutTheme.backgroundColor[1],
    borderColor: _$WarningCalloutTheme.borderColor[1],
  );

  static final WarningCalloutTheme professionalLight = WarningCalloutTheme(
    backgroundColor: _$WarningCalloutTheme.backgroundColor[2],
    borderColor: _$WarningCalloutTheme.borderColor[2],
  );

  static final WarningCalloutTheme professionalDark = WarningCalloutTheme(
    backgroundColor: _$WarningCalloutTheme.backgroundColor[3],
    borderColor: _$WarningCalloutTheme.borderColor[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  WarningCalloutTheme copyWith({
    Color? backgroundColor,
    Color? borderColor,
  }) {
    return WarningCalloutTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      borderColor: borderColor ?? this.borderColor,
    );
  }

  @override
  WarningCalloutTheme lerp(
      covariant ThemeExtension<WarningCalloutTheme>? other, double t) {
    if (other is! WarningCalloutTheme) return this as WarningCalloutTheme;
    return WarningCalloutTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      borderColor: Color.lerp(borderColor, other.borderColor, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WarningCalloutTheme &&
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
