import '_unresolved.dart';

abstract class UnresolvedValueToken {
  const UnresolvedValueToken({
    required this.value,
  });

  final UnresolvedValueOrReference value;
}
