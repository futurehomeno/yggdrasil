import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/list_tile/list_tile_theme.dart';
import 'package:yggdrasil/src/utils/_utils.dart';
import 'package:yggdrasil/yggdrasil.dart';

typedef YgListTileBodyState = YgVariantState<YgListTileDensity>;

class YgListTileBodyStyle extends YgStyle<YgListTileBodyState> {
  YgListTileBodyStyle({
    required super.state,
    required super.vsync,
  });

  late final YgAnimatedProperty<EdgeInsets> outerPadding = animate(_resolveOuterPadding);

  EdgeInsets _resolveOuterPadding() {
    return switch (state.variant.value) {
      YgListTileDensity.dense => _theme.outerPaddingDense,
      YgListTileDensity.standard => _theme.outerPaddingStandard,
    };
  }

  YgListTileTheme get _theme => context.listTileTheme;

  @override
  Curve get curve => context.defaults.animationCurve;

  @override
  Duration get duration => context.defaults.animationDuration;
}
