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

  late final YgAnimatedProperty<IconThemeData> iconTheme = animate(_resolveIconThemeData);
  late final YgAnimatedProperty<BoxDecoration> badgeDecoration = animate(_resolveBadgeDecoration);
  late final YgAnimatedProperty<TextStyle> textStyle = animate(_resolveTextStyle);
  late final YgAnimatedProperty<EdgeInsets> contentPadding = animate(_resolveContentPadding);
  late final YgAnimatedProperty<EdgeInsets> childPadding = animate(_resolveChildPadding);

  EdgeInsets _resolveChildPadding() {
    switch (state.variant.value) {
      case YgBadgeVariant.icon:
        return _theme.iconVariantChildPadding;
      case YgBadgeVariant.number:
        return EdgeInsets.zero;
    }
  }

  EdgeInsets _resolveContentPadding() {
    switch (state.variant.value) {
      case YgBadgeVariant.icon:
        return _theme.iconPadding;
      case YgBadgeVariant.number:
        return _theme.textPadding;
    }
  }

  IconThemeData _resolveIconThemeData() {
    return IconThemeData(
      size: _theme.iconSize,
      color: switch (state.weight.value) {
        YgBadgeWeight.weak => _theme.weakIconColor,
        YgBadgeWeight.strong => _theme.strongIconColor,
      },
    );
  }

  BoxDecoration _resolveBadgeDecoration() {
    return BoxDecoration(
      borderRadius: _theme.borderRadius,
      color: switch (state.weight.value) {
        YgBadgeWeight.weak => _theme.weakColor,
        YgBadgeWeight.strong => _theme.strongColor,
      },
    );
  }

  TextStyle _resolveTextStyle() {
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
