// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'linear_progress_indicator_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class LinearProgressIndicatorTheme
    extends ThemeExtension<LinearProgressIndicatorTheme> {
  const LinearProgressIndicatorTheme({
    required this.activeColor,
    required this.backgroundColor,
    required this.borderRadius,
    required this.height,
  });

  final Color activeColor;
  final Color backgroundColor;
  final BorderRadius borderRadius;
  final double height;

  static final LinearProgressIndicatorTheme consumerLight =
      LinearProgressIndicatorTheme(
    activeColor: _$LinearProgressIndicatorTheme.activeColor[0],
    backgroundColor: _$LinearProgressIndicatorTheme.backgroundColor[0],
    borderRadius: _$LinearProgressIndicatorTheme.borderRadius[0],
    height: _$LinearProgressIndicatorTheme.height[0],
  );

  static final LinearProgressIndicatorTheme consumerDark =
      LinearProgressIndicatorTheme(
    activeColor: _$LinearProgressIndicatorTheme.activeColor[1],
    backgroundColor: _$LinearProgressIndicatorTheme.backgroundColor[1],
    borderRadius: _$LinearProgressIndicatorTheme.borderRadius[1],
    height: _$LinearProgressIndicatorTheme.height[1],
  );

  static final LinearProgressIndicatorTheme professionalLight =
      LinearProgressIndicatorTheme(
    activeColor: _$LinearProgressIndicatorTheme.activeColor[2],
    backgroundColor: _$LinearProgressIndicatorTheme.backgroundColor[2],
    borderRadius: _$LinearProgressIndicatorTheme.borderRadius[2],
    height: _$LinearProgressIndicatorTheme.height[2],
  );

  static final LinearProgressIndicatorTheme professionalDark =
      LinearProgressIndicatorTheme(
    activeColor: _$LinearProgressIndicatorTheme.activeColor[3],
    backgroundColor: _$LinearProgressIndicatorTheme.backgroundColor[3],
    borderRadius: _$LinearProgressIndicatorTheme.borderRadius[3],
    height: _$LinearProgressIndicatorTheme.height[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  LinearProgressIndicatorTheme copyWith({
    Color? activeColor,
    Color? backgroundColor,
    BorderRadius? borderRadius,
    double? height,
  }) {
    return LinearProgressIndicatorTheme(
      activeColor: activeColor ?? this.activeColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      borderRadius: borderRadius ?? this.borderRadius,
      height: height ?? this.height,
    );
  }

  @override
  LinearProgressIndicatorTheme lerp(
      covariant ThemeExtension<LinearProgressIndicatorTheme>? other, double t) {
    if (other is! LinearProgressIndicatorTheme)
      return this as LinearProgressIndicatorTheme;
    return LinearProgressIndicatorTheme(
      activeColor: Color.lerp(activeColor, other.activeColor, t)!,
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      borderRadius: t < 0.5 ? borderRadius : other.borderRadius,
      height: t < 0.5 ? height : other.height,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LinearProgressIndicatorTheme &&
            const DeepCollectionEquality()
                .equals(activeColor, other.activeColor) &&
            const DeepCollectionEquality()
                .equals(backgroundColor, other.backgroundColor) &&
            const DeepCollectionEquality()
                .equals(borderRadius, other.borderRadius) &&
            const DeepCollectionEquality().equals(height, other.height));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(activeColor),
      const DeepCollectionEquality().hash(backgroundColor),
      const DeepCollectionEquality().hash(borderRadius),
      const DeepCollectionEquality().hash(height),
    );
  }
}
