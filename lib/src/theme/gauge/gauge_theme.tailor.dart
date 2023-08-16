// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'gauge_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgGaugeTheme extends ThemeExtension<YgGaugeTheme> {
  const YgGaugeTheme({
    required this.labelTextStyle,
    required this.notationTextStyle,
    required this.titleTextStyle,
    required this.tweenCurve,
    required this.tweenDuration,
  });

  final TextStyle labelTextStyle;
  final TextStyle notationTextStyle;
  final TextStyle titleTextStyle;
  final Curve tweenCurve;
  final Duration tweenDuration;

  static final YgGaugeTheme consumerLight = YgGaugeTheme(
    labelTextStyle: _$YgGaugeTheme.labelTextStyle[0],
    notationTextStyle: _$YgGaugeTheme.notationTextStyle[0],
    titleTextStyle: _$YgGaugeTheme.titleTextStyle[0],
    tweenCurve: _$YgGaugeTheme.tweenCurve[0],
    tweenDuration: _$YgGaugeTheme.tweenDuration[0],
  );

  static final YgGaugeTheme consumerDark = YgGaugeTheme(
    labelTextStyle: _$YgGaugeTheme.labelTextStyle[1],
    notationTextStyle: _$YgGaugeTheme.notationTextStyle[1],
    titleTextStyle: _$YgGaugeTheme.titleTextStyle[1],
    tweenCurve: _$YgGaugeTheme.tweenCurve[1],
    tweenDuration: _$YgGaugeTheme.tweenDuration[1],
  );

  static final YgGaugeTheme professionalLight = YgGaugeTheme(
    labelTextStyle: _$YgGaugeTheme.labelTextStyle[2],
    notationTextStyle: _$YgGaugeTheme.notationTextStyle[2],
    titleTextStyle: _$YgGaugeTheme.titleTextStyle[2],
    tweenCurve: _$YgGaugeTheme.tweenCurve[2],
    tweenDuration: _$YgGaugeTheme.tweenDuration[2],
  );

  static final YgGaugeTheme professionalDark = YgGaugeTheme(
    labelTextStyle: _$YgGaugeTheme.labelTextStyle[3],
    notationTextStyle: _$YgGaugeTheme.notationTextStyle[3],
    titleTextStyle: _$YgGaugeTheme.titleTextStyle[3],
    tweenCurve: _$YgGaugeTheme.tweenCurve[3],
    tweenDuration: _$YgGaugeTheme.tweenDuration[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgGaugeTheme copyWith({
    TextStyle? labelTextStyle,
    TextStyle? notationTextStyle,
    TextStyle? titleTextStyle,
    Curve? tweenCurve,
    Duration? tweenDuration,
  }) {
    return YgGaugeTheme(
      labelTextStyle: labelTextStyle ?? this.labelTextStyle,
      notationTextStyle: notationTextStyle ?? this.notationTextStyle,
      titleTextStyle: titleTextStyle ?? this.titleTextStyle,
      tweenCurve: tweenCurve ?? this.tweenCurve,
      tweenDuration: tweenDuration ?? this.tweenDuration,
    );
  }

  @override
  YgGaugeTheme lerp(covariant ThemeExtension<YgGaugeTheme>? other, double t) {
    if (other is! YgGaugeTheme) return this as YgGaugeTheme;
    return YgGaugeTheme(
      labelTextStyle: TextStyle.lerp(labelTextStyle, other.labelTextStyle, t)!,
      notationTextStyle: TextStyle.lerp(notationTextStyle, other.notationTextStyle, t)!,
      titleTextStyle: TextStyle.lerp(titleTextStyle, other.titleTextStyle, t)!,
      tweenCurve: t < 0.5 ? tweenCurve : other.tweenCurve,
      tweenDuration: t < 0.5 ? tweenDuration : other.tweenDuration,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgGaugeTheme &&
            const DeepCollectionEquality().equals(labelTextStyle, other.labelTextStyle) &&
            const DeepCollectionEquality().equals(notationTextStyle, other.notationTextStyle) &&
            const DeepCollectionEquality().equals(titleTextStyle, other.titleTextStyle) &&
            const DeepCollectionEquality().equals(tweenCurve, other.tweenCurve) &&
            const DeepCollectionEquality().equals(tweenDuration, other.tweenDuration));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(labelTextStyle),
      const DeepCollectionEquality().hash(notationTextStyle),
      const DeepCollectionEquality().hash(titleTextStyle),
      const DeepCollectionEquality().hash(tweenCurve),
      const DeepCollectionEquality().hash(tweenDuration),
    );
  }
}
