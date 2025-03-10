import 'package:flutter/widgets.dart';
import 'package:yggdrasil/src/components/yg_graph/models/_models.dart';

// ignore: avoid-unnecessary-stateful-widgets
class YgGraph extends StatefulWidget {
  const YgGraph({
    super.key,
    required this.graphs,
    this.verticalAxis,
    this.horizontalAxis,
    this.overlays,
    this.indexRange,
    this.valueRange,
  });

  final List<Widget> graphs;
  final List<Widget>? verticalAxis;
  final List<Widget>? horizontalAxis;
  final List<Widget>? overlays;
  final Range? indexRange;
  final Range? valueRange;

  @override
  State<YgGraph> createState() => _YgGraphState();
}

class _YgGraphState extends State<YgGraph> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
