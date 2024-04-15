import '_resolved.dart';

class Token extends TokenObject {
  const Token({
    required this.description,
    required this.value,
  });

  final String? description;
  final TokenValue value;
}
