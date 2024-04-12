part of '../unresolved_token_object.dart';

final class UnresolvedValueToken extends UnresolvedToken {
  const UnresolvedValueToken({
    required super.parent,
    required super.description,
    required super.type,
    required this.value,
  });

  final UnresolvedValue value;
}
