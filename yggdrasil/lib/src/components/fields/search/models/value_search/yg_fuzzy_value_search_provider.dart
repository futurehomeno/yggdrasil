import 'dart:async';

import 'package:yggdrasil/src/components/fields/search/models/yg_fuzzy_search_provider_mixin.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgFuzzyValueSearchProvider<T> extends YgValueSearchProvider<T>
    with YgFuzzySearchProviderMixin<YgValueSearchItem<T>, YgSearchResult<T>> {
  YgFuzzyValueSearchProvider({
    required this.items,
    this.searchSubtitle = false,
    this.threshold = 0.4,
  });

  // @override
  @override
  final bool searchSubtitle;

  // @override
  @override
  final List<YgValueSearchItem<T>> items;

  @override
  final double threshold;

  @override
  FutureOr<String?> buildResultText(T value) {
    for (final YgValueSearchItem<T> result in items) {
      if (result.value == value) {
        return result.title;
      }
    }

    return null;
  }

  @override
  YgSearchResult<T> createResultFromMatches({
    required YgValueSearchItem<T> item,
    required List<YgTextMatch> titleMatches,
    required List<YgTextMatch>? subtitleMatches,
  }) {
    return item.createResult(
      titleMatches: titleMatches,
      subtitleMatches: subtitleMatches,
    );
  }
}
