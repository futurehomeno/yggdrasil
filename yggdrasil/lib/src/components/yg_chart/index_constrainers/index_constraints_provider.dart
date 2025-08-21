import 'package:yggdrasil/src/components/yg_chart/index_constrainers/index_constraints.dart';

abstract class IndexConstraintsProvider {
  const IndexConstraintsProvider();

  IndexConstraints constrain(double width);
}
