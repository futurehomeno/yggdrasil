import '../models/_models.dart';

abstract final class BorderParser {
  const BorderParser._();

  static Result<TokenBorderValue> parse() {}
}
