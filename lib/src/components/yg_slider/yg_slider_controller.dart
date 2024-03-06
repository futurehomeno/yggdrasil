import 'package:flutter/cupertino.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

import 'yg_slider.dart';

class YgSliderController extends ChangeNotifier implements YgDisposable, YgAttachable<YgSliderWidgetState> {
  YgSliderController({
    double initialValue = 0,
  }) : _value = initialValue;

  AnimationController? valueController;
  AnimationController? differenceController;
  YgSliderWidgetState? state;

  final double _value;
  double get value => _value;
  set value(double newValue) {}

  @override
  void attach(YgSliderWidgetState state) {
    valueController = AnimationController(vsync: state);
    differenceController = AnimationController(vsync: state);
    this.state = state;
  }

  @override
  void detach() {
    valueController?.dispose();
    valueController = null;
    differenceController?.dispose();
    differenceController = null;
    state = null;
  }
}
