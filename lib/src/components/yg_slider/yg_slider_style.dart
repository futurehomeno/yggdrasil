import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_slider/_yg_slider.dart';
import 'package:yggdrasil/src/components/yg_slider/yg_slider_state.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

class YgSliderStyle extends YgStyle<YgSliderState> {
  YgSliderStyle({
    required super.state,
    required super.vsync,
  });

  // Handle
  late final YgAnimatedProperty<Color> handleColor = animate(_resolveHandleColor);
  late final YgDrivenProperty<EdgeInsets> handlePadding = all(() => _theme.handlePadding);

  // Tracks
  late final YgAnimatedProperty<Color> trackLeftColor = animate(_resolveTrackColor);
  late final YgDrivenProperty<Color> trackRightColor = all(() => _theme.trackBackgroundColor);
  late final YgDrivenProperty<Radius> trackInnerRadius = all(() => _theme.trackInnerRadius);
  late final YgDrivenProperty<Radius> trackOuterRadius = all(() => _theme.trackOuterRadius);
  late final YgDrivenProperty<double> trackHeight = all(() => _theme.trackHeight);

  // Difference indicator
  late final YgDrivenProperty<double> differenceIndicatorHeight = all(() => _theme.differenceIndicatorHeight);
  late final YgDrivenProperty<Radius> differenceIndicatorRadius = all(() => _theme.differenceIndicatorRadius);
  late final YgAnimatedProperty<Color> differenceIndicatorColor = animate(_resolveDifferenceIndicatorColor);

  // Value indicator
  late final YgDrivenProperty<TextStyle> valueIndicatorTextStyle = all(() => _theme.valueIndicatorTextStyle);
  late final YgDrivenProperty<EdgeInsets> valueIndicatorPadding = all(() => _theme.valueIndicatorPadding);
  late final YgDrivenProperty<BorderRadius> valueIndicatorRadius = all(() => _theme.valueIndicatorRadius);
  late final YgDrivenProperty<Color> valueIndicatorColor = all(() => _theme.valueIndicatorDefaultColor);
  late final YgDrivenProperty<double> valueIndicatorBottomOffset = all(() => _theme.valueIndicatorBottomOffset);
  late final YgAnimatedProperty<double> valueIndicatorVisibility = animate(_resolveValueIndicatorVisibility);

  double _resolveValueIndicatorVisibility() {
    if (_showValueIndicator) {
      return 1;
    }

    return 0;
  }

  Color _resolveHandleColor() {
    if (state.disabled.value) {
      return _theme.handleDisabledColor;
    }

    if (state.editing.value) {
      return _theme.handlePressedColor;
    }

    if (state.hovered.value) {
      return _theme.handleHoverColor;
    }

    if (state.focused.value) {
      return Colors.red;
    }

    return _theme.handleDefaultColor;
  }

  Color _resolveDifferenceIndicatorColor() {
    if (!_showDifferenceIndicator) {
      return Colors.transparent;
    }

    if (state.disabled.value) {
      return _theme.differenceIndicatorDisabledColor;
    }

    if (state.increasing.value) {
      return _variantTheme.differenceIndicatorIncreasingColor;
    }

    return _variantTheme.differenceIndicatorDecreasingColor;
  }

  Color _resolveTrackColor() {
    if (state.disabled.value) {
      return _theme.trackDisabledColor;
    }

    if (state.increasing.value) {
      return _variantTheme.trackIncreasingColor;
    }

    return _variantTheme.trackDecreasingColor;
  }

  bool get _showDifferenceIndicator =>
      (state.differenceIndicatorEnabled.value && state.recentlyEdited.value) ||
      state.staticDifferenceIndicatorIndicator.value;

  bool get _showValueIndicator =>
      !state.disabled.value && state.valueIndicatorEnabled.value && state.recentlyEdited.value;

  _YgSliderVariantTheme get _variantTheme => switch (state.variant.value) {
        YgSliderVariant.shades => _YgSliderVariantTheme.shades(_theme.shadesSliderTheme),
        YgSliderVariant.temperature => _YgSliderVariantTheme.temperature(_theme.temperatureSliderTheme),
      };

  @override
  Curve get curve => _theme.animationCurve;

  @override
  Duration get duration => _theme.animationDuration;

  YgSliderTheme get _theme => context.sliderTheme;
}

class _YgSliderVariantTheme {
  const _YgSliderVariantTheme({
    required this.trackIncreasingColor,
    required this.trackDecreasingColor,
    required this.differenceIndicatorIncreasingColor,
    required this.differenceIndicatorDecreasingColor,
  });

  factory _YgSliderVariantTheme.temperature(YgTemperatureSliderTheme theme) => _YgSliderVariantTheme(
        trackIncreasingColor: theme.trackIncreasingColor,
        trackDecreasingColor: theme.trackDecreasingColor,
        differenceIndicatorIncreasingColor: theme.differenceIndicatorIncreasingColor,
        differenceIndicatorDecreasingColor: theme.differenceIndicatorDecreasingColor,
      );

  factory _YgSliderVariantTheme.shades(YgShadesSliderTheme theme) => _YgSliderVariantTheme(
        trackIncreasingColor: theme.trackIncreasingColor,
        trackDecreasingColor: theme.trackDecreasingColor,
        differenceIndicatorIncreasingColor: theme.differenceIndicatorIncreasingColor,
        differenceIndicatorDecreasingColor: theme.differenceIndicatorDecreasingColor,
      );

  final Color trackIncreasingColor;
  final Color trackDecreasingColor;
  final Color differenceIndicatorIncreasingColor;
  final Color differenceIndicatorDecreasingColor;
}
