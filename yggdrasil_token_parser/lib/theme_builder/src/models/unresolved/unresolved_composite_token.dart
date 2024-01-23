import '_unresolved.dart';

abstract class UnresolvedCompositeToken {
  const UnresolvedCompositeToken({
    required this.properties,
  });

  final Map<String, UnresolvedValueOrReference> properties;
}
