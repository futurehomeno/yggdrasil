import 'package:flutter/foundation.dart';

import '_interfaces.dart';

abstract interface class YgGraphDataProvider<T extends YgGraphData> implements Listenable {
  T getDataAtIndex(int index);
}
