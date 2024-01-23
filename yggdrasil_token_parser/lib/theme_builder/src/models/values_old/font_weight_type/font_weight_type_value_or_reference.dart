// ignore_for_file: avoid-dynamic
import 'dart:ui';

import '../../../_token_parser.dart';
import '../type_value_or_reference.dart';
import 'font_weight_type.dart';

abstract class FontWeightTypeValueOrReference extends TypeValueOrReference<FontWeight> {
  const FontWeightTypeValueOrReference();

  static final Map<int, FontWeight> _numberMap = <int, FontWeight>{
    100: FontWeight.w100,
    200: FontWeight.w200,
    300: FontWeight.w300,
    400: FontWeight.w400,
    500: FontWeight.w500,
    600: FontWeight.w600,
    700: FontWeight.w700,
    800: FontWeight.w800,
    900: FontWeight.w900,
    950: FontWeight.w900, // Flutter does not support FontWeight.w950.
  };

  static final Map<String, FontWeight> _nameMap = <String, FontWeight>{
    'thin': FontWeight.w100,
    'hairline': FontWeight.w100,
    'extra-light': FontWeight.w200,
    'ultra-light': FontWeight.w200,
    'light': FontWeight.w300,
    'normal': FontWeight.w400,
    'regular': FontWeight.w400,
    'book': FontWeight.w400,
    'medium': FontWeight.w500,
    'semi-bold': FontWeight.w600,
    'demi-bold': FontWeight.w600,
    'bold': FontWeight.w700,
    'extra-bold': FontWeight.w800,
    'ultra-bold': FontWeight.w800,
    'black': FontWeight.w900,
    'heavy': FontWeight.w900,
    'extra-black': FontWeight.w900,
    'ultra-black': FontWeight.w900,
  };

  static FontWeightTypeValueOrReference parse(dynamic data) {
    final List<String>? reference = ReferenceParser.tryParse(data);
    if (reference != null) {
      return FontWeightTypeReference(
        path: reference,
      );
    }

    final FontWeight? fontWeight = switch (data) {
      String() => _nameMap[data],
      num() => _numberMap[data.toInt()],
      _ => null,
    };

    if (fontWeight == null) {
      throw TokenParseFormatError(
        type: _type,
        data: data,
      );
    }

    return FontWeightTypeValue(
      value: fontWeight,
    );
  }

  static const TokenValueType _type = TokenValueType.fontWeight;

  @override
  TokenValueType get type => _type;
}
