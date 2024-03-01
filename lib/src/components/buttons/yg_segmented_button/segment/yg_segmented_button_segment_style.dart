import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/buttons/widgets/_widgets.dart';
import 'package:yggdrasil/src/theme/_theme.dart';

import 'yg_segmented_button_segment_state.dart';

class YgSegmentedButtonSegmentStyle extends YgButtonBaseStyle<YgSegmentedButtonSegmentState> {
  YgSegmentedButtonSegmentStyle({
    required super.state,
    required super.vsync,
  });

  @override
  BoxConstraints resolveConstraints() {
    return BoxConstraints.expand(
      height: _theme.textStyle.computedHeight + _theme.padding.vertical,
    );
  }

  @override
  Color resolveColor() {
    if (state.selected.value) {
      if (state.disabled.value) {
        return _theme.backgroundSelectedDisabledColor;
      }

      return _theme.backgroundSelectedColor;
    }

    if (state.disabled.value) {
      return _theme.backgroundDisabledColor;
    }

    return _theme.backgroundDefaultColor;
  }

  @override
  TextStyle resolveTextStyle() {
    return _theme.textStyle.copyWith(
      color: _resolveTextColor(state),
    );
  }

  Color _resolveTextColor(YgSegmentedButtonSegmentState state) {
    if (state.disabled.value) {
      return _theme.textDisabledColor;
    }

    if (state.selected.value) {
      return _theme.textSelectedColor;
    }

    return _theme.textDefaultColor;
  }

  @override
  Color resolveIconColor() {
    if (state.disabled.value) {
      return _theme.iconDisabledColor;
    }

    if (state.selected.value) {
      return _theme.iconSelectedColor;
    }

    return _theme.iconDefaultColor;
  }

  @override
  double resolveIconSize() {
    return _theme.iconSize;
  }

  @override
  EdgeInsets resolvePadding() {
    return _theme.padding;
  }

  YgSegmentedButtonTheme get _theme => context.segmentedButtonTheme;

  @override
  Curve get curve => _theme.animationCurve;

  @override
  Duration get duration => _theme.animationDuration;
}
