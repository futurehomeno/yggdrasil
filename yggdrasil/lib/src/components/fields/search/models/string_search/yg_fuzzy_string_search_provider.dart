import 'package:yggdrasil/src/components/fields/search/models/string_search/yg_string_search_item.dart';
import 'package:yggdrasil/src/components/fields/search/models/string_search/yg_string_search_result.dart';
import 'package:yggdrasil/src/components/fields/search/models/yg_fuzzy_search_provider_mixin.dart';
import 'package:yggdrasil/src/utils/yg_match_text/yg_text_match.dart';

import 'yg_string_search_provider.dart';

class YgFuzzyStringSearchProvider extends YgStringSearchProvider
    with YgFuzzySearchProviderMixin<YgStringSearchItem, YgStringSearchResult> {
  YgFuzzyStringSearchProvider({
    required this.items,
    this.searchSubtitle = false,
    this.threshold = 0.4,
  });

  // @override
  @override
  final bool searchSubtitle;

  // @override
  @override
  final List<YgStringSearchItem> items;

  @override
  final double threshold;

  @override
  YgStringSearchResult createResultFromMatches({
    required YgStringSearchItem item,
    required List<YgTextMatch> titleMatches,
    required List<YgTextMatch>? subtitleMatches,
  }) {
    return item.createResult(
      titleMatches: titleMatches,
      subtitleMatches: subtitleMatches,
    );
  }
}
