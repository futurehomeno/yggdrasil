import 'dart:async';

import 'package:yggdrasil/src/components/fields/search/models/value_search/yg_search_item.dart';
import 'package:yggdrasil/src/components/fields/search/models/value_search/yg_search_provider.dart';
import 'package:yggdrasil/src/components/fields/search/models/value_search/yg_search_result.dart';
import 'package:yggdrasil/src/components/fields/search/models/yg_fuzzy_search_provider_mixin.dart';
import 'package:yggdrasil/src/utils/yg_match_text/yg_text_match.dart';

class YgFuzzySearchProvider<T> extends YgSearchProvider<T>
    with YgFuzzySearchProviderMixin<YgSearchItem<T>, YgSearchResult<T>> {
  YgFuzzySearchProvider({
    required this.items,
    this.searchSubtitle = false,
    this.threshold = 0.4,
  });

  // @override
  @override
  final bool searchSubtitle;

  // @override
  @override
  final List<YgSearchItem<T>> items;

  @override
  final double threshold;

  @override
  FutureOr<String?> buildResultText(T value) {
    for (final YgSearchItem<T> result in items) {
      if (result.value == value) {
        return result.title;
      }
    }

    return null;
  }

  @override
  YgSearchResult<T> createResultFromMatches({
    required YgSearchItem<T> item,
    required List<YgTextMatch> titleMatches,
    required List<YgTextMatch>? subtitleMatches,
  }) {
    return item.createResult(
      titleMatches: titleMatches,
      subtitleMatches: subtitleMatches,
    );
  }
}
