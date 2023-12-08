import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_badge/yg_badge_state.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

import '_yg_badge.dart';

class YgBadgeStyle extends YgStyleWithDefaults<YgBadgeState> {
  YgBadgeStyle({
    required super.state,
    required super.vsync,
  });

  late final YgAnimatedColorProperty badgeColor;
  late final YgAnimatedTextStyleProperty textStyle;

  @override
  void init() {
    badgeColor = animate(YgColorProperty<YgBadgeState>.resolveWith(_resolveBadgeColor));
    textStyle = animate(YgTextStyleProperty<YgBadgeState>.resolveWith(_resolveTextStyle));
  }

  Color _resolveBadgeColor(BuildContext context, YgBadgeState state) {
    switch (state.weight.value) {
      case YgBadgeWeight.weak:
        return _theme.weakColor;
      case YgBadgeWeight.strong:
        return _theme.strongColor;
    }
  }

  TextStyle _resolveTextStyle(BuildContext context, YgBadgeState state) {
    switch (state.weight.value) {
      case YgBadgeWeight.weak:
        return _theme.weakTextStyle;
      case YgBadgeWeight.strong:
        return _theme.strongTextStyle;
    }
  }

  YgBadgeTheme get _theme => context.badgeTheme;

  @override
  Curve get curve => _theme.animationCurve;

  @override
  Duration get duration => _theme.animationDuration;
}
