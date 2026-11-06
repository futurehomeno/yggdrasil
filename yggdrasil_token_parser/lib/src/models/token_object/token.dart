import 'package:yggdrasil_token_parser/src/_token_parser.dart';

class Token extends TokenObject {
  const Token({
    required this.description,
    required this.value,
  });

  final String? description;
  final TokenValue value;
}
