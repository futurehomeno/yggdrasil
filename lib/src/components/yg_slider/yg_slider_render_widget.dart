import 'package:flutter/cupertino.dart';
import 'package:flutter/src/rendering/object.dart';

import 'yg_slider_style.dart';

class YgSliderRenderWidget extends LeafRenderObjectWidget {
  const YgSliderRenderWidget({
    super.key,
    required this.style,
    required this.value,
    required this.difference,
  });

  final YgSliderStyle style;
  final Animation<double> value;
  final Animation<double> difference;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return YgSliderRenderer(
      style: style,
      value: value,
      difference: difference,
    );
  }

  @override
  void updateRenderObject(BuildContext context, covariant YgSliderRenderer renderObject) {
    renderObject.style = style;
    renderObject.value = value;
    renderObject.difference = difference;
  }
}

class YgSliderRenderer extends RenderBox {
  YgSliderRenderer({
    required YgSliderStyle style,
    required Animation<double> value,
    required Animation<double> difference,
  })  : _style = style,
        _value = value,
        _difference = difference;

  YgSliderStyle _style;
  YgSliderStyle get style => _style;
  set style(YgSliderStyle newValue) {
    if (_style != newValue) {
      if (_style.trackHeight.value != newValue.trackHeight.value) {
        markNeedsLayout();
      }
      markNeedsPaint();
      _style.removeListener(markNeedsPaint);
      _style.trackHeight.removeListener(markNeedsLayout);
      _style = newValue;
      _style.addListener(markNeedsPaint);
      _style.trackHeight.addListener(markNeedsLayout);
    }
  }

  Animation<double> _value;
  Animation<double> get value => _value;
  set value(Animation<double> newValue) {
    if (_value != newValue) {
      markNeedsPaint();
      _value.removeListener(markNeedsPaint);
      _value = newValue;
      _value.addListener(markNeedsPaint);
    }
  }

  Animation<double> _difference;
  Animation<double> get difference => _difference;
  set difference(Animation<double> newValue) {
    if (_difference != newValue) {
      markNeedsPaint();
      _difference.removeListener(markNeedsPaint);
      _difference = newValue;
      _difference.addListener(markNeedsPaint);
    }
  }

  @override
  void attach(PipelineOwner owner) {
    _value.addListener(markNeedsPaint);
    _difference.addListener(markNeedsPaint);
    _style.addListener(markNeedsPaint);
    _style.trackHeight.addListener(markNeedsLayout);
    super.attach(owner);
  }
}
