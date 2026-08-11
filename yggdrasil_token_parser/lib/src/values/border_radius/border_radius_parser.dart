import 'package:yggdrasil_token_parser/src/_token_parser.dart';

abstract final class BorderRadiusParser {
  const BorderRadiusParser._();

  static Result<BorderRadiusValue> parse(ParsingContext context, Object value) {
    if (value is! String) {
      return Result<BorderRadiusValue>.error(
        ParsingError.dataType(
          expected: String,
          actual: value.runtimeType,
          path: <String>[],
        ),
      );
    }

    if (value.isEmpty) {
      return Result<BorderRadiusValue>.error(
        ParsingError.format(
          data: value,
          path: <String>[],
        ),
      );
    }

    final List<String> parts = value.split(',');

    if (parts.length > 4) {
      return Result<BorderRadiusValue>.error(
        ParsingError.format(
          data: value,
          path: <String>[],
        ),
      );
    }

    final List<DimensionValue> values = <DimensionValue>[];
    final List<ParsingError> errors = <ParsingError>[];

    for (final String part in parts) {
      final Result<DimensionValue> result = context.parseOrResolveValue(
        parser: DimensionParser.parse,
        value: part,
      );

      final DimensionValue? value = result.data;
      if (value != null) {
        values.add(value);
      }

      errors.addAll(result.errors);
    }

    if (errors.isNotEmpty) {
      return Result<BorderRadiusValue>(
        errors: errors,
      );
    }

    if (values.isEmpty || values.length > 4) {
      return Result<BorderRadiusValue>.error(
        ParsingError.format(
          data: value,
          path: <String>[],
        ),
      );
    }

    if (values.length == 1) {
      return Result<BorderRadiusValue>.data(
        BorderRadiusValue(
          bottomLeft: values[0],
          bottomRight: values[0],
          topLeft: values[0],
          topRight: values[0],
        ),
      );
    }

    if (values.length == 2) {
      return Result<BorderRadiusValue>.data(
        BorderRadiusValue(
          bottomLeft: values[0],
          bottomRight: values[1],
          topLeft: values[0],
          topRight: values[1],
        ),
      );
    }

    if (values.length == 3) {
      return Result<BorderRadiusValue>.data(
        BorderRadiusValue(
          bottomLeft: values[1],
          bottomRight: values[1],
          topLeft: values[0],
          topRight: values[2],
        ),
      );
    }

    return Result<BorderRadiusValue>.data(
      BorderRadiusValue(
        bottomLeft: values[3],
        bottomRight: values[2],
        topLeft: values[0],
        topRight: values[1],
      ),
    );
  }
}
