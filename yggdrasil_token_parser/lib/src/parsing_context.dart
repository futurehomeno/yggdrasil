import 'package:yggdrasil_token_parser/src/_token_parser.dart';
import 'package:yggdrasil_utils/yggdrasil_utils.dart';

typedef ValueParser<T extends TokenValue> = Result<T> Function(ParsingContext context, Object value);

/// A node in the token tree.
///
/// Provides interfaces to parse, validate and resolve design tokens.
///
/// Keeps track of any errors in [errors]. These errors are node specific and by
/// walking through the node tree a list of errors for every token can be generated.
class ParsingContext {
  ParsingContext({
    required ParsingContext this.parent,
    required String this.name,
  });

  ParsingContext.root()
      : name = null,
        parent = null;

  /// A list of child contexts.
  ///
  /// Should not be manually manipulated. Use _getOrCreateChildContext to get or
  /// create child contexts.
  final Map<String, ParsingContext> children = <String, ParsingContext>{};

  /// All the errors which were found for this object.
  final List<ParsingError> errors = <ParsingError>[];

  /// The parent context.
  final ParsingContext? parent;

  /// Set of source files where this object was defined.
  final List<String> sourceFiles = <String>[];

  /// Set of all descriptions for this context.
  ///
  /// Any context can only max have one description, but in case of a collision
  /// between multiple objects, we want to be able to store all descriptions for
  /// error generation.
  final Set<String> descriptions = <String>{};

  /// List of all types for this context.
  ///
  /// Any context can only max have one type, but in case of a collision between
  /// multiple objects, we want to be able to store all types for error generation.
  final Set<TokenValueType> types = <TokenValueType>{};

  /// List with all the values found for this context.
  ///
  /// Any token can only max have one value, but in case of a collision between
  /// multiple objects, we want to be able to store all types for error generation.
  final List<Object?> rawValues = <Object?>[];

  /// The name of this context.
  ///
  /// This is identical to the last entry of the path to this context. For the
  /// root context this will be null.
  final String? name;

  // Resolved
  Object? _rawValue;
  TokenValue? _value;
  TokenValueType? _valueType;
  TokenObjectType? _objectType;

  /// Whether this object is a valid object.
  bool get isValid => _valid;
  bool _valid = true;

  bool get isToken => _objectType == TokenObjectType.token;

  ParsingContext _getOrCreateChildContext(String name) {
    final ParsingContext? context = children[name];
    if (context != null) {
      return context;
    }

    return children[name] = ParsingContext(
      parent: this,
      name: name,
    );
  }

  void addError(ParsingError error) => errors.add(error);

  void addRawData({
    required JsonObject json,
    required String sourceFile,
  }) {
    final String? rawType = json.safeValue(TokenKeys.type);
    final TokenValueType? type;
    if (rawType == null) {
      type = null;
    } else {
      type = TokenValueType.values.safeByName(rawType);
      if (type == null) {
        errors.add(
          ParsingError(
            message: 'Unrecognized type',
            details: '$rawType is not a valid type name',
            path: <String>[TokenKeys.type],
          ),
        );
      }
    }

    final String? description = json.safeValue(TokenKeys.description);
    if (description != null) {
      descriptions.add(description);
    }

    if (type != null) {
      types.add(type);
    }

    final dynamic value = json[TokenKeys.value];

    // If value is not defined this object is a token group.
    if (value is! Object) {
      for (final MapEntry<String, dynamic>(key: String name, :dynamic value) in json.entries) {
        if (name.startsWith(r'$')) {
          continue;
        }

        final ParsingContext childContext = _getOrCreateChildContext(name);

        if (value is! JsonObject) {
          childContext.errors.add(
            ParsingError(
              message: 'Invalid token data format',
              details: 'Expected an json object but found an ${value.runtimeType} instead',
              path: <String>[],
            ),
          );

          continue;
        }

        childContext.addRawData(
          json: value,
          sourceFile: sourceFile,
        );
      }
    } else {
      rawValues.add(value);
    }
  }

