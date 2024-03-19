import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_slider/enums/yg_slider_adjustment_type.dart';

class YgSliderAdjustmentIntent extends Intent {
  const YgSliderAdjustmentIntent({
    required this.type,
  });

  const YgSliderAdjustmentIntent.increase() : type = YgSliderAdjustmentType.increase;

  const YgSliderAdjustmentIntent.decrease() : type = YgSliderAdjustmentType.decrease;

  final YgSliderAdjustmentType type;
}
