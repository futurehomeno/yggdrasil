class YgSearchMatch {
  const YgSearchMatch({
    required this.start,
    required this.end,
  });

  /// The offset of the start of the match.
  final int start;

  /// The offset of the end of the match.
  final int end;
}
