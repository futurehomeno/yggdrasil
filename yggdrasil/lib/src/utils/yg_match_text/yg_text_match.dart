/// A match inside a YgFormattedText.
class YgTextMatch {
  const YgTextMatch({
    required this.start,
    required this.end,
  });

  /// The start of the match.
  final int start;

  /// The end of the match relative to the text.
  final int end;
}
