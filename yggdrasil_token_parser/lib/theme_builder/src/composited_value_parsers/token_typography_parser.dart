import 'package:yggdrasil_token_parser/theme_builder/src/models/_models.dart';

abstract final class TypographyParser {
  const TypographyParser._();

  static Result<TokenTypographyValue> parse() {}
}
