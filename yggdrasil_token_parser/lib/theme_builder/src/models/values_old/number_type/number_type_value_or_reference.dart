// ignore_for_file: avoid-dynamic
import '../../../_token_parser.dart';
import '../type_value_or_reference.dart';
import 'number_type.dart';

abstract class NumberTypeValueOrReference extends TypeValueOrReference<double> {
  const NumberTypeValueOrReference();

  static NumberTypeValueOrReference parse(dynamic data) {
    final List<String>? reference = ReferenceParser.tryParse(data);
    if (reference != null) {
      return NumberTypeReference(
        path: reference,
      );
    }

    if (data is! num) {
      throw TokenParseTypeError(
        type: _type,
        expectedType: num,
        foundType: data.runtimeType,
      );
    }

    return NumberTypeValue(
      value: data.toDouble(),
    );
  }

  static const TokenValueType _type = TokenValueType.number;

  @override
  TokenValueType get type => _type;
}
