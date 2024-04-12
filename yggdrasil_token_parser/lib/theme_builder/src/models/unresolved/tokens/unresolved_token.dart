part of '../unresolved_token_object.dart';

sealed class UnresolvedToken extends UnresolvedTokenObject {
  const UnresolvedToken({
    required super.parent,
    required this.description,
    required this.type,
  });

  final String? description;
  final TokenValueType? type;
}
