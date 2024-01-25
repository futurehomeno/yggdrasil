part of 'unresolved_value_or_reference.dart';

final class UnresolvedReference extends UnresolvedValueOrReference {
  const UnresolvedReference({
    required this.path,
  });

  final List<String> path;
}
