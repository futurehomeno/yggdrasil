import 'package:yggdrasil/src/components/yg_chart/models/range.dart';

class ChartState {
  const ChartState({
    required this.indexRange,
    required this.valueRange,
  });

  final DoubleRange indexRange;
  final DoubleRange valueRange;
}
