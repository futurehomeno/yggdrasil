import 'package:yggdrasil/src/components/fields/search/models/base/yg_base_search_item.dart';
import 'package:yggdrasil/src/components/fields/search/models/string_search/yg_string_search_result.dart';
import 'package:yggdrasil/src/utils/yg_match_text/_yg_match_text.dart';

class YgStringSearchItem extends YgBaseSearchItem<YgStringSearchResult> {
  const YgStringSearchItem({
    required super.icon,
    required super.subtitle,
    required super.title,
  });

  @override
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
