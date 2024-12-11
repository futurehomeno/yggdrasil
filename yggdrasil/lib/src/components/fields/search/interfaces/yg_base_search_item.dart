import 'package:yggdrasil/src/components/fields/search/interfaces/yg_base_search_result.dart';
import 'package:yggdrasil/src/utils/yg_icon_data/yg_icon_data.dart';
import 'package:yggdrasil/src/utils/yg_match_text/yg_text_match.dart';

/// Base class for search items.
///
/// Used in exact match and fuzzy search providers.
abstract class YgBaseSearchItem<Result extends YgBaseSearchResult> {
  const YgBaseSearchItem({
    required this.icon,
    required this.subtitle,
    required this.title,
  });

  /// The title of the item.
  final String title;

  /// The subtitle shown under the [title] of the item.
  final String? subtitle;

  /// The icon shown in front of the item..
  final YgIconData? icon;

  /// Turns this item in to a search result.
  Result createResult({
    List<YgTextMatch>? titleMatches,
    List<YgTextMatch>? subtitleMatches,
  });
}
