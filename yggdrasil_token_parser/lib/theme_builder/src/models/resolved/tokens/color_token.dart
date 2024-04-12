import 'package:yggdrasil_token_parser/theme_builder/src/models/_models.dart';
import 'package:yggdrasil_token_parser/theme_builder/src/models/values/_value.dart';

class ColorToken extends Token {
  const ColorToken({
    required this.color,
    required super.description,
  });

  final TokenColorValue color;
}
