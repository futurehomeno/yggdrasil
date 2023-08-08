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
    required this.activeColor,
    required this.activeIndicatorSize,
    required this.indicatorContainerSize,
  });

  final Color activeColor;
  final double activeIndicatorSize;
  final double indicatorContainerSize;

  static final CircularProgressIndicatorTheme consumerLight =
      CircularProgressIndicatorTheme(
    activeColor: _$CircularProgressIndicatorTheme.activeColor[0],
    activeIndicatorSize:
        _$CircularProgressIndicatorTheme.activeIndicatorSize[0],
    indicatorContainerSize:
        _$CircularProgressIndicatorTheme.indicatorContainerSize[0],
  );

  static final CircularProgressIndicatorTheme consumerDark =
      CircularProgressIndicatorTheme(
    activeColor: _$CircularProgressIndicatorTheme.activeColor[1],
    activeIndicatorSize:
        _$CircularProgressIndicatorTheme.activeIndicatorSize[1],
    indicatorContainerSize:
        _$CircularProgressIndicatorTheme.indicatorContainerSize[1],
  );

  static final CircularProgressIndicatorTheme professionalLight =
      CircularProgressIndicatorTheme(
    activeColor: _$CircularProgressIndicatorTheme.activeColor[2],
    activeIndicatorSize:
        _$CircularProgressIndicatorTheme.activeIndicatorSize[2],
    indicatorContainerSize:
        _$CircularProgressIndicatorTheme.indicatorContainerSize[2],
  );

  static final CircularProgressIndicatorTheme professionalDark =
      CircularProgressIndicatorTheme(
    activeColor: _$CircularProgressIndicatorTheme.activeColor[3],
    activeIndicatorSize:
        _$CircularProgressIndicatorTheme.activeIndicatorSize[3],
    indicatorContainerSize:
        _$CircularProgressIndicatorTheme.indicatorContainerSize[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  CircularProgressIndicatorTheme copyWith({
    Color? activeColor,
    double? activeIndicatorSize,
    double? indicatorContainerSize,
  }) {
    return CircularProgressIndicatorTheme(
      activeColor: activeColor ?? this.activeColor,
      activeIndicatorSize: activeIndicatorSize ?? this.activeIndicatorSize,
      indicatorContainerSize:
          indicatorContainerSize ?? this.indicatorContainerSize,
    );
  }

  @override
  CircularProgressIndicatorTheme lerp(
      covariant ThemeExtension<CircularProgressIndicatorTheme>? other,
      double t) {
    if (other is! CircularProgressIndicatorTheme)
      return this as CircularProgressIndicatorTheme;
    return CircularProgressIndicatorTheme(
      activeColor: Color.lerp(activeColor, other.activeColor, t)!,
      activeIndicatorSize:
          t < 0.5 ? activeIndicatorSize : other.activeIndicatorSize,
      indicatorContainerSize:
          t < 0.5 ? indicatorContainerSize : other.indicatorContainerSize,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CircularProgressIndicatorTheme &&
            const DeepCollectionEquality()
                .equals(activeColor, other.activeColor) &&
            const DeepCollectionEquality()
                .equals(activeIndicatorSize, other.activeIndicatorSize) &&
            const DeepCollectionEquality()
                .equals(indicatorContainerSize, other.indicatorContainerSize));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(activeColor),
      const DeepCollectionEquality().hash(activeIndicatorSize),
      const DeepCollectionEquality().hash(indicatorContainerSize),
    );
  }
}
