import '../_resolved.dart';

class FontFamilyToken extends Token {
  const FontFamilyToken({
    required super.unresolved,
    required this.families,
    super.description,
  });

  final List<String> families;
}
