part of 'token_object.dart';

final class ThemeVariant extends TokenObject {
  const ThemeVariant({
    required this.entries,
    required this.variantName,
  });

  final String variantName;
  final Map<String, TokenObject> entries;

  @override
  bool isStructurallyIdentical(TokenObject other) {
    if (other is! ThemeVariant) {
      return false;
    }

    if (other.variantName != variantName) {
      return false;
    }

    if (entries.length != other.entries.length) {
      return false;
    }

    for (final MapEntry<String, TokenObject>(:String key, :TokenObject value) in entries.entries) {
      final TokenObject? otherEntry = other.entries[key];

      if (otherEntry == null) {
        return false;
      }

      if (!value.isStructurallyIdentical(otherEntry)) {
        return false;
      }
    }

    return true;
  }
}
