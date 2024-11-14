import 'package:yggdrasil/src/components/fields/search/models/string_search/yg_string_search_result.dart';
import 'package:yggdrasil/src/utils/yg_icon_data/yg_icon_data.dart';
import 'package:yggdrasil/src/utils/yg_match_text/_yg_match_text.dart';

class YgStringSearchItem {
  const YgStringSearchItem({
    required this.icon,
    required this.subtitle,
    required this.title,
  });

  final String title;
  final String? subtitle;
  final YgIconData? icon;

  YgStringSearchResult createResult({
    List<YgTextMatch>? titleMatches,
    List<YgTextMatch>? subtitleMatches,
  }) {
    final YgFormattedText? formattedSubtitle;
    final String? subtitle = this.subtitle;
    if (subtitle != null) {
      formattedSubtitle = YgFormattedText(
        matches: subtitleMatches ?? <YgTextMatch>[],
        text: subtitle,
      );
    } else {
      formattedSubtitle = null;
    }

    final YgFormattedText formattedTitle = YgFormattedText(
      text: title,
      matches: titleMatches ?? <YgTextMatch>[],
    );

    return YgStringSearchResult(
      title: formattedTitle,
      subtitle: formattedSubtitle,
      icon: icon,
    );
  }
}
