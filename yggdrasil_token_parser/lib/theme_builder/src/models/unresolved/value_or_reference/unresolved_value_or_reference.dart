part 'unresolved_reference.dart';
part 'unresolved_value.dart';

sealed class UnresolvedValueOrReference {
  const UnresolvedValueOrReference();

  factory UnresolvedValueOrReference.parse(Object value) {
    if (value is! String) {
      return UnresolvedValue(
        value: value,
      );
    }

    final RegExpMatch? match = _regex.firstMatch(value);
    if (match == null) {
      return UnresolvedValue(
        value: value,
      );
    }

    return UnresolvedReference(path: match.group(1)?.split('.') ?? <String>[]);
  }

  static final RegExp _regex = RegExp(r'^{([^}]+)}$');
}
