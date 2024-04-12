import 'package:yggdrasil_token_parser/theme_builder/src/enums/token_value_type.dart';
import 'package:yggdrasil_token_parser/theme_builder/src/models/_models.dart';
import 'package:yggdrasil_token_parser/theme_builder/src/models/resolved/tokens/_tokens.dart';

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

    switch (type) {
      case TokenValueType.color:
        return ColorToken(
          unresolved: object,
          color: object.value.value,
        );
    }
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

  BorderToken? resolveBorderToken() {
    return null;
  }

  CubicBezierToken? resolveCubicBezierToken() {
    return null;
  }

  DimensionToken? resolveDimensionToken() {
    return null;
  }

  DurationToken? resolveDurationToken() {
    return null;
  }

  FontFamilyToken? resolveFontFamilyToken() {
    return null;
  }

  FontWeightToken? resolveFontWeightToken() {
    return null;
  }

  GradientToken? resolveGradientToken() {
    return null;
  }

  NumberToken? resolveNumberToken() {
    return null;
  }

  ShadowToken? resolveShadowToken() {
    return null;
  }

  StrokeStyleToken? resolveStrokeStyleToken() {
    return null;
  }

  TransitionToken? resolveTransitionToken() {
    return null;
  }

  TypographyToken? resolveTypographyToken() {
    return null;
  }
}

class ResolvingNode {
  const ResolvingNode._({
    required this.parent,
    required this.children,
    required this.unresolvedTokenObject,
    required this.name,
  });

  factory ResolvingNode.fromUnresolvedTokenObject({
    required UnresolvedTokenObject unresolvedTokenObject,
    required String name,
  }) {
    return _createContextForUnresolvedTokenObject(
      unresolvedTokenObject: unresolvedTokenObject,
      name: name,
    );
  }

  static ResolvingNode _createContextForUnresolvedTokenObject({
    required UnresolvedTokenObject unresolvedTokenObject,
    required String name,
    ResolvingNode? parent,
  }) {
    final Map<String, ResolvingNode> children = <String, ResolvingNode>{};

    final ResolvingNode context = ResolvingNode._(
      children: children,
      unresolvedTokenObject: unresolvedTokenObject,
      parent: parent,
      name: name,
    );

    if (unresolvedTokenObject is UnresolvedTokenGroup) {
      for (final MapEntry<String, UnresolvedTokenObject> entry in unresolvedTokenObject.children.entries) {
        children[entry.key] = _createContextForUnresolvedTokenObject(
          unresolvedTokenObject: entry.value,
          parent: context,
          name: entry.key,
        );
      }
    }

    return context;
  }

  final String? name;
  final ResolvingNode? parent;
  final Map<String, ResolvingNode> children;
  final UnresolvedTokenObject unresolvedTokenObject;

  TokenValueType? getInheritedType() {
    final ResolvingNode? parent = this.parent;
    final UnresolvedTokenObject tokenObject = this.unresolvedTokenObject;

    if (parent == null) {
      return null;
    }

    final TokenValueType? parentType = switch (tokenObject) {
      UnresolvedTokenGroup() => tokenObject.type,
      UnresolvedToken() => tokenObject.type,
    };

    if (parentType != null) {
      return parentType;
    }

    return parent.getInheritedType();
  }

  void resolve() {}
}

// class RootResolvingNode {
//   const RootResolvingNode({
//     required this.rootGroup,
//   });

//   factory RootResolvingNode.fromList(List<UnresolvedTokenObject> objects) {

//   }

//   final UnresolvedTokenGroup rootGroup;

//   ResolvingNode? resolveReference(List<String> path) {
//     for (final firstNode in nodes) {
//       ResolvingNode? currentNode = firstNode;
//       int i = 0;
//       while (currentNode != null) {
//         if (path.length - 1 == i) {}

//         currentNode = currentNode.children[path[i]];

//         i++;
//       }
//     }
//   }
// }
