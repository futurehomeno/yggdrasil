import 'package:yggdrasil/src/components/fields/search/models/yg_exact_search_provider_mixin.dart';
import 'package:yggdrasil/src/components/fields/search/models/yg_string_search_result.dart';
import 'package:yggdrasil/src/utils/yg_match_text/yg_text_match.dart';

import 'yg_string_search_item.dart';
import 'yg_string_search_provider.dart';

class YgExactMatchStringSearchProvider extends YgStringSearchProvider
    with YgExactSearchProviderMixin<YgStringSearchItem, YgStringSearchResult> {
  YgExactMatchStringSearchProvider({
    required this.items,
    this.searchSubtitle = false,
  });

  @override
  final bool searchSubtitle;

  @override
  final List<YgStringSearchItem> items;

  @override
  YgStringSearchResult createResultFromMatches({
    required YgStringSearchItem item,
    required List<YgTextMatch> titleMatches,
    required List<YgTextMatch>? subtitleMatches,
  }) {
    return item.createResult(
      subtitleMatches: subtitleMatches,
      titleMatches: titleMatches,
    );
  }
}
