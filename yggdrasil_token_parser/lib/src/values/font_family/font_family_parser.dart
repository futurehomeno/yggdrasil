import 'package:yggdrasil_token_parser/src/_token_parser.dart';

abstract final class FontFamilyParser {
  const FontFamilyParser._();

  static Result<FontFamilyValue> parse(ParsingContext context, Object value) {
    final List<String> families = <String>[];

    if (value is List) {
      for (int i = 0; i < value.length; i++) {
        final dynamic entry = value[i];

        if (entry is! String) {
          return Result<FontFamilyValue>.error(
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

      return Result<FontFamilyValue>.data(
        FontFamilyValue(
          families: families,
        ),
      );
    } else if (value is String) {
      families.add(value);
    } else {
      return Result<FontFamilyValue>.error(
        ParsingError.dataTypes(
          expected: <Type>[String, List],
          actual: value.runtimeType,
          path: <String>[],
        ),
      );
    }

    return Result<FontFamilyValue>.data(
      FontFamilyValue(
        families: families,
      ),
    );
  }
}
