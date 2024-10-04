import 'package:yggdrasil/src/utils/yg_match_text.dart';

class YgSearchResultText {
  const YgSearchResultText({
    required this.text,
    this.matches,
  });

  final String text;
  final List<YgTextMatch>? matches;
}
