import 'package:yggdrasil_token_parser/theme_builder/src/composited_value_parsers/_composited_parsers.dart';
import 'package:yggdrasil_token_parser/theme_builder/src/parser/errors/parsing_error.dart';
import 'package:yggdrasil_token_parser/theme_builder/src/parser/parsing_context.dart';
import 'package:yggdrasil_token_parser/theme_builder/src/value_parsers/_value_parsers.dart';
import 'package:yggdrasil_utils/yggdrasil_utils.dart';

import '../models/_models.dart';

abstract final class BorderKeys {
  BorderKeys._();

  static const String color = 'color';
  static const String width = 'width';
  static const String style = 'style';
}

abstract final class TokenBorderParser {
  static Result<TokenBorderValue> parse(ParsingContext context, Object value) {
    if (value is! JsonObject) {
      return Result<TokenBorderValue>.error(
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
      key: BorderKeys.color,
    );
    final Result<TokenDimensionValue> widthResult = context.parseOrResolveProperty(
      parser: DimensionParser.parse,
      object: value,
      key: BorderKeys.width,
    );
    final Result<TokenStrokeStyleValue> styleResult = context.parseOrResolveProperty(
      parser: TokenStrokeStyleParser.parse,
      object: value,
      key: BorderKeys.style,
    );

    final TokenColorValue? color = colorResult.data;
    final TokenDimensionValue? width = widthResult.data;
    final TokenStrokeStyleValue? style = styleResult.data;

    final List<ParsingError> errors = <ParsingError>[
      ...colorResult.errors,
      ...widthResult.errors,
      ...styleResult.errors,
    ];

    if (color == null || width == null || style == null) {
      return Result<TokenBorderValue>(
        errors: errors,
      );
    }

    return Result<TokenBorderValue>(
      data: TokenBorderValue(
        color: color,
        width: width,
        style: style,
      ),
    );
  }
}
