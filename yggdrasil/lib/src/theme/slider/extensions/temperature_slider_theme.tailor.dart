// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'temperature_slider_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgTemperatureSliderTheme
    extends ThemeExtension<YgTemperatureSliderTheme> {
  const YgTemperatureSliderTheme({
    required this.differenceIndicatorDecreasingColor,
    required this.differenceIndicatorIncreasingColor,
    required this.trackDecreasingColor,
    required this.trackIncreasingColor,
  });

  final Color differenceIndicatorDecreasingColor;
  final Color differenceIndicatorIncreasingColor;
  final Color trackDecreasingColor;
  final Color trackIncreasingColor;

  static final YgTemperatureSliderTheme consumerLight =
      YgTemperatureSliderTheme(
    differenceIndicatorDecreasingColor:
        _$YgTemperatureSliderTheme.differenceIndicatorDecreasingColor[0],
    differenceIndicatorIncreasingColor:
        _$YgTemperatureSliderTheme.differenceIndicatorIncreasingColor[0],
    trackDecreasingColor: _$YgTemperatureSliderTheme.trackDecreasingColor[0],
    trackIncreasingColor: _$YgTemperatureSliderTheme.trackIncreasingColor[0],
  );

  static final YgTemperatureSliderTheme consumerDark = YgTemperatureSliderTheme(
    differenceIndicatorDecreasingColor:
        _$YgTemperatureSliderTheme.differenceIndicatorDecreasingColor[1],
    differenceIndicatorIncreasingColor:
        _$YgTemperatureSliderTheme.differenceIndicatorIncreasingColor[1],
    trackDecreasingColor: _$YgTemperatureSliderTheme.trackDecreasingColor[1],
    trackIncreasingColor: _$YgTemperatureSliderTheme.trackIncreasingColor[1],
  );

  static final YgTemperatureSliderTheme professionalLight =
      YgTemperatureSliderTheme(
    differenceIndicatorDecreasingColor:
        _$YgTemperatureSliderTheme.differenceIndicatorDecreasingColor[2],
    differenceIndicatorIncreasingColor:
        _$YgTemperatureSliderTheme.differenceIndicatorIncreasingColor[2],
    trackDecreasingColor: _$YgTemperatureSliderTheme.trackDecreasingColor[2],
    trackIncreasingColor: _$YgTemperatureSliderTheme.trackIncreasingColor[2],
  );

  static final YgTemperatureSliderTheme professionalDark =
      YgTemperatureSliderTheme(
    differenceIndicatorDecreasingColor:
        _$YgTemperatureSliderTheme.differenceIndicatorDecreasingColor[3],
    differenceIndicatorIncreasingColor:
        _$YgTemperatureSliderTheme.differenceIndicatorIncreasingColor[3],
    trackDecreasingColor: _$YgTemperatureSliderTheme.trackDecreasingColor[3],
    trackIncreasingColor: _$YgTemperatureSliderTheme.trackIncreasingColor[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgTemperatureSliderTheme copyWith({
    Color? differenceIndicatorDecreasingColor,
    Color? differenceIndicatorIncreasingColor,
    Color? trackDecreasingColor,
    Color? trackIncreasingColor,
  }) {
    return YgTemperatureSliderTheme(
      differenceIndicatorDecreasingColor: differenceIndicatorDecreasingColor ??
          this.differenceIndicatorDecreasingColor,
      differenceIndicatorIncreasingColor: differenceIndicatorIncreasingColor ??
          this.differenceIndicatorIncreasingColor,
      trackDecreasingColor: trackDecreasingColor ?? this.trackDecreasingColor,
      trackIncreasingColor: trackIncreasingColor ?? this.trackIncreasingColor,
    );
  }

  @override
  YgTemperatureSliderTheme lerp(
      covariant ThemeExtension<YgTemperatureSliderTheme>? other, double t) {
    if (other is! YgTemperatureSliderTheme)
      return this as YgTemperatureSliderTheme;
    return YgTemperatureSliderTheme(
      differenceIndicatorDecreasingColor: Color.lerp(
          differenceIndicatorDecreasingColor,
          other.differenceIndicatorDecreasingColor,
          t)!,
      differenceIndicatorIncreasingColor: Color.lerp(
          differenceIndicatorIncreasingColor,
          other.differenceIndicatorIncreasingColor,
          t)!,
      trackDecreasingColor:
          Color.lerp(trackDecreasingColor, other.trackDecreasingColor, t)!,
      trackIncreasingColor:
          Color.lerp(trackIncreasingColor, other.trackIncreasingColor, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgTemperatureSliderTheme &&
            const DeepCollectionEquality().equals(
                differenceIndicatorDecreasingColor,
                other.differenceIndicatorDecreasingColor) &&
            const DeepCollectionEquality().equals(
                differenceIndicatorIncreasingColor,
                other.differenceIndicatorIncreasingColor) &&
            const DeepCollectionEquality()
                .equals(trackDecreasingColor, other.trackDecreasingColor) &&
            const DeepCollectionEquality()
                .equals(trackIncreasingColor, other.trackIncreasingColor));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(differenceIndicatorDecreasingColor),
      const DeepCollectionEquality().hash(differenceIndicatorIncreasingColor),
      const DeepCollectionEquality().hash(trackDecreasingColor),
      const DeepCollectionEquality().hash(trackIncreasingColor),
    );
  }
}
