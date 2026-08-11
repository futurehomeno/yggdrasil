import 'package:yggdrasil/src/components/yg_chart/index_constrainers/index_constraints.dart';
import 'package:yggdrasil/src/components/yg_chart/index_constrainers/index_constraints_provider.dart';

class IndexDensityConstraintsProvider extends IndexConstraintsProvider {
  const IndexDensityConstraintsProvider({
    required this.max,
    required this.min,
  });

  final double min;
  final double max;

  @override
  IndexConstraints constrain(double width) {
    return IndexConstraints(
      min: width / min,
      max: width / max,
    );
  }
}
