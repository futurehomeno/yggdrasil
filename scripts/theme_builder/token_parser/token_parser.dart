// ignore_for_file: avoid-dynamic

import 'package:yggdrasil/src/generated/theme/extensions/_extensions.dart';

import '_token_parser.dart';

class TokenParser {
  const TokenParser._();

  static final RegExp _variantKeyRegex = RegExp(r'^([^\/]+)\/([^\/]+)$');
  static final RegExp _tokenValueRegex = RegExp(r'^\{([^}]+)\}$');

  static TokenGroup parse(Map<String, dynamic> json) {
    final bool isValue = json.containsKey(r'$value');
    final bool isVariant = json.keys.any((String key) => key.contains(_variantKeyRegex));
    if (isValue || isVariant) {
      throw Exception('Top map can not be a variant or value');
    }

    return _parseClass(json);
  }

  static TokenObject _parseEntry(Map<String, dynamic> json) {
    final bool isValue = json.containsKey(r'$value');
    if (isValue) {
      return _parseSimpleValue(json);
    }

    final bool isVariant = json.keys.any((String key) => key.contains(_variantKeyRegex));
    if (isVariant) {
      return _parseVariant(json);
    }

    return _parseClass(json);
  }

  static ThemeValue _parseSimpleValue(Map<String, dynamic> json) {
    final dynamic value = json[r'$value'];
    final String? type = json.safeValue<String>(r'$type');

    if (type != null) {
      if (value is! String) {
        throw Exception('Received a non string token value!');
      }

      final RegExpMatch? tokenMatch = _tokenValueRegex.firstMatch(value);
      if (tokenMatch == null) {
        throw Exception('Received a invalid token value!');
      }

      final String tokenPath = tokenMatch.group(1) ?? '';

      return ThemeTokenValue(
        type: ThemeTokenType.values.byName(type),
        path: tokenPath.split('.'),
      );
    } else if (value is String) {
      return ThemeStringValue(
        value: value,
      );
    } else if (value is num) {
      return ThemeNumberValue(
        value: value.toDouble(),
      );
    }

    throw Exception('Received unrecognized value type!');
  }

  static TokenGroup _parseClass(Map<String, dynamic> json) {
    final Map<String, TokenObject> entries = <String, TokenObject>{};

    for (final MapEntry<String, dynamic>(:String key, :dynamic value) in json.entries) {
      if (value is! Map<String, dynamic>) {
        throw Exception('Found non object value in class map!');
      }

      entries[key] = _parseEntry(value);
    }

    return TokenGroup(
      entries: entries,
    );
  }

  static ThemeVariant _parseVariant(Map<String, dynamic> json) {
    final Map<String, TokenObject> entries = <String, TokenObject>{};

    String? variantName;

    for (final MapEntry<String, dynamic>(:String key, :dynamic value) in json.entries) {
      final RegExpMatch? variantMatch = _variantKeyRegex.firstMatch(key);

      if (variantMatch == null) {
        throw Exception('Non variant field in variant map!');
      }

      final String name = variantMatch.group(1) ?? '';
      final String variant = variantMatch.group(2) ?? '';

      if (variantName == null) {
        variantName = name;
      } else if (variantName != name) {
        throw Exception('Different variant name found for same variant map!');
      }

      if (value is! Map<String, dynamic>) {
        throw Exception('Found non object value in variant map!');
      }

      entries[variant] = _parseEntry(value);
    }

    if (variantName == null) {
      throw Exception('No variants found in variant map!');
    }

    return ThemeVariant(
      entries: entries,
      variantName: variantName,
    );
  }
}
