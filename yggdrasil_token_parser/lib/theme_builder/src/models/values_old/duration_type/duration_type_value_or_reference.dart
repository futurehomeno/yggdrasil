// ignore_for_file: avoid-dynamic
import '../../../_token_parser.dart';
import '../type_value_or_reference.dart';
import 'duration_type.dart';

abstract class DurationTypeValueOrReference extends TypeValueOrReference<Duration> {
  const DurationTypeValueOrReference();

  static final RegExp _durationRegex = RegExp(r'^(\d+)ms$');

  static DurationTypeValueOrReference parse(dynamic data) {
    final List<String>? reference = ReferenceParser.tryParse(data);
    if (reference != null) {
      return DurationTypeReference(
        path: reference,
      );
    }

    if (data is! String) {
      throw TokenParseTypeError(
        type: _type,
        expectedType: String,
        foundType: data.runtimeType,
      );
    }

    final RegExpMatch? match = _durationRegex.firstMatch(data);

    if (match == null) {
      throw TokenParseFormatError(
        type: _type,
        data: data,
      );
    }

    final int? number = int.tryParse(match.group(1) ?? '');

    if (number == null) {
      throw TokenParseFormatError(
        type: _type,
        data: data,
      );
    }

    return DurationTypeValue(
      value: Duration(milliseconds: number),
    );
  }

  static const TokenValueType _type = TokenValueType.duration;

  @override
  TokenValueType get type => _type;
}
