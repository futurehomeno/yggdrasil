import 'dart:ui';

import 'package:flutter/src/animation/curves.dart';
import 'package:yggdrasil/src/theme/search_bar/search_bar_theme.dart';
import 'package:yggdrasil/src/theme/theme.dart';
import 'package:yggdrasil/src/utils/yg_states/_yg_states.dart';

import 'yg_search_bar_state.dart';

class YgSearchBarStyle extends YgStyle<YgSearchBarState> {
  YgSearchBarStyle({
    required super.state,
    required super.vsync,
  });

  late final YgAnimatedProperty<Color> backgroundColor = animate(_resolveBackgroundColor);

  Color _resolveBackgroundColor() {
    if (state.hovered.value) {
      return _theme.containerHoveredColor;
    }

    return _theme.containerDefaultColor;
  }

  YgSearchBarTheme get _theme => context.searchBarTheme;

  @override
  Curve get curve => _theme.animationCurve;

  @override
  Duration get duration => _theme.animationDuration;
}
