import 'package:yggdrasil/src/components/yg_chart/models/range.dart';

class YgChartControllerConfig {
  const YgChartControllerConfig({
    required this.indexRange,
    required this.primaryRange,
    required this.secondaryRange,
  });

  final DoubleRange? indexRange;
  final DoubleRange? primaryRange;
  final DoubleRange? secondaryRange;

  @override
  bool operator ==(Object other) =>
      other is YgChartControllerConfig &&
      other.indexRange == indexRange &&
      other.primaryRange == primaryRange &&
      other.secondaryRange == secondaryRange;

  @override
  int get hashCode => Object.hash(
        indexRange,
        primaryRange,
        secondaryRange,
      );
}
