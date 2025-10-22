// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'pulse_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgPulseTheme extends ThemeExtension<YgPulseTheme> {
  const YgPulseTheme({
    required this.backgroundColor,
    required this.preferredSize,
    required this.pulseCurve,
    required this.pulseDuration,
    required this.pulseInterval,
  });

  final Color backgroundColor;
  final Size preferredSize;
  final Curve pulseCurve;
  final Duration pulseDuration;
  final Duration pulseInterval;

  static final YgPulseTheme consumerLight = YgPulseTheme(
    backgroundColor: _$YgPulseTheme.backgroundColor[0],
    preferredSize: _$YgPulseTheme.preferredSize[0],
    pulseCurve: _$YgPulseTheme.pulseCurve[0],
    pulseDuration: _$YgPulseTheme.pulseDuration[0],
    pulseInterval: _$YgPulseTheme.pulseInterval[0],
  );

  static final YgPulseTheme consumerDark = YgPulseTheme(
    backgroundColor: _$YgPulseTheme.backgroundColor[1],
    preferredSize: _$YgPulseTheme.preferredSize[1],
    pulseCurve: _$YgPulseTheme.pulseCurve[1],
    pulseDuration: _$YgPulseTheme.pulseDuration[1],
    pulseInterval: _$YgPulseTheme.pulseInterval[1],
  );

  static final YgPulseTheme professionalLight = YgPulseTheme(
    backgroundColor: _$YgPulseTheme.backgroundColor[2],
    preferredSize: _$YgPulseTheme.preferredSize[2],
    pulseCurve: _$YgPulseTheme.pulseCurve[2],
    pulseDuration: _$YgPulseTheme.pulseDuration[2],
    pulseInterval: _$YgPulseTheme.pulseInterval[2],
  );

  static final YgPulseTheme professionalDark = YgPulseTheme(
    backgroundColor: _$YgPulseTheme.backgroundColor[3],
    preferredSize: _$YgPulseTheme.preferredSize[3],
    pulseCurve: _$YgPulseTheme.pulseCurve[3],
    pulseDuration: _$YgPulseTheme.pulseDuration[3],
    pulseInterval: _$YgPulseTheme.pulseInterval[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgPulseTheme copyWith({
    Color? backgroundColor,
    Size? preferredSize,
    Curve? pulseCurve,
    Duration? pulseDuration,
    Duration? pulseInterval,
  }) {
    return YgPulseTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      preferredSize: preferredSize ?? this.preferredSize,
      pulseCurve: pulseCurve ?? this.pulseCurve,
      pulseDuration: pulseDuration ?? this.pulseDuration,
      pulseInterval: pulseInterval ?? this.pulseInterval,
    );
  }

  @override
  YgPulseTheme lerp(covariant ThemeExtension<YgPulseTheme>? other, double t) {
    if (other is! YgPulseTheme) return this as YgPulseTheme;
    return YgPulseTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      preferredSize: t < 0.5 ? preferredSize : other.preferredSize,
      pulseCurve: t < 0.5 ? pulseCurve : other.pulseCurve,
      pulseDuration: t < 0.5 ? pulseDuration : other.pulseDuration,
      pulseInterval: t < 0.5 ? pulseInterval : other.pulseInterval,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgPulseTheme &&
            const DeepCollectionEquality().equals(backgroundColor, other.backgroundColor) &&
            const DeepCollectionEquality().equals(preferredSize, other.preferredSize) &&
            const DeepCollectionEquality().equals(pulseCurve, other.pulseCurve) &&
            const DeepCollectionEquality().equals(pulseDuration, other.pulseDuration) &&
            const DeepCollectionEquality().equals(pulseInterval, other.pulseInterval));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(backgroundColor),
      const DeepCollectionEquality().hash(preferredSize),
      const DeepCollectionEquality().hash(pulseCurve),
      const DeepCollectionEquality().hash(pulseDuration),
      const DeepCollectionEquality().hash(pulseInterval),
    );
  }
}
