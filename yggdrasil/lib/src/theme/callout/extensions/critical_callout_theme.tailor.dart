// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'critical_callout_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class CriticalCalloutTheme extends ThemeExtension<CriticalCalloutTheme> {
  const CriticalCalloutTheme({
    required this.backgroundColor,
    required this.borderColor,
  });

  final Color backgroundColor;
  final Color borderColor;

  static final CriticalCalloutTheme consumerLight = CriticalCalloutTheme(
    backgroundColor: _$CriticalCalloutTheme.backgroundColor[0],
    borderColor: _$CriticalCalloutTheme.borderColor[0],
  );

  static final CriticalCalloutTheme consumerDark = CriticalCalloutTheme(
    backgroundColor: _$CriticalCalloutTheme.backgroundColor[1],
    borderColor: _$CriticalCalloutTheme.borderColor[1],
  );

  static final CriticalCalloutTheme professionalLight = CriticalCalloutTheme(
    backgroundColor: _$CriticalCalloutTheme.backgroundColor[2],
    borderColor: _$CriticalCalloutTheme.borderColor[2],
  );

  static final CriticalCalloutTheme professionalDark = CriticalCalloutTheme(
    backgroundColor: _$CriticalCalloutTheme.backgroundColor[3],
    borderColor: _$CriticalCalloutTheme.borderColor[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  CriticalCalloutTheme copyWith({
    Color? backgroundColor,
    Color? borderColor,
  }) {
    return CriticalCalloutTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      borderColor: borderColor ?? this.borderColor,
    );
  }

  @override
  CriticalCalloutTheme lerp(covariant ThemeExtension<CriticalCalloutTheme>? other, double t) {
    if (other is! CriticalCalloutTheme) return this as CriticalCalloutTheme;
    return CriticalCalloutTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      borderColor: Color.lerp(borderColor, other.borderColor, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CriticalCalloutTheme &&
            const DeepCollectionEquality().equals(backgroundColor, other.backgroundColor) &&
            const DeepCollectionEquality().equals(borderColor, other.borderColor));
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
