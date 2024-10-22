import 'yg_text_match.dart';

/// A text which has any number of matches.
///
/// Can be used together with [YgMatchText], where the matches will be
/// highlighted.
class YgFormattedText {
  const YgFormattedText({
    required this.text,
    required this.matches,
  });

  final String text;
  final List<YgTextMatch> matches;
}
