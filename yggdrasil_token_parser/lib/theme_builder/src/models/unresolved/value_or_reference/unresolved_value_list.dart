part of 'unresolved_value_or_reference.dart';

final class UnresolvedValueList extends UnresolvedValueOrReference {
  const UnresolvedValueList({
    required this.values,
  });

  final List<UnresolvedValueOrReference> values;
}
