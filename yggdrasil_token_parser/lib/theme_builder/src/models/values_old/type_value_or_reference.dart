// ignore_for_file: avoid-dynamic

import '../../_token_parser.dart';

abstract class TypeValueOrReference {
  const TypeValueOrReference();

  TokenValueType get type;

  Object resolve() {
    final TypeValueOrReference that = this;

    if (that is TypeReference) {
      // TODO(Tim): At some point we need to be able to resolve the value which
      // should check if this is a reference or a static value and then either
      // resolve the reference and return the referenced value, or return the
      // static value.
      throw UnimplementedError();
    }

    if (that is TypeValue<T>) {
      return that.value;
    }

    throw Exception('Unable to resolve value');
  }
}

abstract class TypeReference<T> extends TypeValueOrReference<T> {
  List<String> get path;
}

abstract class TypeValue<T> extends TypeValueOrReference<T> {
  T get value;
}

class UnresolvedTokenMap {
  const UnresolvedTokenMap({
    required this.children,
  });

  final Map<String, UnresolvedTokenMapObject> children;
}

abstract class UnresolvedTokenMapObject {
  const UnresolvedTokenMapObject();
}

abstract class UnresolvedTokenGroup extends UnresolvedTokenMapObject {
  const UnresolvedTokenGroup({
    required this.children,
    required this.type,
  });

  final TokenValueType? type;
  final Map<String, UnresolvedTokenMapObject> children;
}

abstract class UnresolvedToken extends UnresolvedTokenMapObject {
  const UnresolvedToken({
    required this.description,
    required this.type,
  });

  final TokenValueType? type;
  final String? description;
}

class UnresolvedReferenceToken extends UnresolvedToken {
  const UnresolvedReferenceToken({
    super.description,
    super.type,
    required this.path,
  });

  final List<String> path;
}

class UnresolvedValueToken<T> extends UnresolvedToken {
  const UnresolvedValueToken({
    super.description,
    super.type,
  });

  final TypeValueOrReference<T> value;
}

class TokenResult<T> {
  const TokenResult({
    required this.type,
    required this.value,
    this.description,
    this.reference,
  });

  final T value;
  final TokenValueType type;
  final List<String>? reference;
  final String? description;
}

class Toke0nValue {
  final 
}
