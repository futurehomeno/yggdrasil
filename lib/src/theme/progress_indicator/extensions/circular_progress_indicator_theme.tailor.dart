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
    required this.indicatorContainerSize,
    required this.indicatorSize,
  });

  final Color color;
  final double indicatorContainerSize;
  final double indicatorSize;

  static final CircularProgressIndicatorTheme consumerLight =
      CircularProgressIndicatorTheme(
    color: _$CircularProgressIndicatorTheme.color[0],
    indicatorContainerSize:
        _$CircularProgressIndicatorTheme.indicatorContainerSize[0],
    indicatorSize: _$CircularProgressIndicatorTheme.indicatorSize[0],
  );

  static final CircularProgressIndicatorTheme consumerDark =
      CircularProgressIndicatorTheme(
    color: _$CircularProgressIndicatorTheme.color[1],
    indicatorContainerSize:
        _$CircularProgressIndicatorTheme.indicatorContainerSize[1],
    indicatorSize: _$CircularProgressIndicatorTheme.indicatorSize[1],
  );

  static final CircularProgressIndicatorTheme professionalLight =
      CircularProgressIndicatorTheme(
    color: _$CircularProgressIndicatorTheme.color[2],
    indicatorContainerSize:
        _$CircularProgressIndicatorTheme.indicatorContainerSize[2],
    indicatorSize: _$CircularProgressIndicatorTheme.indicatorSize[2],
  );

  static final CircularProgressIndicatorTheme professionalDark =
      CircularProgressIndicatorTheme(
    color: _$CircularProgressIndicatorTheme.color[3],
    indicatorContainerSize:
        _$CircularProgressIndicatorTheme.indicatorContainerSize[3],
    indicatorSize: _$CircularProgressIndicatorTheme.indicatorSize[3],
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
    double? indicatorContainerSize,
    double? indicatorSize,
  }) {
    return CircularProgressIndicatorTheme(
      color: color ?? this.color,
      indicatorContainerSize:
          indicatorContainerSize ?? this.indicatorContainerSize,
      indicatorSize: indicatorSize ?? this.indicatorSize,
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
      indicatorContainerSize:
          t < 0.5 ? indicatorContainerSize : other.indicatorContainerSize,
      indicatorSize: t < 0.5 ? indicatorSize : other.indicatorSize,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CircularProgressIndicatorTheme &&
            const DeepCollectionEquality().equals(color, other.color) &&
            const DeepCollectionEquality()
                .equals(indicatorContainerSize, other.indicatorContainerSize) &&
            const DeepCollectionEquality()
                .equals(indicatorSize, other.indicatorSize));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(color),
      const DeepCollectionEquality().hash(indicatorContainerSize),
      const DeepCollectionEquality().hash(indicatorSize),
    );
  }
}
