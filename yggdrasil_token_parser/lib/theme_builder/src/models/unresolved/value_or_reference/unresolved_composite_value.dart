part of 'unresolved_value_or_reference.dart';

final class UnresolvedCompositeValue extends UnresolvedValueOrReference {
  const UnresolvedCompositeValue({
    required this.value,
  });

  final Map<String, UnresolvedValueOrReference> value;
}
