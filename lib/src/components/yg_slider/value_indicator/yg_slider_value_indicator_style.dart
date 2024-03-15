import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_slider/yg_slider_state.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

class YgSliderValueIndicatorStyle extends YgStyle<YgSliderState> {
  YgSliderValueIndicatorStyle({
    required super.state,
    required super.vsync,
  });

  // Value indicator
  late final YgDrivenProperty<TextStyle> valueIndicatorTextStyle = all(() => _theme.valueIndicatorTextStyle);
  late final YgDrivenProperty<EdgeInsets> valueIndicatorPadding = all(() => _theme.valueIndicatorPadding);
  late final YgDrivenProperty<BorderRadius> valueIndicatorRadius = all(() => _theme.valueIndicatorRadius);
  late final YgDrivenProperty<Color> valueIndicatorColor = all(() => _theme.valueIndicatorDefaultColor);
  late final YgDrivenProperty<double> valueIndicatorBottomOffset = all(() => _theme.valueIndicatorBottomOffset);
  late final YgAnimatedProperty<double> valueIndicatorVisibility = animate(_resolveValueIndicatorVisibility);

  double _resolveValueIndicatorVisibility() {
    if (!state.disabled.value &&
        state.valueIndicatorEnabled.value &&
        (state.recentlyEdited.value || state.editing.value)) {
      return 1;
    }

    return 0;
  }

  @override
  Curve get curve => _theme.animationCurve;

  @override
  Duration get duration => _theme.animationDuration;

  YgSliderTheme get _theme => context.sliderTheme;
}
