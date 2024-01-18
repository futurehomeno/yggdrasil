// ignore_for_file: avoid-dynamic

import 'dart:ui';

import '../../../_token_parser.dart';
import '../type_value_or_reference.dart';
import 'color_type_reference.dart';
import 'color_type_value.dart';

abstract class ColorTypeValueOrReference extends TypeValueOrReference<Color> {
  const ColorTypeValueOrReference();

  static final RegExp _colorRegex = RegExp(r'^#([0-9a-f]{2})?([0-9a-f]{6})$');

  static ColorTypeValueOrReference parse(dynamic data) {
    final List<String>? reference = ReferenceParser.tryParse(data);
    if (reference != null) {
      return ColorTypeReference(
        path: reference,
      );
    }

    if (data is! String) {
      throw TokenParseTypeError(
        type: _type,
        expectedType: String,
        foundType: data.runtimeType,
        path: <String>[r'$type'],
      );
    }

    final RegExpMatch? hexMatch = _colorRegex.firstMatch(data);
    if (hexMatch != null) {
      final String? transparencyHex = hexMatch.group(1);
      final String? colorHex = hexMatch.group(2);

      if (colorHex == null) {
        throw TokenParseFormatError(
          type: _type,
          data: data,
        );
      }

      int? color = int.tryParse(colorHex, radix: 16);

      if (color == null) {
        throw TokenParseFormatError(
          type: _type,
          data: data,
        );
      }

      if (transparencyHex != null) {
        final int? transparency = int.tryParse(transparencyHex);

        if (transparency == null) {
          throw TokenParseFormatError(
            type: _type,
            data: data,
          );
        }

        color |= transparency << 24;
      } else {
        color |= 0xff000000;
      }

      return ColorTypeValue(
        value: Color(color),
      );
    }

    throw TokenParseFormatError(
      type: _type,
      data: data,
    );
  }

  static const TokenValueType _type = TokenValueType.color;

  @override
  TokenValueType get type => _type;
}
