import '../_unresolved.dart';

class UnresolvedCompositeToken extends UnresolvedToken {
  const UnresolvedCompositeToken({
    super.description,
    super.type,
    required this.properties,
  });

  final Map<String, UnresolvedValueOrReference> properties;
}
