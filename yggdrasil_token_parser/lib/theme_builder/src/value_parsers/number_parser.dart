import 'package:yggdrasil_token_parser/theme_builder/src/models/_models.dart';
import 'package:yggdrasil_token_parser/theme_builder/src/models/values/_value.dart';

abstract final class NumberParser {
  const NumberParser._();

  Result<TokenNumberValue> parse(UnresolvedValue unresolvedValue) {
    final Object value = unresolvedValue.value;
    if (value is! num) {
      throw TokenParseTypeError(
        expectedType: num,
        foundType: value.runtimeType,
      );
    }

    return Result<TokenNumberValue>.data(
      TokenNumberValue(
        number: value.toDouble(),
      ),
    );
  }
}