  bool validateRawData() {
    final bool isToken = rawValues.isNotEmpty;
    final bool isGroup = children.isNotEmpty;

    if (isToken && isGroup) {
      _objectType = TokenObjectType.invalid;
      errors.add(
        ParsingError.conflict(
          details: 'Object is defined as both a token group and as a token in 2 or more files',
          path: <String>[],
        ),
      );

      return _valid = false;
    }

    if (isToken) {
      _objectType = TokenObjectType.token;
      if (rawValues.length > 1) {
        errors.add(
          ParsingError.conflict(
            details: 'Token is defined in 2 or more files',
            path: <String>[],
          ),
        );

        return _valid = false;
      }

      final Object? value = rawValues.first;
      if (value == null) {
        errors.add(
          ParsingError(
            message: 'Invalid token value',
            details: 'Token value was defined but has a null value',
            path: <String>[TokenKeys.value],
          ),
        );

        return _valid = false;
      }

      _rawValue = value;
    }

    if (isGroup) {
      _objectType = TokenObjectType.group;
      if (types.length > 1) {
        errors.add(
          ParsingError.conflict(
            details: 'Multiple types defined for group with the same path: ${types.join(', ')}',
            path: <String>[],
          ),
        );

        return _valid = false;
      }

      if (descriptions.length > 1) {
        errors.add(
          ParsingError.conflict(
            details: 'Multiple descriptions defined for group with the same path:\n${types.join(',\n')}',
            path: <String>[],
          ),
        );

        return _valid = false;
      }
    }

    if (!isGroup && !isToken) {
      _objectType = TokenObjectType.invalid;
      errors.add(
        ParsingError(
          message: 'Token group is empty',
          path: <String>[],
        ),
      );

      return _valid = false;
    }

    return true;
  }

  void resolveTypeAndReference() {
    if (!isValid) {
      return;
    }

    // Resolve the object type.
    ParsingContext? currentContext = this;
    while (currentContext != null) {
      if (types.isNotEmpty) {
        // Pick the first type as the object is valid and this should be safe.
        _valueType = types.first;
        break;
      }

      currentContext = currentContext.parent;
    }
  }

  static final RegExp _referenceRegex = RegExp(r'^{([^}]+)}$');

  TokenValue? getOrResolveValue([Set<ParsingContext> resolvingStack = const <ParsingContext>{}]) {
    // Can only resolve valid tokens.
    if (!isValid || !isToken) {
      return null;
    }

    // Prevent resolving value if this is a circular reference.
    if (resolvingStack.contains(this)) {
      _valid = false;
      errors.add(ParsingError(
        message: 'Value reference is a circular reference',
        details: 'This value either directly or indirectly points to it self.',
        path: <String>[TokenKeys.value],
      ));

      return null;
    }

    // Returns cached value.
    if (_value != null) {
      return _value;
    }

    final Object? rawValue = _rawValue;

    // Ensure value isn't null, even though this should never happen.
    if (rawValue == null) {
      return null;
    }

    // Check whether the value is a valid reference.
    if (rawValue is String) {
      final RegExpMatch? match = _referenceRegex.firstMatch(rawValue);

      if (match != null) {
        final List<String> reference = match.group(1)?.split('') ?? <String>[];
        final Result<TokenValue> result = resolveReferencedValue(reference);
        final TokenValue? value = result.data;

        // Add all errors in case there are any.
        errors.addAll(
          result.errorsWithKey(
            TokenKeys.value,
          ),
        );

        if (value == null) {
          return null;
        }

        final TokenValueType? valueType = _valueType;
        if (valueType == null) {
          _valueType = value.type;
        } else if (valueType != value.type) {
          errors.add(
            ParsingError(
              message: 'Token type does not match type of referenced token',
              details:
                  'The type of this token is ${valueType} while the type of the referenced token ${reference.join('.')} is ${value.type}',
              path: <String>[TokenKeys.type],
            ),
          );

          return null;
        }

        _value = value;

        return value;
      }
    }

    final TokenValueType? valueType = _valueType;

    // We were not able to resolve the type so we can't resolve the value.
    if (valueType == null) {
      _valid = false;
      errors.add(
        ParsingError(
          message: 'Unable to resolve token type',
          details: 'Token has no type, does not reference a (valid) token and does not inherit any type',
          path: <String>[],
        ),
      );

      return null;
    }

    final Result<TokenValue> value = switch (valueType) {
      TokenValueType.color => ColorParser.parse(this, rawValue),
      TokenValueType.cubicBezier => CubicBezierParser.parse(this, rawValue),
      TokenValueType.dimension => DimensionParser.parse(this, rawValue),
      TokenValueType.duration => DurationParser.parse(this, rawValue),
      TokenValueType.fontFamily => FontFamilyParser.parse(this, rawValue),
      TokenValueType.fontWeight => FontWeightParser.parse(this, rawValue),
      TokenValueType.number => NumberParser.parse(this, rawValue),
      TokenValueType.shadow => ShadowParser.parse(this, rawValue),
      TokenValueType.strokeStyle => StrokeStyleParser.parse(this, rawValue),
      TokenValueType.border => BorderParser.parse(this, rawValue),
      TokenValueType.gradient => GradientParser.parse(this, rawValue),
      TokenValueType.typography => TypographyParser.parse(this, rawValue),
      TokenValueType.transition => TransitionParser.parse(this, rawValue),
    };

    if (value.errors.isNotEmpty) {
      errors.addAll(value.errors);
    }

    final TokenValue? data = value.data;
    if (data == null) {
      _valid = false;
    }

    _value = data;

    return data;
  }

