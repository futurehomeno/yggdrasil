import 'package:yggdrasil_token_parser/theme_builder/src/extensions/_extensions.dart';
import 'package:yggdrasil_utils/yggdrasil_utils.dart';

import 'enums/_enums.dart';
import 'models/_models.dart';

class Parser {
  const Parser._();

  static UnresolvedTokenParseResult parse(JsonObject json) {
    final String? extending = json
        .safeValue<JsonObject>(TokenKeys.extensions)
        ?.safeValue<JsonObject>(TokenKeys.extensionDomain)
        ?.safeValue(TokenKeys.baseTheme);

    final UnresolvedResult result = _parseData(json);

    return UnresolvedTokenParseResult(
      data: result.data,
      errors: result.errors,
      extending: extending,
    );
  }

  static UnresolvedResult _parseData(JsonObject json, [UnresolvedTokenGroup? parent]) {
    final List<TokenParseError> errors = <TokenParseError>[];

    final String? type = json.safeValue(TokenKeys.type);
    final TokenValueType? parsedType;
    if (type == null) {
      parsedType = null;
    } else {
      parsedType = TokenValueType.values.safeByName(type);
      if (parsedType == null) {
        errors.add(
          TokenParseFormatError(
            path: <String>[TokenKeys.type],
            data: type,
          ),
        );
      }
    }

    final String? description = json.safeValue(TokenKeys.description);
    final dynamic value = json[TokenKeys.value];

    if (value is! Object) {
      final Map<String, UnresolvedTokenObject> children = <String, UnresolvedTokenObject>{};

      final UnresolvedTokenGroup tokenGroup = UnresolvedTokenGroup(
        children: children,
        description: description,
        type: parsedType,
        parent: parent,
      );

      for (final MapEntry<String, dynamic>(:String key, :dynamic value) in json.entries) {
        if (key.startsWith(r'$')) {
          continue;
        }

        if (value is! JsonObject) {
          errors.add(
            TokenParseTypeError(
              path: <String>[key],
              expectedType: JsonObject,
              foundType: value.runtimeType,
            ),
          );

          continue;
        }

        final UnresolvedResult(
          errors: List<TokenParseError> childErrors,
          data: UnresolvedTokenObject? result,
        ) = _parseData(value, tokenGroup);

        if (result != null) {
          children[key] = result;
        }

        errors.addAllWithPath(
          <String>[key],
          childErrors,
        );
      }

      if (children.isEmpty) {
        return UnresolvedResult(
          errors: errors,
        );
      }

      return UnresolvedResult(
        errors: errors,
        data: tokenGroup,
      );
    }

    final UnresolvedValueOrReference valueOrReference = _parseValue(value);

    return UnresolvedResult(
      errors: errors,
      data: UnresolvedToken(
        description: description,
        type: parsedType,
        parent: parent,
        value: valueOrReference,
      ),
    );
  }

  static UnresolvedValueOrReference _parseValue(Object value) {
    // TODO(Tim): Look in to error handling regarding null values.
    if (value is JsonObject) {
      final Map<String, UnresolvedValueOrReference> values = <String, UnresolvedValueOrReference>{};

      for (final MapEntry<String, dynamic> entry in value.entries) {
        final dynamic value = entry.value;

        if (value is Object) {
          values[entry.key] = _parseValue(value);
        }
      }

      return UnresolvedCompositeValue(
        value: values,
      );
    }

    // TODO(Tim): Look in to error handling regarding empty lists and null values.
    if (value is List) {
      final List<UnresolvedValueOrReference> values = <UnresolvedValueOrReference>[];

      for (final dynamic object in value) {
        if (object is Object) {
          values.add(_parseValue(object));
        }
      }

      return UnresolvedValueList(
        values: values,
      );
    }

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
