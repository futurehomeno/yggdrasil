import '../type_value_or_reference.dart';
import 'number_type.dart';

class NumberTypeReference extends NumberTypeValueOrReference implements TypeReference<double> {
  const NumberTypeReference({
    required this.path,
  });

  @override
  final List<String> path;
}
