import '../_resolved.dart';

class NumberToken extends Token {
  const NumberToken({
    required super.unresolved,
    required this.number,
    super.description,
  });

  final double number;
}
