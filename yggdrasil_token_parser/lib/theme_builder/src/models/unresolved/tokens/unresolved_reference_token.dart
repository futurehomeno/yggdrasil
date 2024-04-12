part of '../unresolved_token_object.dart';

final class UnresolvedReferenceToken extends UnresolvedToken {
  const UnresolvedReferenceToken({
    required super.parent,
    required super.description,
    required super.type,
    required this.reference,
  });

  final UnresolvedReference reference;
}
