import 'package:yggdrasil_token_parser/src/_token_parser.dart';
import 'package:yggdrasil_utils/yggdrasil_utils.dart';

abstract final class TransitionParser {
  const TransitionParser._();

  static Result<TransitionValue> parse(ParsingContext context, Object value) {
    if (value is! JsonObject) {
      return Result<TransitionValue>.error(
        ParsingError.dataType(
          expected: JsonObject,
          actual: value.runtimeType,
          path: <String>[],
        ),
      );
    }

    final Result<DimensionValue> durationResult = context.parseOrResolveProperty(
      parser: DimensionParser.parse,
      object: value,
      key: TransitionKeys.duration,
    );
    final Result<DimensionValue> delayResult = context.parseOrResolveProperty(
      parser: DimensionParser.parse,
      object: value,
      key: TransitionKeys.delay,
    );
    final Result<CubicBezierValue> timingFunctionResult = context.parseOrResolveProperty(
      parser: CubicBezierParser.parse,
      object: value,
      key: TransitionKeys.timingFunction,
    );

    final DimensionValue? duration = durationResult.data;
    final DimensionValue? delay = delayResult.data;
    final CubicBezierValue? timingFunction = timingFunctionResult.data;

    final List<ParsingError> errors = <ParsingError>[
      ...durationResult.errors,
      ...delayResult.errors,
      ...timingFunctionResult.errors,
    ];

    if (duration == null || delay == null || timingFunction == null) {
      return Result<TransitionValue>(
        errors: errors,
      );
    }

    return Result<TransitionValue>(
      data: TransitionValue(
        duration: duration,
        delay: delay,
        timingFunction: timingFunction,
      ),
      errors: errors,
    );
  }
}
