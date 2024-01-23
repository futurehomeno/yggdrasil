import '_unresolved.dart';

class UnresolvedReference extends UnresolvedValueOrReference {
  const UnresolvedReference({
    required this.path,
  });

  final List<String> path;
}
