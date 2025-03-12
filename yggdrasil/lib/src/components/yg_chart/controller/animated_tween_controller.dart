import 'package:flutter/animation.dart';
import 'package:flutter/foundation.dart';

class AnimatedTweenController<T> extends Animation<T> with ChangeNotifier {
  AnimatedTweenController({
    required this.tween,
    required TickerProvider vsync,
  })  : _parent = AnimationController(
          vsync: vsync,
        ),
        _value = (tween.begin ?? tween.end)! {
    _parent.addListener(_tick);
  }

  final AnimationController _parent;

  final Tween<T> tween;

  @override
  AnimationStatus get status => _parent.status;

  T _value;

  @override
  T get value => _value;

  set value(T newValue) {
    tween.begin = newValue;
    tween.end = newValue;
    _updateValue(newValue);
    _parent.value = 0;
  }

  void animateTo(
    T value, {
    required Duration duration,
    required Curve curve,
  }) {
    tween.begin = _value;
    tween.end = value;
    _parent.value = 0;
    _parent.animateTo(
      1,
      duration: duration,
      curve: curve,
    );
  }

  void _updateValue(T newValue) {
    if (_value != newValue) {
      _value = newValue;
      notifyListeners();
    }
  }

  void _tick() {
    _updateValue(
      tween.transform(
        _parent.value,
      ),
    );
  }

  @override
  void dispose() {
    _parent.dispose();
    super.dispose();
  }

  @override
  void addStatusListener(AnimationStatusListener listener) {
    _parent.addStatusListener(listener);
  }

  @override
  void removeStatusListener(AnimationStatusListener listener) {
    _parent.removeStatusListener(listener);
  }
}
