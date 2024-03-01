import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_slider/_yg_slider.dart';
import 'package:yggdrasil/src/components/yg_slider/yg_slider_state.dart';
import 'package:yggdrasil/src/components/yg_slider/yg_slider_style.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

class YgSlider extends StatefulWidget {
  const YgSlider({
    super.key,
    required this.variant,
  });

  final YgSliderVariant variant;

  @override
  State<YgSlider> createState() => _YgSliderState();
}

class _YgSliderState extends StateWithYgStateAndStyle<YgSlider, YgSliderState, YgSliderStyle> {
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
    return Container();
  }
}
