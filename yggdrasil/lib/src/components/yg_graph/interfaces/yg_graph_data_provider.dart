import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:yggdrasil/src/components/yg_graph/models/_models.dart';

import '_interfaces.dart';

/// Information about how the graph will render.
class GraphRenderData {
  const GraphRenderData({
    required this.fieldSize,
    required this.indexRange,
    required this.valueRange,
  });

  /// The range of values which fall within the coordinate system.
  final Range valueRange;

  /// The index range of values which fall within the coordinate system.
  final Range indexRange;

  /// The size of the coordinate system used to render the graph values.
  final Size fieldSize;
}

abstract interface class YgGraphDataProvider<Point extends YgGraphPoint, Index extends num> implements Listenable {
  /// Should provide data for a data
  Point getDataAtDataPoint(Index index);

  /// The range of indexes in which the data falls.
  Range get indexRange;

  /// The range of value in which the data falls.
  Range get valueRange;
}

typedef YgConstantIntervalGraphDataProvider<Point extends YgGraphPoint> = YgGraphDataProvider<Point, int>;
