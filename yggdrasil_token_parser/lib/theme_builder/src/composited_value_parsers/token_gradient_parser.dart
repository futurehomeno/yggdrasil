import 'package:yggdrasil_token_parser/theme_builder/src/models/_models.dart';
import 'package:yggdrasil_token_parser/theme_builder/src/parser/errors/parsing_error.dart';
import 'package:yggdrasil_token_parser/theme_builder/src/parser/parsing_context.dart';
import 'package:yggdrasil_token_parser/theme_builder/src/value_parsers/_value_parsers.dart';
import 'package:yggdrasil_utils/yggdrasil_utils.dart';

abstract final class GradientKeys {
  const GradientKeys._();

  static const String color = 'color';
  static const String position = 'position';
}

abstract final class GradientParser {
  const GradientParser._();

  static Result<TokenGradientValue> parse(ParsingContext context, Object value) {
    if (value is! List) {
      return Result<TokenGradientValue>.error(
        ParsingError.dataType(
          expected: List,
          actual: value.runtimeType,
          path: <String>[],
        ),
      );
    }

    final List<TokenGradientStop> stops = <TokenGradientStop>[];
    final List<ParsingError> errors = <ParsingError>[];

    for (int i = 0; i < value.length; i++) {
      final Object? entry = value[i];

      if (entry is! JsonObject) {
        errors.add(
          ParsingError.dataType(
            expected: JsonObject,
            actual: value.runtimeType,
            path: <String>[],
          ),
        );
        continue;
      }

      final Result<TokenColorValue> colorResult = context.parseOrResolveProperty(
        parser: ColorParser.parse,
        object: entry,
        key: GradientKeys.color,
      );
      final Result<TokenNumberValue> positionResult = context.parseOrResolveProperty(
        parser: NumberParser.parse,
        object: entry,
        key: GradientKeys.position,
      );

      final TokenColorValue? color = colorResult.data;
      final TokenNumberValue? position = positionResult.data;

      errors.addAll(<ParsingError>[
        ...colorResult.errorsWithPath(<String>[i.toString()]),
        ...positionResult.errorsWithPath(<String>[i.toString()]),
      ]);

      if (color == null || position == null) {
        continue;
      }

      stops.add(
        TokenGradientStop(
          color: color,
          position: position,
        ),
      );
    }

    if (stops.isEmpty) {
      return Result<TokenGradientValue>(
        errors: errors,
      );
    }

    return Result<TokenGradientValue>(
      data: TokenGradientValue(stops: stops),
      errors: errors,
    );
  }
}
