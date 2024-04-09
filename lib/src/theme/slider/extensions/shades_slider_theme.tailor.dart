// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'shades_slider_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgShadesSliderTheme extends ThemeExtension<YgShadesSliderTheme> {
  const YgShadesSliderTheme({
    required this.differenceIndicatorDecreasingColor,
    required this.differenceIndicatorIncreasingColor,
    required this.trackDecreasingColor,
    required this.trackIncreasingColor,
  });

  final Color differenceIndicatorDecreasingColor;
  final Color differenceIndicatorIncreasingColor;
  final Color trackDecreasingColor;
  final Color trackIncreasingColor;

  static final YgShadesSliderTheme consumerLight = YgShadesSliderTheme(
    differenceIndicatorDecreasingColor:
        _$YgShadesSliderTheme.differenceIndicatorDecreasingColor[0],
    differenceIndicatorIncreasingColor:
        _$YgShadesSliderTheme.differenceIndicatorIncreasingColor[0],
    trackDecreasingColor: _$YgShadesSliderTheme.trackDecreasingColor[0],
    trackIncreasingColor: _$YgShadesSliderTheme.trackIncreasingColor[0],
  );

  static final YgShadesSliderTheme consumerDark = YgShadesSliderTheme(
    differenceIndicatorDecreasingColor:
        _$YgShadesSliderTheme.differenceIndicatorDecreasingColor[1],
    differenceIndicatorIncreasingColor:
        _$YgShadesSliderTheme.differenceIndicatorIncreasingColor[1],
    trackDecreasingColor: _$YgShadesSliderTheme.trackDecreasingColor[1],
    trackIncreasingColor: _$YgShadesSliderTheme.trackIncreasingColor[1],
  );

  static final YgShadesSliderTheme professionalLight = YgShadesSliderTheme(
    differenceIndicatorDecreasingColor:
        _$YgShadesSliderTheme.differenceIndicatorDecreasingColor[2],
    differenceIndicatorIncreasingColor:
        _$YgShadesSliderTheme.differenceIndicatorIncreasingColor[2],
    trackDecreasingColor: _$YgShadesSliderTheme.trackDecreasingColor[2],
    trackIncreasingColor: _$YgShadesSliderTheme.trackIncreasingColor[2],
  );

  static final YgShadesSliderTheme professionalDark = YgShadesSliderTheme(
    differenceIndicatorDecreasingColor:
        _$YgShadesSliderTheme.differenceIndicatorDecreasingColor[3],
    differenceIndicatorIncreasingColor:
        _$YgShadesSliderTheme.differenceIndicatorIncreasingColor[3],
    trackDecreasingColor: _$YgShadesSliderTheme.trackDecreasingColor[3],
    trackIncreasingColor: _$YgShadesSliderTheme.trackIncreasingColor[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgShadesSliderTheme copyWith({
    Color? differenceIndicatorDecreasingColor,
    Color? differenceIndicatorIncreasingColor,
    Color? trackDecreasingColor,
    Color? trackIncreasingColor,
  }) {
    return YgShadesSliderTheme(
      differenceIndicatorDecreasingColor: differenceIndicatorDecreasingColor ??
          this.differenceIndicatorDecreasingColor,
      differenceIndicatorIncreasingColor: differenceIndicatorIncreasingColor ??
          this.differenceIndicatorIncreasingColor,
      trackDecreasingColor: trackDecreasingColor ?? this.trackDecreasingColor,
      trackIncreasingColor: trackIncreasingColor ?? this.trackIncreasingColor,
    );
  }

  @override
  YgShadesSliderTheme lerp(
      covariant ThemeExtension<YgShadesSliderTheme>? other, double t) {
    if (other is! YgShadesSliderTheme) return this as YgShadesSliderTheme;
    return YgShadesSliderTheme(
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
            other is YgShadesSliderTheme &&
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
