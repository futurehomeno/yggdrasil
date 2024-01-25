import '../_unresolved.dart';

class UnresolvedReferenceToken extends UnresolvedToken {
  const UnresolvedReferenceToken({
    super.description,
    super.type,
    required this.reference,
  });

  final UnresolvedReference reference;
}
