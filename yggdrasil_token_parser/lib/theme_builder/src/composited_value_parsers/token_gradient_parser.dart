import 'package:yggdrasil_token_parser/theme_builder/src/models/_models.dart';

abstract final class GradientParser {
  const GradientParser._();

  static Result<TokenGradientValue> parse() {}
}
