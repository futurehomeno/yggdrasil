import 'package:yggdrasil_token_parser/theme_builder/src/models/_models.dart';

abstract final class CubicBezierParser {
  const CubicBezierParser._();

  static Result<TokenCubicBezierValue> parse(UnresolvedValue unresolvedValue) {
    final Object value = unresolvedValue.value;

    if (value is! List) {
      return Result<TokenCubicBezierValue>.error(
        TokenParseTypeError(
          expectedType: List,
          foundType: value.runtimeType,
        ),
      );
    }

    if (value.length != 4) {
      return Result<TokenCubicBezierValue>.error(
        TokenParseFormatError(
          data: value,
        ),
      );
    }

    final List<double> doubles = <double>[];
    for (int i = 0; i < 4; i++) {
      final dynamic entry = value[i];

      if (entry is! double) {
        return Result<TokenCubicBezierValue>.error(
          TokenParseTypeError(
            expectedType: double,
            foundType: entry.runtimeType,
            path: <String>[i.toString()],
          ),
        );
      }

      doubles.add(entry);
    }

    return Result<TokenCubicBezierValue>.data(
      TokenCubicBezierValue(
        a: doubles[0],
        b: doubles[1],
        c: doubles[2],
        d: doubles[3],
      ),
    );
  }
}
