import 'package:yggdrasil_token_parser/theme_builder/src/models/_models.dart';

class ColorToken extends Token {
  const ColorToken({
    required super.unresolved,
    required this.color,
    required super.description,
  });

  final int color;
}
