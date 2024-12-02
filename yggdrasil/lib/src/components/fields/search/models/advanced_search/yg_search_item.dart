import 'package:yggdrasil/src/components/fields/search/interfaces/yg_base_search_item.dart';
import 'package:yggdrasil/src/components/fields/search/models/shared/yg_search_result.dart';
import 'package:yggdrasil/src/utils/yg_match_text/yg_formatted_text.dart';
import 'package:yggdrasil/src/utils/yg_match_text/yg_text_match.dart';

class YgSearchItem<Value> extends YgBaseSearchItem<YgSearchResult<Value>> {
  const YgSearchItem({
    required this.value,
    required super.title,
    super.subtitle,
    super.icon,
  });

  final Value value;

  @override
  YgSearchResult<Value> createResult({
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

    return YgSearchResult<Value>(
      title: formattedTitle,
      subtitle: formattedSubtitle,
      icon: icon,
      value: value,
    );
  }
}
