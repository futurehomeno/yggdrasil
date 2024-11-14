import 'package:yggdrasil/src/components/fields/search/models/string_search/yg_string_search_item.dart';
import 'package:yggdrasil/src/components/fields/search/models/value_search/yg_search_result.dart';
import 'package:yggdrasil/src/utils/yg_match_text/yg_formatted_text.dart';
import 'package:yggdrasil/src/utils/yg_match_text/yg_text_match.dart';

class YgSearchItem<T> extends YgStringSearchItem {
  const YgSearchItem({
    required this.value,
    required super.title,
    super.subtitle,
    super.icon,
  });

  final T value;

  @override
  YgSearchResult<T> createResult({List<YgTextMatch>? titleMatches, List<YgTextMatch>? subtitleMatches}) {
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

    return YgSearchResult<T>(
      title: formattedTitle,
      subtitle: formattedSubtitle,
      icon: icon,
      value: value,
    );
  }
}
