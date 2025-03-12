import 'package:flutter/animation.dart';
import 'package:flutter/foundation.dart';
import 'package:yggdrasil/src/components/yg_chart/controller/animated_tween_controller.dart';
import 'package:yggdrasil/src/components/yg_chart/controller/range_tween.dart';
import 'package:yggdrasil/src/components/yg_chart/enums/data_group.dart';
import 'package:yggdrasil/src/components/yg_chart/models/config/yg_chart_controller_config.dart';
import 'package:yggdrasil/src/components/yg_chart/models/data/data_set.dart';
import 'package:yggdrasil/src/components/yg_chart/models/range.dart';

class YgChartController {
  YgChartController({
    required TickerProvider vsync,
    required YgChartControllerConfig config,
  })  : _primaryValueRangeController = AnimatedTweenController<DoubleRange>(
          vsync: vsync,
          tween: RangeTween<double>(
            begin: Range.doubleZero,
          ),
        ),
        _secondaryValueRangeController = AnimatedTweenController<DoubleRange>(
          vsync: vsync,
          tween: RangeTween<double>(
            begin: Range.doubleZero,
          ),
        ),
        _indexRangeController = AnimatedTweenController<DoubleRange>(
          vsync: vsync,
          tween: RangeTween<double>(
            begin: Range.doubleZero,
          ),
        ),
        _config = config;

  YgChartControllerConfig _config;

  final Set<YgChartDataSetController<AnyDataSet>> _datasetControllers = <YgChartDataSetController<AnyDataSet>>{};

  /// The value range of the primary datasets.
  Animation<DoubleRange> get primaryValueRange => _primaryValueRangeController;
  final AnimatedTweenController<DoubleRange> _primaryValueRangeController;

  /// The value range of the secondary datasets.
  Animation<DoubleRange> get secondaryValueRange => _secondaryValueRangeController;
  final AnimatedTweenController<DoubleRange> _secondaryValueRangeController;

  /// The index range of all datasets.
  Animation<DoubleRange> get indexRange => _primaryValueRangeController;
  final AnimatedTweenController<DoubleRange> _indexRangeController;

  void updatePrimaryValueRange(DoubleRange range, {bool animated = true}) {
    if (animated) {
      _primaryValueRangeController.animateTo(
        range,
        curve: Curves.easeInOut,
        duration: const Duration(
          milliseconds: 300,
        ),
      );
    } else {
      _primaryValueRangeController.value = range;
    }
  }

  void updateSecondaryValueRange(DoubleRange range, {bool animated = true}) {
    if (animated) {
      _secondaryValueRangeController.animateTo(
        range,
        curve: Curves.easeInOut,
        duration: const Duration(
          milliseconds: 300,
        ),
      );
    } else {
      _secondaryValueRangeController.value = range;
    }
  }

  void updateIndexRange(DoubleRange range, {bool animated = true}) {
    if (animated) {
      _indexRangeController.animateTo(
        range,
        curve: Curves.easeInOut,
        duration: const Duration(
          milliseconds: 300,
        ),
      );
    } else {
      _indexRangeController.value = range;
    }
  }

  void updateRanges() {
    // Get the new ranges based on the user config and the datasets.
    DoubleRange newIndexRange = _config.indexRange ?? Range.infinite;
    DoubleRange newPrimaryRange = _config.primaryRange ?? Range.infinite;
    DoubleRange newSecondaryRange = _config.secondaryRange ?? Range.infinite;

    for (final YgChartDataSetController<AnyDataSet> controller in _datasetControllers) {
      final AnyDataSet? target = controller.target;
      if (target == null) {
        continue;
      }

      if (_config.indexRange == null) {
        newIndexRange = newIndexRange.encapsulate(
          target.indexRange,
        );
      }

      switch (controller.group) {
        case DataGroup.primary when _config.primaryRange == null:
          newPrimaryRange = newPrimaryRange.encapsulate(
            target.valueRange,
          );
          break;
        case DataGroup.secondary when _config.secondaryRange == null:
          newSecondaryRange = newSecondaryRange.encapsulate(
            target.valueRange,
          );
          break;
        default:
      }
    }

    if (newIndexRange.isInfinite) {
      newIndexRange = Range.doubleZero;
    }

    if (newPrimaryRange.isInfinite) {
      newPrimaryRange = Range.doubleZero;
    }

    if (newSecondaryRange.isInfinite) {
      newSecondaryRange = Range.doubleZero;
    }

    // TODO: Put logic here to prevent index animations when they don't make sense.
    updateIndexRange(newIndexRange);
    updatePrimaryValueRange(newPrimaryRange);
    updateSecondaryValueRange(newSecondaryRange);
  }

  void registerDataSetController(YgChartDataSetController<AnyDataSet> controller) {
    _datasetControllers.add(controller);
    updateRanges();
  }

  void update(YgChartControllerConfig config) {
    if (config == _config) {
      return;
    }

    _config = config;
    updateRanges();
  }
}

typedef TweenBuilder<T> = Tween<T> Function(T? start, T? end);

class YgChartDataSetController<T extends AnyDataSet> extends ChangeNotifier implements ValueListenable<T?> {
  YgChartDataSetController({
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
