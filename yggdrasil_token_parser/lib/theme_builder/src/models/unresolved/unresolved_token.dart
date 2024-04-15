part of 'unresolved_token_object.dart';

final class UnresolvedToken extends UnresolvedTokenObject {
  const UnresolvedToken({
    required super.parent,
    required this.description,
    required this.type,
    required this.value,
  });

  final String? description;
  final TokenValueType? type;
  final UnresolvedValueOrReference value;
}
