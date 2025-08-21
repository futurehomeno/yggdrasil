import 'package:flutter/animation.dart';
import 'package:flutter/foundation.dart';
import 'package:yggdrasil/src/components/yg_chart/controller/yg_chart_controller.dart';
import 'package:yggdrasil/src/components/yg_chart/enums/data_group.dart';
import 'package:yggdrasil/src/components/yg_chart/models/data/dataset.dart';
import 'package:yggdrasil/src/components/yg_chart/models/range.dart';

typedef TweenBuilder<T> = Tween<T> Function(T? start, T? end);

class YgChartDatasetController<T extends AnyDataset> extends ChangeNotifier
    implements ValueListenable<YgChartPlotterData<T>> {
  YgChartDatasetController({
    required TweenBuilder<T> tweenBuilder,
    required TickerProvider vsync,
    required T? initialData,
    required DataGroup dataGroup,
  })  : _animationController = AnimationController(vsync: vsync),
        _dataset = initialData,
        _target = initialData,
        _tweenBuilder = tweenBuilder,
        _group = dataGroup,
        _value = YgChartPlotterData<T>(
          data: initialData,
          indexRange: Range.doubleZero,
          valueRange: Range.doubleZero,
        ) {
    _animationController.addListener(_tick);
  }

  final AnimationController _animationController;

  final TweenBuilder<T> _tweenBuilder;

  Tween<T>? _tween;

  YgChartController? _parent;

  DataGroup _group;
  DataGroup get group => _group;

  @override
  YgChartPlotterData<T> get value => _value!;
  YgChartPlotterData<T>? _value;

  T? _dataset;

  /// The target value for this controller.
  ///
  /// This is not always equal to the value, specifically while this controller
  /// is animating.
  T? get target => _target;
  T? _target;

  void _tick() {
    final Tween<T>? tween = _tween;
    if (tween == null) {
      _dataset = _target;

      return;
    }

    final T data = tween.evaluate(_animationController);
    _value = YgChartPlotterData<T>(
      data: data,
      indexRange: _parent?.value.indexRange ?? data.indexRange.toDoubleRange(),
      valueRange: switch (_group) {
        DataGroup.primary => _parent?.value.primaryRange ?? data.valueRange,
        DataGroup.secondary => _parent?.value.secondaryRange ?? data.valueRange,
      },
    );
  }

  void update(T data, DataGroup group) {
    final bool shouldUpdateParent = _group != group || _target != data;

    if (_group != group) {
      _group = group;
    }

    if (_target != data) {
      _tween = _tweenBuilder(_dataset, data);
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
    assert(
      _parent == null,
      'Can not attach YgChartDataSetController to multiple YgChartControllers.',
    );

    if (_parent != null) {
      return;
    }

    _parent = parent;
    _parent!.addListener(_tick);
  }

  void detach() {
    _parent!.removeListener(_tick);
    _parent = null;
  }
}

class YgChartPlotterData<T extends AnyDataset> {
  const YgChartPlotterData({
    required this.data,
    required this.indexRange,
    required this.valueRange,
  });

  final T? data;
  final DoubleRange indexRange;
  final DoubleRange valueRange;
}
