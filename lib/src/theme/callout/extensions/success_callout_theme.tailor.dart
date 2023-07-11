// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'success_callout_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class SuccessCalloutTheme extends ThemeExtension<SuccessCalloutTheme> {
  const SuccessCalloutTheme({
    required this.backgroundColor,
    required this.borderColor,
  });

  final Color backgroundColor;
  final Color borderColor;

  static final SuccessCalloutTheme consumerLight = SuccessCalloutTheme(
    backgroundColor: _$SuccessCalloutTheme.backgroundColor[0],
    borderColor: _$SuccessCalloutTheme.borderColor[0],
  );

  static final SuccessCalloutTheme consumerDark = SuccessCalloutTheme(
    backgroundColor: _$SuccessCalloutTheme.backgroundColor[1],
    borderColor: _$SuccessCalloutTheme.borderColor[1],
  );

  static final SuccessCalloutTheme professionalLight = SuccessCalloutTheme(
    backgroundColor: _$SuccessCalloutTheme.backgroundColor[2],
    borderColor: _$SuccessCalloutTheme.borderColor[2],
  );

  static final SuccessCalloutTheme professionalDark = SuccessCalloutTheme(
    backgroundColor: _$SuccessCalloutTheme.backgroundColor[3],
    borderColor: _$SuccessCalloutTheme.borderColor[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  SuccessCalloutTheme copyWith({
    Color? backgroundColor,
    Color? borderColor,
  }) {
    return SuccessCalloutTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      borderColor: borderColor ?? this.borderColor,
    );
  }

  @override
  SuccessCalloutTheme lerp(
      covariant ThemeExtension<SuccessCalloutTheme>? other, double t) {
    if (other is! SuccessCalloutTheme) return this as SuccessCalloutTheme;
    return SuccessCalloutTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      borderColor: Color.lerp(borderColor, other.borderColor, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SuccessCalloutTheme &&
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
