import '../_token_parser.dart';

class TypeValueOrReference<T> {
  const TypeValueOrReference({
    required this.type,
  });

  final TokenValueType? type;
}

class TypeValue<T> extends TypeValueOrReference<T> {
  const TypeValue({
    super.type,
    required this.value,
  });

  final T value;
}

class TypeReference<T> extends TypeValueOrReference<T> {
  const TypeReference({
    super.type,
    required this.path,
  });

  final List<String> path;
}
