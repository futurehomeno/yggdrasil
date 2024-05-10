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
    required this.backgroundColor,
    required this.borderRadius,
    required this.color,
    required this.height,
  });

  final Color backgroundColor;
  final BorderRadius borderRadius;
  final Color color;
  final double height;

  static final LinearProgressIndicatorTheme consumerLight =
      LinearProgressIndicatorTheme(
    backgroundColor: _$LinearProgressIndicatorTheme.backgroundColor[0],
    borderRadius: _$LinearProgressIndicatorTheme.borderRadius[0],
    color: _$LinearProgressIndicatorTheme.color[0],
    height: _$LinearProgressIndicatorTheme.height[0],
  );

  static final LinearProgressIndicatorTheme consumerDark =
      LinearProgressIndicatorTheme(
    backgroundColor: _$LinearProgressIndicatorTheme.backgroundColor[1],
    borderRadius: _$LinearProgressIndicatorTheme.borderRadius[1],
    color: _$LinearProgressIndicatorTheme.color[1],
    height: _$LinearProgressIndicatorTheme.height[1],
  );

  static final LinearProgressIndicatorTheme professionalLight =
      LinearProgressIndicatorTheme(
    backgroundColor: _$LinearProgressIndicatorTheme.backgroundColor[2],
    borderRadius: _$LinearProgressIndicatorTheme.borderRadius[2],
    color: _$LinearProgressIndicatorTheme.color[2],
    height: _$LinearProgressIndicatorTheme.height[2],
  );

  static final LinearProgressIndicatorTheme professionalDark =
      LinearProgressIndicatorTheme(
    backgroundColor: _$LinearProgressIndicatorTheme.backgroundColor[3],
    borderRadius: _$LinearProgressIndicatorTheme.borderRadius[3],
    color: _$LinearProgressIndicatorTheme.color[3],
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
    Color? backgroundColor,
    BorderRadius? borderRadius,
    Color? color,
    double? height,
  }) {
    return LinearProgressIndicatorTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      borderRadius: borderRadius ?? this.borderRadius,
      color: color ?? this.color,
      height: height ?? this.height,
    );
  }

  @override
  LinearProgressIndicatorTheme lerp(
      covariant ThemeExtension<LinearProgressIndicatorTheme>? other, double t) {
    if (other is! LinearProgressIndicatorTheme)
      return this as LinearProgressIndicatorTheme;
    return LinearProgressIndicatorTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      borderRadius: t < 0.5 ? borderRadius : other.borderRadius,
      color: Color.lerp(color, other.color, t)!,
      height: t < 0.5 ? height : other.height,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LinearProgressIndicatorTheme &&
            const DeepCollectionEquality()
                .equals(backgroundColor, other.backgroundColor) &&
            const DeepCollectionEquality()
                .equals(borderRadius, other.borderRadius) &&
            const DeepCollectionEquality().equals(color, other.color) &&
            const DeepCollectionEquality().equals(height, other.height));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(backgroundColor),
      const DeepCollectionEquality().hash(borderRadius),
      const DeepCollectionEquality().hash(color),
      const DeepCollectionEquality().hash(height),
    );
  }
}
