import 'package:flutter/cupertino.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

import 'yg_slider.dart';

class YgSliderController extends ChangeNotifier implements YgDisposable, YgAttachable<YgSliderWidgetState> {
  YgSliderController({
    double? initialValue,
  }) : _value = initialValue ?? 0;

  AnimationController? setValueController;
  AnimationController? currentValueController;
  YgSliderWidgetState? state;

  double _value;
  double get value => _value;
  set value(double newValue) {
    setValueController?.animateTo(newValue);
    _value = newValue;
    notifyListeners();
  }

  @override
  void attach(YgSliderWidgetState state) {
    setValueController = AnimationController(vsync: state);
    currentValueController = AnimationController(vsync: state);
    this.state = state;
  }

  @override
  void detach() {
    setValueController?.dispose();
    setValueController = null;
    currentValueController?.dispose();
    currentValueController = null;
    state = null;
  }
}
