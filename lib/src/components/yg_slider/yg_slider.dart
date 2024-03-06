import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_slider/_yg_slider.dart';
import 'package:yggdrasil/src/components/yg_slider/yg_slider_controller.dart';
import 'package:yggdrasil/src/components/yg_slider/yg_slider_state.dart';
import 'package:yggdrasil/src/components/yg_slider/yg_slider_style.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

import 'yg_slider_render_widget.dart';

class YgSlider extends StatefulWidget {
  const YgSlider({
    super.key,
    required this.variant,
    required this.min,
    required this.max,
    required this.initialValue,
    required this.stepSize,
    required this.controller,
  });

  final YgSliderVariant variant;
  final double min;
  final double max;
  final double initialValue;
  final double stepSize;
  final YgSliderController controller;

  @override
  State<YgSlider> createState() => YgSliderWidgetState();
}

class YgSliderWidgetState extends StateWithYgStateAndStyle<YgSlider, YgSliderState, YgSliderStyle>
    with YgControllerManagerMixin {
  late final YgControllerManager<YgSliderController> _controllerManager = manageController(
    createController: () => YgSliderController(initialValue: widget.initialValue),
    getUserController: () => widget.controller,
  );

  @override
  YgSliderState createState() {
    return YgSliderState(
      variant: widget.variant,
    );
  }

  @override
  YgSliderStyle createStyle() {
    return YgSliderStyle(
      state: state,
      vsync: this,
    );
  }

  @override
  void updateState() {
    state.variant.value = widget.variant;
  }

  @override
  Widget build(BuildContext context) {
    final YgSliderController controller = _controllerManager.value;

    return YgSliderRenderWidget(
      style: style,
      difference: controller.differenceController!,
      value: controller.valueController!,
    );
  }
}
