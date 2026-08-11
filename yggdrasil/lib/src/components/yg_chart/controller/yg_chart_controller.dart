import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:yggdrasil/src/components/yg_chart/controller/animated_tween_controller.dart';
import 'package:yggdrasil/src/components/yg_chart/controller/range_tween.dart';
import 'package:yggdrasil/src/components/yg_chart/controller/yg_chart_data_set_controller.dart';
import 'package:yggdrasil/src/components/yg_chart/enums/data_group.dart';
import 'package:yggdrasil/src/components/yg_chart/interval_providers/interfaces/interval.dart';
import 'package:yggdrasil/src/components/yg_chart/interval_providers/interfaces/interval_data.dart';
import 'package:yggdrasil/src/components/yg_chart/models/config/axes/yg_axes_config.dart';
import 'package:yggdrasil/src/components/yg_chart/models/data/dataset.dart';
import 'package:yggdrasil/src/components/yg_chart/models/range.dart';

class YgChartController extends ChangeNotifier implements ValueListenable<YgChartData> {
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
        ) {
    _primaryValueRangeController.addListener(_updateValue);
    _secondaryValueRangeController.addListener(_updateValue);
    _indexRangeController.addListener(_updateValue);
  }

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

  YgChartData? _value;
  @override
  YgChartData get value => _value!;

  YgAxesConfig? _config;

  double? _plottingHeight;
  double? _plottingWidth;
  double? _minPixelIndexScale;

  void updatePlottingHeight(double height) {
    if (_plottingHeight == height) {
      return;
    }

    _plottingHeight = height;

    // Don't animate when resizing.
    updateValueRanges(animated: false);
  }

  void updatePlottingWidth(double width, double minPixelIndexScale) {
    if (_plottingWidth == width || _minPixelIndexScale != minPixelIndexScale) {
      return;
    }

    _plottingWidth = width;
    _minPixelIndexScale = minPixelIndexScale;

    // Don't animate when resizing.
    updateIndexRange(animated: false);
  }

  void updateRanges({bool animated = true}) {
    updateValueRanges(animated: animated);
    updateIndexRange(animated: animated);
  }

  void updateValueRanges({bool animated = true}) {
    final YgAxesConfig? config = _config;
    final double? plottingHeight = _plottingHeight;
    final double? plottingWidth = _plottingWidth;
    if (config == null || plottingHeight == null || plottingWidth == null) {
      return;
    }

    final List<DoubleRange> primaryRanges = <DoubleRange>[];
    final List<DoubleRange> secondaryRanges = <DoubleRange>[];
    for (final YgChartDatasetController<AnyDataset> controller in _datasetControllers) {
      final AnyDataset? data = controller.value.data;

      if (data == null) {
        continue;
      }

      switch (controller.group) {
        case DataGroup.primary:
          primaryRanges.add(data.valueRange);
        case DataGroup.secondary:
          secondaryRanges.add(data.valueRange);
      }
    }

    final Range<double> basePrimaryRange = Range.merge(primaryRanges) ?? Range.doubleZero;
    final Range<double> baseSecondaryRange = Range.merge(secondaryRanges) ?? Range.doubleZero;

    Range<double> primaryRange = basePrimaryRange;
    Range<double> secondaryRange = baseSecondaryRange;

    if (config.primary.alwaysIncludeOrigin) {
      primaryRange = primaryRange.encapsulatePoint(0);
    }

    if (config.secondary.alwaysIncludeOrigin) {
      secondaryRange = secondaryRange.encapsulatePoint(0);
    }

    final IntervalData primaryIntervalData = config.primary.interval.getIntervalData(
      dataRange: primaryRange,
      space: plottingHeight,
    );

    final IntervalData secondaryIntervalData = config.secondary.interval.getIntervalData(
      intervals: primaryIntervalData.intervals,
      dataRange: primaryIntervalData.range,
      space: plottingHeight,
    );
  }

  void updateIndexRange({bool animated = true}) {
    final YgAxesConfig? config = _config;
    if (config == null) {
      return;
    }

    final List<DoubleRange> indexRanges = <DoubleRange>[];
    for (final YgChartDatasetController<AnyDataset> controller in _datasetControllers) {
      final AnyDataset? data = controller.value.data;

      if (data == null) {
        continue;
      }

      indexRanges.add(data.indexRange.toDoubleRange());
    }

    final Range<double> baseIndexRange = Range.merge(indexRanges) ?? Range.doubleZero;
  }

  void _updateValue() {}

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
}

class YgChartData {
  const YgChartData({
    required this.indexRangeView,
    required this.indexRange,
    required this.primaryRange,
    required this.secondaryRange,
  });

  final DoubleRange indexRangeView;
  final DoubleRange indexRange;
  final DoubleRange primaryRange;
  final DoubleRange secondaryRange;
}

class AxisData {
  const AxisData({
    required this.intervals,
    required this.range,
  });

  final DoubleRange range;
  final List<YgInterval> intervals;
}
