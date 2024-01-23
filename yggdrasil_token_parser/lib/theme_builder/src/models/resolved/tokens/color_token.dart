import '../_resolved.dart';

class ColorToken extends Token {
  const ColorToken({
    required super.unresolved,
    required this.color,
    super.description,
  });

  final int color;
}
