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

class ValueToken {
  final T value;
}
