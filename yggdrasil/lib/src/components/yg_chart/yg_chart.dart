import 'package:flutter/widgets.dart';
import 'package:yggdrasil/src/components/yg_chart/controller/yg_chart_controller.dart';
import 'package:yggdrasil/src/components/yg_chart/models/config/axes/yg_axes_config.dart';
import 'package:yggdrasil/src/components/yg_chart/models/config/yg_interaction_config.dart';

import 'renderers/yg_chart_renderer.dart';

class YgChart extends StatefulWidget {
  const YgChart({
    super.key,
    required this.plotters,
    this.decorators,
    this.axes = const YgAxesConfig(),
    this.interaction = const YgInteractionConfig(),
  });

  final List<Widget> plotters;
  final List<Widget>? decorators;
  final YgInteractionConfig interaction;
  final YgAxesConfig axes;

  @override
  State<YgChart> createState() => _YgChartState();
}

class _YgChartState extends State<YgChart> with TickerProviderStateMixin {
  late final YgChartController _chartController = YgChartController(vsync: this);

  @override
  Widget build(BuildContext context) {
    final List<Widget>? decorators = widget.decorators;

    return YgChartRenderWidget(
      controller: _chartController,
      children: <Widget>[
        ...widget.plotters,
        if (decorators != null) ...decorators,
      ],
    );
  }
}
