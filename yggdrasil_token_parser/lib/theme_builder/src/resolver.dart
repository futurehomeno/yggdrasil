import 'package:yggdrasil_token_parser/theme_builder/src/enums/token_value_type.dart';
import 'package:yggdrasil_token_parser/theme_builder/src/models/_models.dart';
import 'package:yggdrasil_token_parser/theme_builder/src/models/resolved/tokens/_tokens.dart';
import 'package:yggdrasil_token_parser/theme_builder/src/value_parsers/_value_parsers.dart';

class Resolver {
  Resolver({
    required this.tokens,
  });

  final List<TokenParseError> errors = <TokenParseError>[];
  final Map<UnresolvedToken, Token?> cache = <UnresolvedToken, Token?>{};
  final Map<String, UnresolvedTokenObject> tokens;

  ResolvedResult resolve() {
    final Map<String, TokenObject> results = <String, TokenObject>{};

    for (final MapEntry<String, UnresolvedTokenObject> entry in tokens.entries) {
      final TokenObject? result = resolveUnresolvedTokenObject(entry.value);

      if (result != null) {
        results[entry.key] = result;
      }
    }
  }

  TokenObject? resolveUnresolvedTokenObject(
    UnresolvedTokenObject object, [
    List<UnresolvedToken> stack = const <UnresolvedToken>[],
  ]) {
    return switch (object) {
      UnresolvedToken() => resolveToken(object),
      UnresolvedTokenGroup() => resolveTokenGroup(object),
    };
  }

  Token? resolveToken(UnresolvedToken token, List<UnresolvedToken> stack) {
    if (stack.contains(token)) {
      // Circular reference detected.
      return null;
    }

    final Token? cached = cache[token];
    if (cached != null) {
      return cached;
    }

    final Token? resolved = switch (token) {
      UnresolvedValueToken() => resolveValueToken(token),
      UnresolvedCompositeToken() => resolveCompositeToken(token),
      UnresolvedReferenceToken() => resolveReferenceToken(token),
    };

    cache[token] = resolved;

    return resolved;
  }

  Token? resolveValueToken(UnresolvedValueToken object) {
    final TokenValueType? type = object.type ?? getInheritedType(object);

    if (type == null) {
      // Can't determine token type
      return null;
    }

    final UnresolvedValue unresolvedValue = object.value;

    final Result<TokenValue>? value = switch (type) {
      TokenValueType.color => ColorParser.parse(unresolvedValue),
      TokenValueType.cubicBezier => CubicBezierParser.parse(unresolvedValue),
      TokenValueType.dimension => DimensionParser.parse(unresolvedValue),
      TokenValueType.duration => DurationParser.parse(unresolvedValue),
      TokenValueType.fontFamily => FontFamilyParser.parse(unresolvedValue),
      TokenValueType.fontWeight => FontWeightParser.parse(unresolvedValue),
      TokenValueType.number => NumberParser.parse(unresolvedValue),
      _ => null,
    };

    if (value == null) {}

    return null;
  }

  Token? resolveReferenceToken(UnresolvedReferenceToken object) {
    return null;
  }

  Token? resolveCompositeToken(UnresolvedCompositeToken object) {
    return null;
  }

  TokenGroup? resolveTokenGroup(UnresolvedTokenGroup object) {
    return null;
  }

  Token? resolveReference(List<String> path, List<UnresolvedToken> stack) {
    UnresolvedTokenObject? object;

    root:
    for (final MapEntry<String, UnresolvedTokenObject> rootObject in tokens.entries) {
      object = rootObject.value;
      for (final String pathPart in path) {
        if (object is! UnresolvedTokenGroup) {
          break root;
        }

        object = object.children[pathPart];
      }

      if (object is UnresolvedToken) {
        break;
      }
    }

    if (object is! UnresolvedToken) {
      return null;
    }

    return resolveToken(object, stack);
  }

  TokenValueType? getInheritedType(UnresolvedTokenObject object) {
    UnresolvedTokenGroup? currentObject = object.parent;
    while (currentObject != null) {
      final TokenValueType? parentType = currentObject.type;

      if (parentType != null) {
        return parentType;
      }

      currentObject = currentObject.parent;
    }

    return null;
  }
}
