import '../type_value_or_reference.dart';
import 'dimension_type_value_or_reference.dart';

class DimensionTypeReference extends DimensionTypeValueOrReference implements TypeReference<double> {
  const DimensionTypeReference({
    required this.path,
  });

  @override
  final List<String> path;
}
