// ignore_for_file: avoid-dynamic

import '../../_token_parser.dart';

abstract class TypeValueOrReference<T> {
  const TypeValueOrReference();

  TokenValueType get type;

  T resolve() {
    final TypeValueOrReference<T> that = this;

    if (that is TypeReference<T>) {
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
