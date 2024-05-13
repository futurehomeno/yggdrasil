import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

import 'yg_power_manager_animated_icon_variant.dart';

typedef YgPowerManagerAnimatedIconState = YgVariantState<YgPowerMangerAnimatedIconVariant>;

class YgPowerManagerAnimatedIconStyle extends YgStyle<YgPowerManagerAnimatedIconState> {
  YgPowerManagerAnimatedIconStyle({
    required super.state,
    required super.vsync,
  });

  late final YgAnimatedProperty<Color> color = animate(_resolveColor);
  late final YgAnimatedProperty<double> variant = animate(_resolveVariant);

  Color _resolveColor() {
    return switch (state.variant.value) {
      YgPowerMangerAnimatedIconVariant.increase => theme.increasingColor,
      YgPowerMangerAnimatedIconVariant.decrease => theme.decreasingColor,
    };
  }

  double _resolveVariant() {
    return switch (state.variant.value) {
      YgPowerMangerAnimatedIconVariant.increase => 0,
      YgPowerMangerAnimatedIconVariant.decrease => 1,
    };
  }

  PowerManagerAnimatedIconTheme get theme => context.powerManagerAnimatedIconTheme;

  @override
  Curve get curve => Curves.easeInOut;

  @override
  Duration get duration => const Duration(milliseconds: 200);
}
