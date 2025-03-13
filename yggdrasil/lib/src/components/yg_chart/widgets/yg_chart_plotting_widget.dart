import 'package:flutter/widgets.dart';
import 'package:yggdrasil/src/components/yg_chart/controller/yg_chart_controller.dart';
import 'package:yggdrasil/src/components/yg_chart/controller/yg_chart_data_set_controller.dart';
import 'package:yggdrasil/src/components/yg_chart/enums/data_group.dart';
import 'package:yggdrasil/src/components/yg_chart/models/data/dataset.dart';

typedef YgPlottingWidgetBuilder<T extends AnyDataset> = Widget Function(YgChartDatasetController<T> controller);

class YgChartPlottingWidget<T extends AnyDataset> extends StatefulWidget {
  const YgChartPlottingWidget({
    super.key,
    required this.data,
    required this.group,
    required this.tweenBuilder,
    required this.builder,
  });

  final T data;
  final DataGroup group;
  final TweenBuilder<T> tweenBuilder;
  final YgPlottingWidgetBuilder<T> builder;

  @override
  State<YgChartPlottingWidget<T>> createState() => _YgChartPlottingWidgetState<T>();
}

class _YgChartPlottingWidgetState<T extends AnyDataset> extends State<YgChartPlottingWidget<T>>
    with TickerProviderStateMixin {
  late final YgChartDatasetController<T> _controller;
  YgChartController? _parent;

  @override
  void initState() {
    super.initState();
    _controller = YgChartDatasetController<T>(
      dataGroup: widget.group,
      initialData: widget.data,
      tweenBuilder: widget.tweenBuilder,
      vsync: this,
    );
  }

  @override
  void didUpdateWidget(covariant YgChartPlottingWidget<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    _controller.update(
      widget.data,
      widget.group,
    );
  }

  @override
  void dispose() {
    _parent?.unregisterDatasetController(_controller);
    _controller.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    final YgChartController? newParent = YgChartController.maybeOf(context);
    if (_parent != newParent) {
      _parent?.unregisterDatasetController(_controller);
      _parent = newParent;
      _parent?.registerDatasetController(_controller);
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(_controller);
  }
}
