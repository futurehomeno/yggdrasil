import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_badge/yg_badge_state.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

import '_yg_badge.dart';
import 'enums/yg_badge_variant.dart';

class YgBadgeStyle extends YgStyleWithDefaults<YgBadgeState> {
  YgBadgeStyle({
    required super.state,
    required super.vsync,
  });

  late final YgAnimatedColorProperty iconColor;
  late final YgAnimatedColorProperty badgeColor;
  late final YgAnimatedTextStyleProperty textStyle;
  late final YgAnimatedEdgeInsetsProperty contentPadding;
  late final YgAnimatedEdgeInsetsProperty childPadding;

  @override
  void init() {
    iconColor = animate(YgColorProperty<YgBadgeState>.resolveWith(_resolveIconColor));
    badgeColor = animate(YgColorProperty<YgBadgeState>.resolveWith(_resolveBadgeColor));
    textStyle = animate(YgTextStyleProperty<YgBadgeState>.resolveWith(_resolveTextStyle));
    contentPadding = animate(YgEdgeInsetsProperty<YgBadgeState>.resolveWith(_resolveContentPadding));
    childPadding = animate(YgEdgeInsetsProperty<YgBadgeState>.resolveWith(_resolveChildPadding));
  }

  EdgeInsets _resolveChildPadding(BuildContext context, YgBadgeState state) {
    switch (state.variant.value) {
      case YgBadgeVariant.icon:
        return _theme.iconVariantChildPadding;
      case YgBadgeVariant.number:
        return EdgeInsets.zero;
    }
  }

  EdgeInsets _resolveContentPadding(BuildContext context, YgBadgeState state) {
    switch (state.variant.value) {
      case YgBadgeVariant.icon:
        return _theme.iconPadding;
      case YgBadgeVariant.number:
        return _theme.textPadding;
    }
  }

  Color _resolveIconColor(BuildContext context, YgBadgeState state) {
    switch (state.weight.value) {
      case YgBadgeWeight.weak:
        return _theme.weakIconColor;
      case YgBadgeWeight.strong:
        return _theme.strongIconColor;
    }
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
