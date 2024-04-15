import 'package:yggdrasil_token_parser/theme_builder/src/enums/token_value_type.dart';
import 'package:yggdrasil_token_parser/theme_builder/src/extensions/_extensions.dart';
import 'package:yggdrasil_token_parser/theme_builder/src/models/_models.dart';
import 'package:yggdrasil_token_parser/theme_builder/src/value_parsers/_value_parsers.dart';

import 'composited_value_parsers/_composited_parsers.dart';

class Resolver {
  Resolver({
    required this.tokens,
  });

  final List<TokenParseError> errors = <TokenParseError>[];
  final Map<UnresolvedToken, Token?> cache = <UnresolvedToken, Token?>{};
  final Map<String, UnresolvedTokenObject> tokens;

  ResolvedResult resolve() {
    final Map<String, TokenObject> results = <String, TokenObject>{};
    final List<TokenParseError> errors = <TokenParseError>[];

    for (final MapEntry<String, UnresolvedTokenObject> entry in tokens.entries) {
      final Result<TokenObject> result = resolveUnresolvedTokenObject(entry.value);
      final TokenObject? data = result.data;

      if (data != null) {
        results[entry.key] = data;
      }

      errors.addAllWithPath(
        <String>[entry.key],
        result.errors,
      );
    }

    return Result<Map<String, TokenObject>>(
      data: results,
      errors: errors,
    );
  }

  Result<TokenObject> resolveUnresolvedTokenObject(
    UnresolvedTokenObject object, [
    List<UnresolvedToken> stack = const <UnresolvedToken>[],
  ]) {
    return switch (object) {
      UnresolvedToken() => resolveToken(object, stack),
      UnresolvedTokenGroup() => resolveTokenGroup(object, stack),
    };
  }

  Result<Token> resolveToken(UnresolvedToken token, List<UnresolvedToken> stack) {
    if (stack.contains(token)) {
      // Circular reference detected.
      return Result<Token>.error(
        TokenParseError(
          error: 'Token references it self or has a circular reference',
        ),
      );
    }

    final Token? cached = cache[token];
    if (cached != null) {
      return Result<Token>.data(cached);
    }

    final TokenValueType? type = token.type ?? getInheritedType(token);

    if (type == null) {
      return Result<Token>.error(
        TokenParseError(
          error: 'Token does not have a type',
        ),
      );
    }

    final UnresolvedValueOrReference unresolvedValue = token.value;

    final Result<TokenValue> result = switch (type) {
      TokenValueType.color => ColorParser.parse(unresolvedValue),
      TokenValueType.cubicBezier => CubicBezierParser.parse(unresolvedValue),
      TokenValueType.dimension => DimensionParser.parse(unresolvedValue),
      TokenValueType.duration => DurationParser.parse(unresolvedValue),
      TokenValueType.fontFamily => FontFamilyParser.parse(unresolvedValue),
      TokenValueType.fontWeight => FontWeightParser.parse(unresolvedValue),
      TokenValueType.number => NumberParser.parse(unresolvedValue),
      TokenValueType.shadow => ShadowParser.parse(unresolvedValue),
      TokenValueType.strokeStyle => StrokeStyleParser.parse(unresolvedValue),
      TokenValueType.border => BorderParser.parse(unresolvedValue),
      TokenValueType.gradient => GradientParser.parse(unresolvedValue),
      TokenValueType.typography => TypographyParser.parse(unresolvedValue),
      TokenValueType.transition => TransitionParser.parse(unresolvedValue),
    };

    final TokenValue? value = result.data;

    if (value == null) {
      if (result.errors.isEmpty) {
        return Result<Token>.error(
          TokenParseError(
            error: 'Failed to solve token value for unknown reason',
          ),
        );
      }

      return Result<Token>(
        data: null,
        errors: result.errors,
      );
    }

    return Result<Token>(
      data: Token(
        description: unresolvedToken.description,
        value: value,
      ),
      errors: result.errors,
    );
  }

  Result<TokenGroup> resolveTokenGroup(UnresolvedTokenGroup object, List<UnresolvedToken> stack) {
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
      errors.add(TokenParseError(error: 'Unable to resolve reference'))
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

class ResolvingContext {
  const ResolvingContext({
    required Resolver resolver,
    required List<UnresolvedToken> stack,
  })  : _stack = stack,
        _resolver = resolver;

  final Resolver _resolver;
  final List<UnresolvedToken> _stack;

  Result<T> parseValueOrReference<T extends TokenValue>(
    UnresolvedValueOrReference valueOrReference,
    ValueParser<T> valueParser,
  ) {
    return switch (valueOrReference) {
      UnresolvedValue() => valueParser(valueOrReference),
      UnresolvedReference() => _resolveValueReference(valueOrReference),
      UnresolvedCompositeValue() => null,
      UnresolvedValueList() => null,
    };
  }

  Result<T> _resolveValueReference<T extends TokenValue>(UnresolvedReference reference) {
    final Token? token = _resolver.resolveReference(reference.path, _stack);

    if (token == null) {
      return Result<T>.error(
        TokenParseError(
          error: 'Failed to resolve token reference ${reference.path.join('.')}',
        ),
      );
    }

    final TokenValue value = token.value;

    // DCM is dumb and thinks T always equals TokenValue which is false.
    // ignore: avoid-unnecessary-type-assertions
    if (value is! T) {
      final String expectedType = _getTypeName(T);
      final String actualType = _getTypeName(value.runtimeType);

      return Result<T>.error(
        TokenParseError(
          error: 'Incompatible token type found! Expected $expectedType but got $actualType instead',
        ),
      );
    }

    return Result<T>.data(
      value,
    );
  }

  String _getTypeName(Type type) {
    return switch (type) {
      TokenColorValue => 'color',
      TokenCubicBezierValue => 'cubicBezier',
      TokenDimensionValue => 'dimension',
      TokenDurationValue => 'duration',
      TokenFontFamilyValue => 'fontFamily',
      TokenFontWeightValue => 'fontWeight',
      TokenNumberValue => 'number',
      _ => 'unknown type',
    };
  }
}
