import 'package:yggdrasil_token_parser/theme_builder/src/models/_models.dart';
import 'package:yggdrasil_token_parser/theme_builder/src/models/values/_value.dart';

class DimensionToken extends Token {
  const DimensionToken({
    required this.dimension,
    required super.description,
  });

  final TokenDimensionValue dimension;
}
