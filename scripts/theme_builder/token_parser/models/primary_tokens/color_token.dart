// ignore_for_file: avoid-dynamic

import 'dart:ui';

import '../../_token_parser.dart';
import '../values/color_type/color_type_value_or_reference.dart';
import '../values/type_value_or_reference.dart';

final class ColorToken extends ValueToken<Color> {
  const ColorToken({
    super.description,
    required this.value,
  });

  factory ColorToken.fromJson(Map<String, dynamic> json) {
    final dynamic value = json[r'$value'];

    if (value is! String) {
      throw TokenParseTypeError(
        type: ColorTypeValueOrReference.$type,
        expectedType: String,
        foundType: value.runtimeType,
        path: <String>[r'$value'],
      );
    }

    try {
      return ColorToken(
        value: ColorTypeValueOrReference.parse(value),
        description: json.safeString(r'$description'),
      );
    } catch(err) {
      if(err is TokenParseError) {
        throw err.copyWithPath('pathAddition')
      }
    }
  }

  static const String typeString = 'color';

  @override
  TokenValueType get type => ColorTypeValueOrReference.$type;

  @override
  final ColorTypeValueOrReference value;
}

abstract class ValueTokenFactory<T> {
  const ValueTokenFactory();

  ValueToken<T> parse(Map<String, dynamic> json) {
    final dynamic value = json[r'$value'];

    if(value is! Object) {
      throw TokenParseError(
        type: type,
        error: r'$value is missing',
        path: <String>[r'$value'],
      );
    }

    try {
      parseValue(value);
    } catch(err) {
      if(err is TokenParseError) {
        err.addToPath(r'$value');
      } 
    }
  }

  TypeValueOrReference<T> parseValue(Object value);

   TokenValueType get type;
}

class ColorTokenFactory extends ValueTokenFactory<Color> {
  const ColorTokenFactory();
  
  @override
  TypeValueOrReference<Color> parseValue(Object value) {
    // TODO: implement parseValue
    throw UnimplementedError();
  }
  
  @override
  TokenValueType get type => ColorTypeValueOrReference.$type;


}
