part of 'unresolved_token_object.dart';

final class UnresolvedTokenGroup extends UnresolvedTokenObject {
  const UnresolvedTokenGroup({
    required super.parent,
    required this.children,
    required this.type,
    required this.description,
  });

  final Map<String, UnresolvedTokenObject> children;
  final TokenValueType? type;
  final String? description;
}
