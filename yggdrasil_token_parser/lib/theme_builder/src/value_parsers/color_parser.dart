import 'package:yggdrasil_token_parser/theme_builder/src/models/_models.dart';

import '../models/values/_value.dart';

abstract final class ColorParser {
  const ColorParser._();

  static final RegExp _colorRegex = RegExp(r'^#([0-9a-f]{2})?([0-9a-f]{6})$');

  static Result<TokenColorValue> parse(UnresolvedValue unresolvedValue) {
    final Object value = unresolvedValue.value;

    if (value is! String) {
      return Result<TokenColorValue>.error(
        TokenParseTypeError(
          expectedType: String,
          foundType: value.runtimeType,
        ),
      );
    }

    final RegExpMatch? hexMatch = _colorRegex.firstMatch(value);
    if (hexMatch != null) {
      final String? transparencyHex = hexMatch.group(1);
      final String? colorHex = hexMatch.group(2);

      if (colorHex == null) {
        return Result<TokenColorValue>.error(
          TokenParseFormatError(data: value),
        );
      }

      int? color = int.tryParse(colorHex, radix: 16);

      if (color == null) {
        return Result<TokenColorValue>(
          errors: <TokenParseError>[
            TokenParseFormatError(data: value),
          ],
        );
      }

      if (transparencyHex != null) {
        final int? transparency = int.tryParse(transparencyHex);

        if (transparency == null) {
          return Result<TokenColorValue>.error(
            TokenParseFormatError(data: value),
          );
        }

        color |= transparency << 24;
      } else {
        color |= 0xff000000;
      }

      return Result<TokenColorValue>.data(
        TokenColorValue(color: color),
      );
    }

    return Result<TokenColorValue>.error(
      TokenParseFormatError(data: value),
    );
  }
}