  Result<TokenValue> resolveReferencedValue(List<String> reference) {
    final ParsingContext? referencedContext = resolveReference(reference);

    if (referencedContext == null) {
      return Result<TokenValue>.error(
        ParsingError(
          message: 'Value references non existing token',
          details: '${reference.join('.')} does not exist',
          path: <String>[],
        ),
      );
    }

    if (!referencedContext.isToken) {
      return Result<TokenValue>.error(
        ParsingError(
          message: 'Value references a non token object',
          details: '${reference.join('.')} is not a token',
          path: <String>[],
        ),
      );
    }

    // We need to call this before checking if the token is valid, as calling
    // this method might change this.
    final TokenValue? value = referencedContext.getOrResolveValue();
    if (value == null) {
      return Result<TokenValue>.error(
        ParsingError(
          message: 'Value references invalid token',
          details: '${reference.join('.')} is an invalid token',
          path: <String>[],
        ),
      );
    }

    return Result<TokenValue>.data(
      value.getReference(reference),
    );
  }

  ParsingContext? resolveReference(List<String> reference) {
    final Iterator<String> iterator = reference.iterator;
    ParsingContext? currentContext = this;

    // Ensure we are at the root context.
    while (currentContext?.parent != null) {
      currentContext = currentContext?.parent;
    }

    // Travel down the path from the root context.
    while (currentContext != null && iterator.moveNext()) {
      currentContext = currentContext.children[iterator.current];
    }

    return currentContext;
  }

  Result<T> parseOrResolveProperty<T extends TokenValue>({
    required ValueParser<T> parser,
    required JsonObject object,
    required String key,
  }) {
    final Object? value = object[key];

    if (value == null) {
      return Result<T>.error(
        ParsingError.missingProperty(
          path: <String>[key],
        ),
      );
    }

    final TokenValueType? expectedType = _getValueType<T>();

    if (expectedType == null) {
      throw Exception('Called parseOrResolveValue with unknown type argument: $T');
    }

    if (value is String) {
      final RegExpMatch? match = _referenceRegex.firstMatch(value);

      if (match != null) {
        final List<String> reference = match.group(1)?.split('') ?? <String>[];

        final Result<TokenValue> result = resolveReferencedValue(
          reference,
        );

        final TokenValue? value = result.data;
        if (value == null) {
          return Result<T>(
            errors: result.errorsWithKey(key),
          );
        }

        // Ignore this, DCM doesn't understand T can extend TokenValue which
        // could cause a mismatch.
        // ignore: avoid-unnecessary-type-assertions
        if (value is! T) {
          return Result<T>.error(
            ParsingError(
              message: 'Resolved token does not match expected type',
              details:
                  'The expected token type is $expectedType while the type of the resolved token at ${reference.join('.')} is ${value.type}',
              path: <String>[key],
            ),
          );
        }

        return Result<T>.data(value);
      }
    }

    return parser(
      this,
      value,
    )..errorsWithKey(key);
  }

  TokenValueType? _getValueType<T>() {
    return switch (T) {
      BorderValue => TokenValueType.border,
      GradientValue => TokenValueType.gradient,
      ShadowValue => TokenValueType.shadow,
      StrokeStyleValue => TokenValueType.strokeStyle,
      TransitionValue => TokenValueType.transition,
      TypographyValue => TokenValueType.typography,
      ColorValue => TokenValueType.color,
      CubicBezierValue => TokenValueType.cubicBezier,
      DimensionValue => TokenValueType.dimension,
      DurationValue => TokenValueType.duration,
      FontFamilyValue => TokenValueType.fontFamily,
      FontWeightValue => TokenValueType.fontWeight,
      NumberValue => TokenValueType.number,
      _ => null,
    };
  }
}
