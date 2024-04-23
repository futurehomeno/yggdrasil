import 'package:yggdrasil_token_parser/theme_builder/src/_token_parser.dart';
import 'package:yggdrasil_token_parser/theme_builder/src/parser/errors/parsing_error.dart';
import 'package:yggdrasil_token_parser/theme_builder/src/parser/parsing_context.dart';
import 'package:yggdrasil_token_parser/theme_builder/src/value_parsers/dimension_parser.dart';
import 'package:yggdrasil_utils/yggdrasil_utils.dart';

abstract final class StrokeStyleKeys {
  const StrokeStyleKeys._();

  static const String dashArray = 'dashArray';
  static const String lineCap = 'lineCap';
}

abstract final class TokenStrokeStyleParser {
  const TokenStrokeStyleParser._();

  static Result<TokenStrokeStyleValue> parse(ParsingContext context, Object value) {
    if (value is String) {
      final TokenStrokeStyle? style = TokenStrokeStyle.values.safeByName(value);

      if (style == null) {
        return Result<TokenStrokeStyleValue>.error(
          ParsingError.format(
            data: value,
            path: <String>[],
          ),
        );
      }

      return Result<TokenSimpleStrokeStyleValue>.data(
        TokenSimpleStrokeStyleValue(
          style: style,
        ),
      );
    }

    if (value is JsonObject) {
      final List<ParsingError> errors = <ParsingError>[];

      final Object? rawDashArray = value[StrokeStyleKeys.dashArray];
      final List<TokenDimensionValue> dashArray = <TokenDimensionValue>[];
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
            final Result<TokenDimensionValue> result = DimensionParser.parse(
              context,
              entry,
            );

            errors.addAll(result.errorsWithPath(path));

            final TokenDimensionValue? value = result.data;
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
        return Result<TokenStrokeStyleValue>(
          errors: errors,
        );
      }

      return Result<TokenStrokeStyleValue>.data(
        TokenCustomStrokeStyleValue(
          dashArray: dashArray,
          lineCap: lineCap,
        ),
      );
    }

    return Result<TokenStrokeStyleValue>.error(
      ParsingError.dataTypes(
        expected: <Type>[JsonObject, String],
        actual: value.runtimeType,
        path: <String>[],
      ),
    );
  }
}
