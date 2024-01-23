// ignore_for_file: avoid-dynamic
import '../../../_token_parser.dart';
import '../type_value_or_reference.dart';
import 'font_family_type.dart';

abstract class FontFamilyTypeValueOrReference extends TypeValueOrReference<String> {
  const FontFamilyTypeValueOrReference();

  static FontFamilyTypeValueOrReference parse(dynamic data) {
    final List<String>? reference = ReferenceParser.tryParse(data);
    if (reference != null) {
      return FontFamilyTypeReference(
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

    return FontFamilyTypeValue(
      value: data,
    );
  }

  static const TokenValueType _type = TokenValueType.fontFamily;

  @override
  TokenValueType get type => _type;
}
