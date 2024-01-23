// ignore_for_file: avoid-dynamic

import '../../../_token_parser.dart';
import '../type_value_or_reference.dart';
import 'dimension_type_reference.dart';
import 'dimension_type_value.dart';

abstract class DimensionTypeValueOrReference extends TypeValueOrReference<double> {
  const DimensionTypeValueOrReference();

  static final RegExp _regex = RegExp(r'^(\d+(\.\d+)?|\.\d+)(px|rem)$');

  static DimensionTypeValueOrReference parse(dynamic data) {
    final List<String>? reference = ReferenceParser.tryParse(data);
    if (reference != null) {
      return DimensionTypeReference(
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

    final RegExpMatch? match = _regex.firstMatch(data);

    if (match == null) {
      throw TokenParseFormatError(
        type: _type,
        data: data,
      );
    }

    final double? number = double.tryParse(match.group(1) ?? '');
    final int scaleFactor = (match.group(3) ?? '') == 'rem' ? 16 : 1;

    if (number == null) {
      throw TokenParseFormatError(
        type: _type,
        data: data,
      );
    }

    return DimensionTypeValue(
      value: number * scaleFactor,
    );
  }

  static const TokenValueType _type = TokenValueType.dimension;

  @override
  TokenValueType get type => _type;
}
