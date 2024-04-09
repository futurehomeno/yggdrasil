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
      return _theme.handleFocusColor;
    }

    return _theme.handleDefaultColor;
  }

  Color _resolveDifferenceIndicatorColor() {
    final bool enabled = state.differenceIndicatorEnabled.value;
    final bool staticallyEnabled = state.staticDifferenceIndicatorEnabled.value;
    final bool wasOrIsEditing = state.recentlyEdited.value || state.editing.value;

    if (!(enabled && wasOrIsEditing) && !staticallyEnabled) {
      return _variantTheme.differenceIndicatorDecreasingColor.withOpacity(0);
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

  _YgSliderVariantTheme get _variantTheme {
    return switch (state.variant.value) {
      YgSliderVariant.shades => _YgSliderVariantTheme.shades(_theme.shadesSliderTheme),
      YgSliderVariant.temperature => _YgSliderVariantTheme.temperature(_theme.temperatureSliderTheme),
    };
  }

  @override
  Curve get curve => _theme.animationCurve;

  @override
  Duration get duration => _theme.animationDuration;

  YgSliderTheme get _theme => context.sliderTheme;
}

// TODO(DEV-1915): Remove this when theme extensions can extend interfaces
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
