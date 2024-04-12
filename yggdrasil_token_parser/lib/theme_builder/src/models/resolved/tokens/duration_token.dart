import 'package:yggdrasil_token_parser/theme_builder/src/_token_parser.dart';

class DurationToken extends Token {
  const DurationToken({
    required super.unresolved,
    required this.duration,
    required super.description,
  });

  final int duration;
}
