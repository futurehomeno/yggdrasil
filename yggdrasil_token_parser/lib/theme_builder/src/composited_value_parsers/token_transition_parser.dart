import 'package:yggdrasil_token_parser/theme_builder/src/models/_models.dart';
import 'package:yggdrasil_token_parser/theme_builder/src/parser/errors/parsing_error.dart';
import 'package:yggdrasil_token_parser/theme_builder/src/parser/parsing_context.dart';
import 'package:yggdrasil_token_parser/theme_builder/src/value_parsers/_value_parsers.dart';
import 'package:yggdrasil_utils/yggdrasil_utils.dart';

abstract final class TransitionKeys {
  const TransitionKeys._();

  static const String duration = 'duration';
  static const String delay = 'delay';
  static const String timingFunction = 'timingFunction';
}

abstract final class TransitionParser {
  const TransitionParser._();

  static Result<TokenTransitionValue> parse(ParsingContext context, Object value) {
    if (value is! JsonObject) {
      return Result<TokenTransitionValue>.error(
        ParsingError.dataType(
          expected: JsonObject,
          actual: value.runtimeType,
          path: <String>[],
        ),
      );
    }

    final Result<TokenDimensionValue> durationResult = context.parseOrResolveProperty(
      parser: DimensionParser.parse,
      object: value,
      key: TransitionKeys.duration,
    );
    final Result<TokenDimensionValue> delayResult = context.parseOrResolveProperty(
      parser: DimensionParser.parse,
      object: value,
      key: TransitionKeys.delay,
    );
    final Result<TokenCubicBezierValue> timingFunctionResult = context.parseOrResolveProperty(
      parser: CubicBezierParser.parse,
      object: value,
      key: TransitionKeys.timingFunction,
    );

    final TokenDimensionValue? duration = durationResult.data;
    final TokenDimensionValue? delay = delayResult.data;
    final TokenCubicBezierValue? timingFunction = timingFunctionResult.data;

    final List<ParsingError> errors = <ParsingError>[
      ...durationResult.errors,
      ...delayResult.errors,
      ...timingFunctionResult.errors,
    ];

    if (duration == null || delay == null || timingFunction == null) {
      return Result<TokenTransitionValue>(
        errors: errors,
      );
    }

    return Result<TokenTransitionValue>(
      data: TokenTransitionValue(
        duration: duration,
        delay: delay,
        timingFunction: timingFunction,
      ),
      errors: errors,
    );
  }
}
