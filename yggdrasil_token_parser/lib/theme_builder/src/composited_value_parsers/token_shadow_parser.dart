import 'package:yggdrasil_token_parser/theme_builder/src/models/_models.dart';

abstract final class ShadowParser {
  const ShadowParser._();

  static Result<TokenShadowValue> parse() {}
}
