// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'switch_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgSwitchTheme extends ThemeExtension<YgSwitchTheme> {
  const YgSwitchTheme({
    required this.animationCurve,
    required this.animationDuration,
    required this.handleDefaultColor,
    required this.handleDisabledColor,
    required this.handlePadding,
    required this.handleSize,
    required this.trackDefaultColor,
    required this.trackDisabledColor,
    required this.trackToggledColor,
    required this.trackToggledFocusedHoveredColor,
    required this.width,
  });

  final Curve animationCurve;
  final Duration animationDuration;
  final Color handleDefaultColor;
  final Color handleDisabledColor;
  final double handlePadding;
  final double handleSize;
  final Color trackDefaultColor;
  final Color trackDisabledColor;
  final Color trackToggledColor;
  final Color trackToggledFocusedHoveredColor;
  final double width;

  static final YgSwitchTheme consumerLight = YgSwitchTheme(
    animationCurve: _$YgSwitchTheme.animationCurve[0],
    animationDuration: _$YgSwitchTheme.animationDuration[0],
    handleDefaultColor: _$YgSwitchTheme.handleDefaultColor[0],
    handleDisabledColor: _$YgSwitchTheme.handleDisabledColor[0],
    handlePadding: _$YgSwitchTheme.handlePadding[0],
    handleSize: _$YgSwitchTheme.handleSize[0],
    trackDefaultColor: _$YgSwitchTheme.trackDefaultColor[0],
    trackDisabledColor: _$YgSwitchTheme.trackDisabledColor[0],
    trackToggledColor: _$YgSwitchTheme.trackToggledColor[0],
    trackToggledFocusedHoveredColor: _$YgSwitchTheme.trackToggledFocusedHoveredColor[0],
    width: _$YgSwitchTheme.width[0],
  );

  static final YgSwitchTheme consumerDark = YgSwitchTheme(
    animationCurve: _$YgSwitchTheme.animationCurve[1],
    animationDuration: _$YgSwitchTheme.animationDuration[1],
    handleDefaultColor: _$YgSwitchTheme.handleDefaultColor[1],
    handleDisabledColor: _$YgSwitchTheme.handleDisabledColor[1],
    handlePadding: _$YgSwitchTheme.handlePadding[1],
    handleSize: _$YgSwitchTheme.handleSize[1],
    trackDefaultColor: _$YgSwitchTheme.trackDefaultColor[1],
    trackDisabledColor: _$YgSwitchTheme.trackDisabledColor[1],
    trackToggledColor: _$YgSwitchTheme.trackToggledColor[1],
    trackToggledFocusedHoveredColor: _$YgSwitchTheme.trackToggledFocusedHoveredColor[1],
    width: _$YgSwitchTheme.width[1],
  );

  static final YgSwitchTheme professionalLight = YgSwitchTheme(
    animationCurve: _$YgSwitchTheme.animationCurve[2],
    animationDuration: _$YgSwitchTheme.animationDuration[2],
    handleDefaultColor: _$YgSwitchTheme.handleDefaultColor[2],
    handleDisabledColor: _$YgSwitchTheme.handleDisabledColor[2],
    handlePadding: _$YgSwitchTheme.handlePadding[2],
    handleSize: _$YgSwitchTheme.handleSize[2],
    trackDefaultColor: _$YgSwitchTheme.trackDefaultColor[2],
    trackDisabledColor: _$YgSwitchTheme.trackDisabledColor[2],
    trackToggledColor: _$YgSwitchTheme.trackToggledColor[2],
    trackToggledFocusedHoveredColor: _$YgSwitchTheme.trackToggledFocusedHoveredColor[2],
    width: _$YgSwitchTheme.width[2],
  );

  static final YgSwitchTheme professionalDark = YgSwitchTheme(
    animationCurve: _$YgSwitchTheme.animationCurve[3],
    animationDuration: _$YgSwitchTheme.animationDuration[3],
    handleDefaultColor: _$YgSwitchTheme.handleDefaultColor[3],
    handleDisabledColor: _$YgSwitchTheme.handleDisabledColor[3],
    handlePadding: _$YgSwitchTheme.handlePadding[3],
    handleSize: _$YgSwitchTheme.handleSize[3],
    trackDefaultColor: _$YgSwitchTheme.trackDefaultColor[3],
    trackDisabledColor: _$YgSwitchTheme.trackDisabledColor[3],
    trackToggledColor: _$YgSwitchTheme.trackToggledColor[3],
    trackToggledFocusedHoveredColor: _$YgSwitchTheme.trackToggledFocusedHoveredColor[3],
    width: _$YgSwitchTheme.width[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgSwitchTheme copyWith({
    Curve? animationCurve,
    Duration? animationDuration,
    Color? handleDefaultColor,
    Color? handleDisabledColor,
    double? handlePadding,
    double? handleSize,
    Color? trackDefaultColor,
    Color? trackDisabledColor,
    Color? trackToggledColor,
    Color? trackToggledFocusedHoveredColor,
    double? width,
  }) {
    return YgSwitchTheme(
      animationCurve: animationCurve ?? this.animationCurve,
      animationDuration: animationDuration ?? this.animationDuration,
      handleDefaultColor: handleDefaultColor ?? this.handleDefaultColor,
      handleDisabledColor: handleDisabledColor ?? this.handleDisabledColor,
      handlePadding: handlePadding ?? this.handlePadding,
      handleSize: handleSize ?? this.handleSize,
      trackDefaultColor: trackDefaultColor ?? this.trackDefaultColor,
      trackDisabledColor: trackDisabledColor ?? this.trackDisabledColor,
      trackToggledColor: trackToggledColor ?? this.trackToggledColor,
      trackToggledFocusedHoveredColor: trackToggledFocusedHoveredColor ?? this.trackToggledFocusedHoveredColor,
      width: width ?? this.width,
    );
  }

  @override
  YgSwitchTheme lerp(covariant ThemeExtension<YgSwitchTheme>? other, double t) {
    if (other is! YgSwitchTheme) return this as YgSwitchTheme;
    return YgSwitchTheme(
      animationCurve: t < 0.5 ? animationCurve : other.animationCurve,
      animationDuration: t < 0.5 ? animationDuration : other.animationDuration,
      handleDefaultColor: Color.lerp(handleDefaultColor, other.handleDefaultColor, t)!,
      handleDisabledColor: Color.lerp(handleDisabledColor, other.handleDisabledColor, t)!,
      handlePadding: t < 0.5 ? handlePadding : other.handlePadding,
      handleSize: t < 0.5 ? handleSize : other.handleSize,
      trackDefaultColor: Color.lerp(trackDefaultColor, other.trackDefaultColor, t)!,
      trackDisabledColor: Color.lerp(trackDisabledColor, other.trackDisabledColor, t)!,
      trackToggledColor: Color.lerp(trackToggledColor, other.trackToggledColor, t)!,
      trackToggledFocusedHoveredColor: Color.lerp(
        trackToggledFocusedHoveredColor,
        other.trackToggledFocusedHoveredColor,
        t,
      )!,
      width: t < 0.5 ? width : other.width,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgSwitchTheme &&
            const DeepCollectionEquality().equals(animationCurve, other.animationCurve) &&
            const DeepCollectionEquality().equals(animationDuration, other.animationDuration) &&
            const DeepCollectionEquality().equals(handleDefaultColor, other.handleDefaultColor) &&
            const DeepCollectionEquality().equals(handleDisabledColor, other.handleDisabledColor) &&
            const DeepCollectionEquality().equals(handlePadding, other.handlePadding) &&
            const DeepCollectionEquality().equals(handleSize, other.handleSize) &&
            const DeepCollectionEquality().equals(trackDefaultColor, other.trackDefaultColor) &&
            const DeepCollectionEquality().equals(trackDisabledColor, other.trackDisabledColor) &&
            const DeepCollectionEquality().equals(trackToggledColor, other.trackToggledColor) &&
            const DeepCollectionEquality().equals(
              trackToggledFocusedHoveredColor,
              other.trackToggledFocusedHoveredColor,
            ) &&
            const DeepCollectionEquality().equals(width, other.width));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(animationCurve),
      const DeepCollectionEquality().hash(animationDuration),
      const DeepCollectionEquality().hash(handleDefaultColor),
      const DeepCollectionEquality().hash(handleDisabledColor),
      const DeepCollectionEquality().hash(handlePadding),
      const DeepCollectionEquality().hash(handleSize),
      const DeepCollectionEquality().hash(trackDefaultColor),
      const DeepCollectionEquality().hash(trackDisabledColor),
      const DeepCollectionEquality().hash(trackToggledColor),
      const DeepCollectionEquality().hash(trackToggledFocusedHoveredColor),
      const DeepCollectionEquality().hash(width),
    );
  }
}
