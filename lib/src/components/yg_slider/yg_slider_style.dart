import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_slider/_yg_slider.dart';
import 'package:yggdrasil/src/components/yg_slider/enums/yg_slider_difference.dart';
import 'package:yggdrasil/src/components/yg_slider/yg_slider_state.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

class YgSliderStyle extends YgStyle<YgSliderState> {
  YgSliderStyle({
    required super.state,
    required super.vsync,
  });

  late final YgAnimatedProperty<Color> handleColor = animate(_resolveHandleColor);
  late final YgAnimatedProperty<Color> trackColor = animate(_resolveTrackColor);
  late final YgAnimatedProperty<Color> differenceIndicatorColor = animate(_resolveDifferenceIndicatorColor);
  late final YgDrivenProperty<EdgeInsets> handlePadding = all(() => _theme.handlePadding);
  late final YgDrivenProperty<BorderRadius> trackInnerRadius = all(() => _theme.trackInnerRadius);
  late final YgDrivenProperty<BorderRadius> trackOuterRadius = all(() => _theme.trackOuterRadius);
  late final YgDrivenProperty<double> trackHeight = all(() => _theme.trackHeight);

  Color _resolveHandleColor() {
    if (state.disabled.value) {
      return _theme.handleDisabledColor;
    }

    if (state.pressed.value) {
      return _theme.handlePressedColor;
    }

    if (state.hovered.value) {
      return _theme.handleHoverColor;
    }

    if (state.focused.value) {
      return _theme.handleFocusColor;
    }

    return _theme.handleDefaultColor;
  }

  Color _resolveDifferenceIndicatorColor() {
    if (state.disabled.value) {
      return _theme.differenceIndicatorDisabledColor;
    }

    return switch (state.difference.value) {
      YgSliderDifference.none => Colors.transparent,
      YgSliderDifference.increasing => _variantTheme.differenceIndicatorIncreasingColor,
      YgSliderDifference.decreasing => _variantTheme.differenceIndicatorDecreasingColor,
    };
  }

  Color _resolveTrackColor() {
    if (state.disabled.value) {
      return _theme.trackDisabledColor;
    }

    return switch (state.difference.value) {
      YgSliderDifference.increasing => _variantTheme.trackIncreasingColor,
      YgSliderDifference.decreasing || YgSliderDifference.none => _variantTheme.trackDecreasingColor,
    };
  }

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
