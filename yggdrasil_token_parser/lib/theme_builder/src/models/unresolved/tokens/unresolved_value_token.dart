import '../_unresolved.dart';

class UnresolvedValueToken extends UnresolvedToken {
  const UnresolvedValueToken({
    super.description,
    super.type,
    required this.value,
  });

  final UnresolvedValue value;
}
