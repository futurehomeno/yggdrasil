import 'yg_text_match.dart';

class YgFormattedText {
  const YgFormattedText({
    required this.text,
    required this.matches,
  });

  final String text;
  final List<YgTextMatch> matches;
}
