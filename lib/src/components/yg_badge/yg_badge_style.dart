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

  late final YgAnimatedIconThemeDataProperty iconTheme;
  late final YgAnimatedDecorationProperty badgeDecoration;
  late final YgAnimatedTextStyleProperty textStyle;
  late final YgAnimatedEdgeInsetsProperty contentPadding;
  late final YgAnimatedEdgeInsetsProperty childPadding;

  @override
  void init() {
    iconTheme = animate(YgIconThemeDataProperty<YgBadgeState>.resolveWith(_resolveIconThemeData));
    badgeDecoration = animate(YgDecorationProperty<YgBadgeState>.resolveWith(_resolveBadgeDecoration));
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

  IconThemeData _resolveIconThemeData(BuildContext context, YgBadgeState state) {
    return IconThemeData(
      size: _theme.iconSize,
      color: switch (state.weight.value) {
        YgBadgeWeight.weak => _theme.weakIconColor,
        YgBadgeWeight.strong => _theme.strongIconColor,
      },
    );
  }

  BoxDecoration _resolveBadgeDecoration(BuildContext context, YgBadgeState state) {
    return BoxDecoration(
      borderRadius: _theme.borderRadius,
      color: switch (state.weight.value) {
        YgBadgeWeight.weak => _theme.weakColor,
        YgBadgeWeight.strong => _theme.strongColor,
      },
    );
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
