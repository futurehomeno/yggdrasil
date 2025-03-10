import 'package:flutter/painting.dart';
import 'package:yggdrasil/src/components/yg_graph/interfaces/_interfaces.dart';
import 'package:yggdrasil/src/components/yg_graph/renderers/plotting_area_renderers/yg_bar_graph/interfaces/yg_bar_style_provider.dart';
import 'package:yggdrasil/src/components/yg_graph/renderers/plotting_area_renderers/yg_bar_graph/models/yg_bar_style.dart';

class YgStaticBarColorProvider implements YgBarStyleProvider<YgGraphPoint> {
  const YgStaticBarColorProvider({
    required this.color,
  });

  final Color color;

  @override
  YgBarStyle getBarStyleForData(YgGraphPoint data) {
    return YgBarStyle(
      fill: color,
      border: null,
    );
  }
}
