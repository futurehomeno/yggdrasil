import 'yg_search_match.dart';

class YgSearchResultText {
  const YgSearchResultText({
    required this.text,
    this.matches,
  });

  final String text;
  final List<YgSearchMatch>? matches;
}
