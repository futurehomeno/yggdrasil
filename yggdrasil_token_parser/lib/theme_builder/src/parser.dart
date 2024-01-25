import 'package:yggdrasil_token_parser/theme_builder/src/extensions/_extensions.dart';
import 'package:yggdrasil_utils/yggdrasil_utils.dart';

import 'enums/_enums.dart';
import 'models/_models.dart';

class Parser {
  const Parser._();

  static UnresolvedResult parse(JsonObject json) {
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
          :UnresolvedTokenObject? result,
        ) = parse(value);

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
        result: UnresolvedTokenGroup(
          children: children,
        ),
      );
    }

    if (value is JsonObject) {
      final Map<String, UnresolvedValueOrReference> properties = <String, UnresolvedValueOrReference>{};

      for (final MapEntry<String, dynamic>(:String key, :dynamic value) in value.entries) {
        if (value is Object) {
          properties[key] = UnresolvedValueOrReference.prase(value);
        } else {
          errors.add(
            TokenParseTypeError(
              path: <String>[TokenKeys.value, key],
              expectedType: Object,
              foundType: value.runtimeType,
            ),
          );
        }
      }

      return UnresolvedResult(
        result: UnresolvedCompositeToken(
          description: description,
          type: parsedType,
          properties: properties,
        ),
        errors: errors,
      );
    }

    if (value is String) {
      final UnresolvedValueOrReference valueOrReference = UnresolvedValueOrReference.prase(value);

      switch (valueOrReference) {
        case UnresolvedReference():
          return UnresolvedResult(
            errors: errors,
            result: UnresolvedReferenceToken(
              reference: valueOrReference,
            ),
          );
        case UnresolvedValue():
          return UnresolvedResult(
            errors: errors,
            result: UnresolvedValueToken(
              value: valueOrReference,
            ),
          );
      }
    }

    return UnresolvedResult(
      errors: errors,
      result: UnresolvedValueToken(
        value: UnresolvedValue(value: value),
      ),
    );
  }
}
