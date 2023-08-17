// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'circular_progress_indicator_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class CircularProgressIndicatorTheme
    extends ThemeExtension<CircularProgressIndicatorTheme> {
  const CircularProgressIndicatorTheme({
    required this.color,
    required this.containerSize,
    required this.size,
    required this.strokeWidth,
  });

  final Color color;
  final double containerSize;
  final double size;
  final double strokeWidth;

  static final CircularProgressIndicatorTheme consumerLight =
      CircularProgressIndicatorTheme(
    color: _$CircularProgressIndicatorTheme.color[0],
    containerSize: _$CircularProgressIndicatorTheme.containerSize[0],
    size: _$CircularProgressIndicatorTheme.size[0],
    strokeWidth: _$CircularProgressIndicatorTheme.strokeWidth[0],
  );

  static final CircularProgressIndicatorTheme consumerDark =
      CircularProgressIndicatorTheme(
    color: _$CircularProgressIndicatorTheme.color[1],
    containerSize: _$CircularProgressIndicatorTheme.containerSize[1],
    size: _$CircularProgressIndicatorTheme.size[1],
    strokeWidth: _$CircularProgressIndicatorTheme.strokeWidth[1],
  );

  static final CircularProgressIndicatorTheme professionalLight =
      CircularProgressIndicatorTheme(
    color: _$CircularProgressIndicatorTheme.color[2],
    containerSize: _$CircularProgressIndicatorTheme.containerSize[2],
    size: _$CircularProgressIndicatorTheme.size[2],
    strokeWidth: _$CircularProgressIndicatorTheme.strokeWidth[2],
  );

  static final CircularProgressIndicatorTheme professionalDark =
      CircularProgressIndicatorTheme(
    color: _$CircularProgressIndicatorTheme.color[3],
    containerSize: _$CircularProgressIndicatorTheme.containerSize[3],
    size: _$CircularProgressIndicatorTheme.size[3],
    strokeWidth: _$CircularProgressIndicatorTheme.strokeWidth[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  CircularProgressIndicatorTheme copyWith({
    Color? color,
    double? containerSize,
    double? size,
    double? strokeWidth,
  }) {
    return CircularProgressIndicatorTheme(
      color: color ?? this.color,
      containerSize: containerSize ?? this.containerSize,
      size: size ?? this.size,
      strokeWidth: strokeWidth ?? this.strokeWidth,
    );
  }

  @override
  CircularProgressIndicatorTheme lerp(
      covariant ThemeExtension<CircularProgressIndicatorTheme>? other,
      double t) {
    if (other is! CircularProgressIndicatorTheme)
      return this as CircularProgressIndicatorTheme;
    return CircularProgressIndicatorTheme(
      color: Color.lerp(color, other.color, t)!,
      containerSize: t < 0.5 ? containerSize : other.containerSize,
      size: t < 0.5 ? size : other.size,
      strokeWidth: t < 0.5 ? strokeWidth : other.strokeWidth,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CircularProgressIndicatorTheme &&
            const DeepCollectionEquality().equals(color, other.color) &&
            const DeepCollectionEquality()
                .equals(containerSize, other.containerSize) &&
            const DeepCollectionEquality().equals(size, other.size) &&
            const DeepCollectionEquality()
                .equals(strokeWidth, other.strokeWidth));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(color),
      const DeepCollectionEquality().hash(containerSize),
      const DeepCollectionEquality().hash(size),
      const DeepCollectionEquality().hash(strokeWidth),
    );
  }
}
