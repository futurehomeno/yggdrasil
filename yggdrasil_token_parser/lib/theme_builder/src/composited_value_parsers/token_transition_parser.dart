import 'package:yggdrasil_token_parser/theme_builder/src/models/_models.dart';

abstract final class TransitionParser {
  const TransitionParser._();

  static Result<TokenTransitionValue> parse() {}
}
