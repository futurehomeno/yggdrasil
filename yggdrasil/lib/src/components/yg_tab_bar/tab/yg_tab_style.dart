import 'package:flutter/widgets.dart';
import 'package:yggdrasil/src/theme/tabs/_tabs.dart';
import 'package:yggdrasil/src/theme/theme.dart';
import 'package:yggdrasil/src/utils/yg_states/_yg_states.dart';

import 'yg_tab_state.dart';

class YgTabStyle extends YgStyle<YgTabState> {
  YgTabStyle({
    required super.state,
    required super.vsync,
  });

  late final YgAnimatedProperty<Color> backgroundColor = animate(_resolveBackgroundColor);
  late final YgAnimatedProperty<TextStyle> textStyle = animate(_resolveTextStyle);

  Color _resolveBackgroundColor() {
    if (state.pressed.value) {
      return _theme.pressedBackgroundColor;
    }

    if (state.focused.value) {
      return _theme.focusBackgroundColor;
    }

    if (state.hovered.value) {
      return _theme.hoverBackgroundColor;
    }

    return _theme.tabBarBackgroundColor;
  }

  TextStyle _resolveTextStyle() {
    if (state.selected.value) {
      return _theme.selectedLabelTextStyle;
    }

    return _theme.unselectedLabelTextStyle;
  }

  YgTabsTheme get _theme => context.tabsTheme;

  @override
  Curve get curve => _theme.animationCurve;

  @override
  Duration get duration => _theme.animationDuration;
}
