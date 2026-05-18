import 'package:yggdrasil/src/components/yg_chart/index_constrainers/index_constraints.dart';
import 'package:yggdrasil/src/components/yg_chart/index_constrainers/index_constraints_provider.dart';

class IndexStaticConstraintsProvider extends IndexConstraintsProvider {
  const IndexStaticConstraintsProvider({
    required this.min,
    required this.max,
  });

  final double min;
  final double max;

  @override
  IndexConstraints constrain(double width) {
    return IndexConstraints(
      min: min,
      max: max,
    );
  }
}
