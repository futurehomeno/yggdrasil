import '../type_value_or_reference.dart';
import 'dimension_type_value_or_reference.dart';

class DimensionTypeValue extends DimensionTypeValueOrReference implements TypeValue<double> {
  const DimensionTypeValue({
    required this.value,
  });

  @override
  final double value;
}
