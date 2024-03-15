import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_slider/value_indicator/yg_slider_value_indicator_render_widget.dart';
import 'package:yggdrasil/src/components/yg_slider/value_indicator/yg_slider_value_indicator_style.dart';
import 'package:yggdrasil/src/components/yg_slider/yg_slider_state.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

class YgSliderValueIndicator extends StatefulWidget {
  const YgSliderValueIndicator({
    super.key,
    required this.state,
    required this.layerLink,
    required this.value,
    required this.child,
  });

  final YgSliderState state;
  final LayerLink layerLink;
  final Animation<double> value;
  final Widget child;

  @override
  State<YgSliderValueIndicator> createState() => _YgSliderValueIndicatorState();
}

class _YgSliderValueIndicatorState extends StateWithYgStyle<YgSliderValueIndicator, YgSliderValueIndicatorStyle> {
  final OverlayPortalController _portalController = OverlayPortalController();

  @override
  YgSliderValueIndicatorStyle createStyle() {
    // This is really not ideal and should be moved to initState, but because of
    // tailor we can not use anything depending on the theme in the initState.
    final YgSliderValueIndicatorStyle style = YgSliderValueIndicatorStyle(
      vsync: this,
      state: widget.state,
    );

    style.valueIndicatorVisibility.addListener(_updateOverlayVisibility);
    final bool shouldShow = style.valueIndicatorVisibility.value != 0;
    if (shouldShow != _portalController.isShowing) {
      _portalController.toggle();
    }

    return style;
  }

  void _updateOverlayVisibility() {
    final bool shouldShow = style.valueIndicatorVisibility.value != 0;
    if (shouldShow != _portalController.isShowing) {
      _portalController.toggle();
    }
  }

  @override
  void dispose() {
    style.valueIndicatorVisibility.removeListener(_updateOverlayVisibility);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return OverlayPortal(
      controller: _portalController,
      overlayChildBuilder: (BuildContext context) {
        return RepaintBoundary(
          child: YgSliderValueIndicatorRenderWidget(
            layerLink: widget.layerLink,
            style: style,
            value: widget.value,
          ),
        );
      },
      child: widget.child,
    );
  }
}
