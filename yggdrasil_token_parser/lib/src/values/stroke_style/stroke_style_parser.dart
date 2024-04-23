import 'package:yggdrasil_token_parser/src/_token_parser.dart';
import 'package:yggdrasil_utils/yggdrasil_utils.dart';

abstract final class StrokeStyleParser {
  const StrokeStyleParser._();

  static Result<StrokeStyleValue> parse(ParsingContext context, Object value) {
    if (value is String) {
      final TokenStrokeStyle? style = TokenStrokeStyle.values.safeByName(value);

      if (style == null) {
        return Result<StrokeStyleValue>.error(
          ParsingError.format(
            data: value,
            path: <String>[],
          ),
        );
      }

      return Result<SimpleStrokeStyleValue>.data(
        SimpleStrokeStyleValue(
          style: style,
        ),
      );
    }

    if (value is JsonObject) {
      final List<ParsingError> errors = <ParsingError>[];

      final Object? rawDashArray = value[StrokeStyleKeys.dashArray];
      final List<DimensionValue> dashArray = <DimensionValue>[];
      if (rawDashArray == null) {
        errors.add(
          ParsingError.missingProperty(
            path: <String>[StrokeStyleKeys.dashArray],
          ),
        );
      } else if (rawDashArray is! List) {
        errors.add(
          ParsingError.dataType(
            actual: rawDashArray.runtimeType,
            expected: List,
            path: <String>[StrokeStyleKeys.dashArray],
          ),
        );
      } else {
        for (int i = 0; i < rawDashArray.length; i++) {
          final Object? entry = rawDashArray[i];
          final List<String> path = <String>[StrokeStyleKeys.dashArray, i.toString()];
          if (entry == null) {
            errors.add(
              ParsingError.missingProperty(
                path: path,
              ),
            );
          } else {
            final Result<DimensionValue> result = DimensionParser.parse(
              context,
              entry,
            );

            errors.addAll(result.errorsWithPath(path));

            final DimensionValue? value = result.data;
            if (value != null) {
              rawDashArray.add(value);
            }
          }
        }
      }

      final Object? rawLineCap = value[StrokeStyleKeys.lineCap];
      TokenLineCap? lineCap;

      if (rawLineCap == null) {
        errors.add(
          ParsingError.missingProperty(
            path: <String>[StrokeStyleKeys.lineCap],
          ),
        );
      } else if (rawLineCap is! String) {
        errors.add(
          ParsingError.dataType(
            actual: rawLineCap.runtimeType,
            expected: String,
            path: <String>[StrokeStyleKeys.lineCap],
          ),
        );
      } else {
        lineCap = TokenLineCap.values.safeByName(rawLineCap);

        if (lineCap == null) {
          errors.add(
            ParsingError.format(
              data: rawLineCap,
              path: <String>[StrokeStyleKeys.lineCap],
            ),
          );
        }
      }

      if (errors.isNotEmpty || lineCap == null) {
        return Result<StrokeStyleValue>(
          errors: errors,
        );
      }

      return Result<StrokeStyleValue>.data(
        CustomStrokeStyleValue(
          dashArray: dashArray,
          lineCap: lineCap,
        ),
      );
    }

    return Result<StrokeStyleValue>.error(
      ParsingError.dataTypes(
        expected: <Type>[JsonObject, String],
        actual: value.runtimeType,
        path: <String>[],
      ),
    );
  }
}
