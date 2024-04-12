import 'package:yggdrasil_token_parser/theme_builder/src/models/_models.dart';

class DimensionToken extends Token {
  const DimensionToken({
    required super.unresolved,
    required this.dimension,
    required super.description,
  });

  final TokenDimension dimension;
}
