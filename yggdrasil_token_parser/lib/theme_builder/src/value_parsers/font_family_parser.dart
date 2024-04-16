import 'package:yggdrasil_token_parser/theme_builder/src/models/_models.dart';

abstract final class FontFamilyParser {
  const FontFamilyParser._();

  static Result<TokenFontFamilyValue> parse(UnresolvedValue unresolvedValue) {
    final Object value = unresolvedValue.value;

    final List<String> families = <String>[];

    if (value is List) {
      return parseList;
    } else if (value is String) {
      families.add(value);
    } else {
      return Result<TokenFontFamilyValue>.error(
        TokenParseTypeError.multiple(
          expectedTypes: <Type>[String, List],
          foundType: value.runtimeType,
        ),
      );
    }

    return Result<TokenFontFamilyValue>.data(
      TokenFontFamilyValue(
        families: families,
      ),
    );
  }

  static Result<TokenFontFamilyValue> parseList(UnresolvedValueList unresolvedValue) {
    final List<String> families = <String>[];
    final List<UnresolvedValueOrReference> values = unresolvedValue.values;

    for (int i = 0; i < values.length; i++) {
      final dynamic entry = values[i];

      if (entry is! String) {
        return Result<TokenFontFamilyValue>.error(
          TokenParseTypeError(
            expectedType: String,
            foundType: entry.runtimeType,
            path: <String>[
              i.toString(),
            ],
          ),
        );
      }

      families.add(entry);
    }

    return Result<TokenFontFamilyValue>.data(
      TokenFontFamilyValue(
        families: families,
      ),
    );
  }
}
