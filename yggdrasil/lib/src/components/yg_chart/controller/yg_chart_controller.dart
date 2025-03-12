import 'package:flutter/animation.dart';
import 'package:yggdrasil/src/components/yg_chart/controller/animated_tween_controller.dart';
import 'package:yggdrasil/src/components/yg_chart/controller/range_tween.dart';
import 'package:yggdrasil/src/components/yg_chart/models/data/data_set.dart';
import 'package:yggdrasil/src/components/yg_chart/models/range.dart';

class YgChartController {
  YgChartController({
    required TickerProvider vsync,
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
        );

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

  void init({
    required List<AnyDataSet> primaryDataSets,
    required List<AnyDataSet> secondaryDataSets,
    required DoubleRange primaryRange,
    required DoubleRange secondaryRange,
    required DoubleRange indexRange,
  }) {}
}

class YgChartDataSetController {}
