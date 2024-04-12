import 'package:yggdrasil_token_parser/theme_builder/src/models/_models.dart';

class UnresolvedTokenParseResult extends UnresolvedResult {
  const UnresolvedTokenParseResult({
    super.data,
    super.errors,
    required this.extending,
  });

  final String? extending;
}
