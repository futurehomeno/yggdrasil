import 'package:yggdrasil_token_parser/theme_builder/src/models/_models.dart';
import 'package:yggdrasil_token_parser/theme_builder/src/models/values/_value.dart';

abstract final class FontFamilyParser {
  const FontFamilyParser._();

  Result<TokenFontFamilyValue> parse(UnresolvedValueToken token) {
    final Object value = token.value.value;

    final List<String> families = <String>[];

    if (value is List) {
      for (int i = 0; i < value.length; i++) {
        final dynamic entry = value[i];

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
}
