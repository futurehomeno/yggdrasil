part of '../unresolved_token_object.dart';

final class UnresolvedCompositeToken extends UnresolvedToken {
  const UnresolvedCompositeToken({
    required super.parent,
    required super.description,
    required super.type,
    required this.properties,
  });

  final Map<String, UnresolvedValueOrReference> properties;
}
