import 'package:yggdrasil/src/components/fields/search/interfaces/yg_base_search_item.dart';
import 'package:yggdrasil/src/components/fields/search/models/shared/yg_search_result.dart';
import 'package:yggdrasil/src/utils/yg_match_text/yg_formatted_text.dart';
import 'package:yggdrasil/src/utils/yg_match_text/yg_text_match.dart';

/// Search item used for both simple and advanced search providers.
class YgSearchItem<Value> extends YgBaseSearchItem<YgSearchResult<Value>> {
  const YgSearchItem({
    required this.value,
    required super.title,
    super.subtitle,
    super.icon,
  });

  /// The value of the search item.
  ///
  /// In the case of a simple search provider this value represents the final
  /// value of the search widget, in the case of an advanced search widget this
  /// value only represents the result value.
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
