import 'package:yggdrasil_token_parser/theme_builder/src/models/_models.dart';
import 'package:yggdrasil_token_parser/theme_builder/src/parser/errors/parsing_error.dart';
import 'package:yggdrasil_token_parser/theme_builder/src/parser/parsing_context.dart';
import 'package:yggdrasil_token_parser/theme_builder/src/value_parsers/_value_parsers.dart';
import 'package:yggdrasil_utils/yggdrasil_utils.dart';

abstract final class TokenShadowParser {
  const TokenShadowParser._();

  static Result<TokenShadowValue> parse(ParsingContext context, Object value) {
    if (value is! JsonObject) {
      return Result<TokenShadowValue>.error(
        ParsingError.dataType(
          expected: JsonObject,
          actual: value.runtimeType,
          path: <String>[],
        ),
      );
    }

    final Result<TokenColorValue> colorResult = context.parseOrResolveProperty(
      parser: ColorParser.parse,
      object: value,
      key: ShadowKeys.color,
    );

    final Result<TokenDimensionValue> offsetXResult = context.parseOrResolveProperty(
      parser: DimensionParser.parse,
      object: value,
      key: ShadowKeys.offsetX,
    );

    final Result<TokenDimensionValue> offsetYResult = context.parseOrResolveProperty(
      parser: DimensionParser.parse,
      object: value,
      key: ShadowKeys.offsetY,
    );

    final Result<TokenDimensionValue> blurResult = context.parseOrResolveProperty(
      parser: DimensionParser.parse,
      object: value,
      key: ShadowKeys.blur,
    );

    final Result<TokenDimensionValue> spreadResult = context.parseOrResolveProperty(
      parser: DimensionParser.parse,
      object: value,
      key: ShadowKeys.spread,
    );

    final TokenColorValue? color = colorResult.data;
    final TokenDimensionValue? offsetX = offsetXResult.data;
    final TokenDimensionValue? offsetY = offsetYResult.data;
    final TokenDimensionValue? blur = blurResult.data;
    final TokenDimensionValue? spread = spreadResult.data;

    final List<ParsingError> errors = <ParsingError>[
      ...colorResult.errors,
      ...offsetXResult.errors,
      ...offsetYResult.errors,
      ...blurResult.errors,
      ...spreadResult.errors,
    ];

    if (color == null || offsetX == null || offsetY == null || blur == null || spread == null) {
      return Result<TokenShadowValue>(
        errors: errors,
      );
    }

    return Result<TokenShadowValue>(
      data: TokenShadowValue(
        color: color,
        offsetX: offsetX,
        offsetY: offsetY,
        blur: blur,
        spread: spread,
      ),
      errors: errors,
    );
  }
}
