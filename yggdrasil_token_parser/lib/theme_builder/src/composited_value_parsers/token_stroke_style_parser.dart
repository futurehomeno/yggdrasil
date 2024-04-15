import 'package:yggdrasil_token_parser/theme_builder/src/models/_models.dart';

abstract final class StrokeStyleParser {
  const StrokeStyleParser._();

  static Result<TokenStrokeStyleValue> parse(Map<String, UnresolvedValueOrReference> properties) {}
}
