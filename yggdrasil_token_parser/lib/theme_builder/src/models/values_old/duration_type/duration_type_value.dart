import '../type_value_or_reference.dart';
import 'duration_type.dart';

class DurationTypeValue extends DurationTypeValueOrReference implements TypeValue<Duration> {
  const DurationTypeValue({
    required this.value,
  });

  @override
  final Duration value;
}
