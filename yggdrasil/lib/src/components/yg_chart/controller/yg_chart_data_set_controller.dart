import 'package:flutter/animation.dart';
import 'package:flutter/foundation.dart';
import 'package:yggdrasil/src/components/yg_chart/controller/yg_chart_controller.dart';
import 'package:yggdrasil/src/components/yg_chart/enums/data_group.dart';
import 'package:yggdrasil/src/components/yg_chart/models/data/dataset.dart';

typedef TweenBuilder<T> = Tween<T> Function(T? start, T? end);

class YgChartDatasetController<T extends AnyDataset> extends ChangeNotifier implements ValueListenable<T?> {
  YgChartDatasetController({
    required TweenBuilder<T> tweenBuilder,
    required TickerProvider vsync,
    required T? initialData,
    required DataGroup dataGroup,
  })  : _animationController = AnimationController(vsync: vsync),
        _value = initialData,
        _target = initialData,
        _tweenBuilder = tweenBuilder,
        _group = dataGroup {
    _animationController.addListener(_tick);
  }

  final AnimationController _animationController;

  final TweenBuilder<T> _tweenBuilder;

  Tween<T>? _tween;

  YgChartController? _parent;

  DataGroup _group;
  DataGroup get group => _group;

  @override
  T? get value => _value;
  T? _value;

  /// The target value for this controller.
  ///
  /// This is not always equal to the value, specifically while this controller
  /// is animating.
  T? get target => _target;
  T? _target;

  void _tick() {
    final Tween<T>? tween = _tween;
    if (tween == null) {
      _value = _target;

      return;
    }

    _value = tween.evaluate(_animationController);
  }

  void update(T data, DataGroup group) {
    final bool shouldUpdateParent = _group != group || _target != data;

    if (_group != group) {
      _group = group;
    }

    if (_target != data) {
      _tween = _tweenBuilder(_value, data);
      _target = data;
      _animationController.value = 0;
      _animationController.animateTo(
        1,
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 200),
      );

      return;
    }

    if (shouldUpdateParent) {
      _parent?.updateRanges();
    }
  }

  void attach(YgChartController parent) {
    _parent = parent;
  }

  void detach() {
    _parent = null;
  }
}
