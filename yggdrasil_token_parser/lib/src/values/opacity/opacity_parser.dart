import 'package:yggdrasil_token_parser/src/_token_parser.dart';

abstract final class OpacityParser {
  const OpacityParser._();

  static final RegExp _percentageRegex = RegExp(r'^(\d{0,2}(\.\d+)?)%$');
  static final RegExp _decimalRegex = RegExp(r'^0?\.\d+|[01]?$');

  static Result<OpacityValue> parse(ParsingContext context, Object value) {
    if (value is! String) {
      return Result<OpacityValue>.error(
        ParsingError.dataType(
          expected: String,
          actual: value.runtimeType,
          path: <String>[],
        ),
      );
    }

    double? parsedValue;

    final RegExpMatch? decimalMatch = _decimalRegex.firstMatch(value);
    if (decimalMatch != null) {
      parsedValue = double.tryParse(
        decimalMatch.group(0) ?? '',
      );
    }

    final RegExpMatch? percentageMatch = _percentageRegex.firstMatch(value);
    if (percentageMatch != null) {
      parsedValue = double.tryParse(percentageMatch.group(1) ?? '');

      if (parsedValue != null) {
        parsedValue /= 100;
      }
    }

    if (parsedValue == null) {
      return Result<OpacityValue>.error(
        ParsingError.format(
          data: value,
          path: <String>[],
        ),
      );
    }

    return Result<OpacityValue>.data(
      OpacityValue(
        opacity: parsedValue,
      ),
    );
  }
}
