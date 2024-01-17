part of 'token_object.dart';

final class TokenGroup extends TokenObject {
  const TokenGroup({
    required this.entries,
  });

  final Map<String, TokenObject> entries;

  @override
  bool isStructurallyIdentical(TokenObject other) {
    if (other is! TokenGroup) {
      return false;
    }

    if (entries.length != other.entries.length) {
      return false;
    }

    for (final MapEntry<String, TokenObject>(:String key, :TokenObject value) in entries.entries) {
      final TokenObject? otherValue = other.entries[key];

      if (otherValue == null) {
        return false;
      }

      if (!value.isStructurallyIdentical(otherValue)) {
        return false;
      }
    }

    return true;
  }
}
