import '../type_value_or_reference.dart';
import 'number_type.dart';

class NumberTypeValue extends NumberTypeValueOrReference implements TypeValue<double> {
  const NumberTypeValue({
    required this.value,
  });

  @override
  final double value;
}
