import '../type_value_or_reference.dart';
import 'duration_type.dart';

class DurationTypeReference extends DurationTypeValueOrReference implements TypeReference<Duration> {
  const DurationTypeReference({
    required this.path,
  });

  @override
  final List<String> path;
}
