import 'package:yggdrasil_token_parser/theme_builder/src/models/_models.dart';
import 'package:yggdrasil_token_parser/theme_builder/src/parser/errors/parsing_error.dart';
import 'package:yggdrasil_token_parser/theme_builder/src/parser/parsing_context.dart';

abstract final class FontFamilyParser {
  const FontFamilyParser._();

  static Result<TokenFontFamilyValue> parse(ParsingContext context, Object value) {
    final List<String> families = <String>[];

    if (value is List) {
      for (int i = 0; i < value.length; i++) {
        final dynamic entry = value[i];

        if (entry is! String) {
          return Result<TokenFontFamilyValue>.error(
            ParsingError.dataType(
              expected: String,
              actual: entry.runtimeType,
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
    } else if (value is String) {
      families.add(value);
    } else {
      return Result<TokenFontFamilyValue>.error(
        ParsingError.dataTypes(
          expected: <Type>[String, List],
          actual: value.runtimeType,
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
