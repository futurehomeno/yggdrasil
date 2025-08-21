import 'package:flutter/widgets.dart';
import 'package:yggdrasil/src/components/yg_chart/controller/animated_tween_controller.dart';
import 'package:yggdrasil/src/components/yg_chart/controller/range_tween.dart';
import 'package:yggdrasil/src/components/yg_chart/controller/yg_chart_data_set_controller.dart';
import 'package:yggdrasil/src/components/yg_chart/enums/data_group.dart';
import 'package:yggdrasil/src/components/yg_chart/models/config/yg_chart_controller_config.dart';
import 'package:yggdrasil/src/components/yg_chart/models/data/dataset.dart';
import 'package:yggdrasil/src/components/yg_chart/models/range.dart';

// TODO: We need more seperation, the chart renderer will tell this controller
// what the data ranges should be, as they depend on layout. This controller
// should only just animate whatever the chart renderer tells this controller
// the target ranges should be. This controller should probably inform the
// render object about new data range targets which this controller should know
// from its child controllers.
class YgChartControllerOld {
  YgChartControllerOld({
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

  static YgChartControllerOld? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<YgChartControllerProvider>()?.controller;
  }

  YgChartControllerConfig _config;

  final Set<YgChartDatasetController<AnyDataset>> _datasetControllers = <YgChartDatasetController<AnyDataset>>{};

  /// The value range of the primary datasets.
  Animation<DoubleRange> get primaryValueRange => _primaryValueRangeController;
  final AnimatedTweenController<DoubleRange> _primaryValueRangeController;

  /// The value range of the secondary datasets.
  Animation<DoubleRange> get secondaryValueRange => _secondaryValueRangeController;
  final AnimatedTweenController<DoubleRange> _secondaryValueRangeController;

  /// The index range of all datasets.
  Animation<DoubleRange> get indexRange => _indexRangeController;
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

    for (final YgChartDatasetController<AnyDataset> controller in _datasetControllers) {
      final AnyDataset? target = controller.target;
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

  void registerDatasetController(YgChartDatasetController<AnyDataset> controller) {
    _datasetControllers.add(controller);
    controller.attach(this);
    updateRanges();
  }

  void unregisterDatasetController(YgChartDatasetController<AnyDataset> controller) {
    _datasetControllers.remove(controller);
    controller.detach();
    updateRanges();
  }

  void update(YgChartControllerConfig config) {
    if (config == _config) {
      return;
    }

    _config = config;
    updateRanges();
  }

  void dispose() {
    _datasetControllers.clear();
    _indexRangeController.dispose();
    _primaryValueRangeController.dispose();
    _secondaryValueRangeController.dispose();
  }
}

class YgChartControllerProvider extends InheritedWidget {
  const YgChartControllerProvider({
    super.key,
    required super.child,
    required this.controller,
  });

  final YgChartControllerOld controller;

  @override
  bool updateShouldNotify(YgChartControllerProvider oldWidget) {
    return oldWidget.controller != controller;
  }
}
