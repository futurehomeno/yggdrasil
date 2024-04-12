import 'package:yggdrasil_token_parser/theme_builder/src/models/_models.dart';

class FontFamilyToken extends Token {
  const FontFamilyToken({
    required this.families,
    required super.description,
  });

  final List<String> families;
}
