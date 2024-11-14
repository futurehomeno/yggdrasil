import 'dart:async';

import 'package:yggdrasil/src/components/fields/search/models/value_search/yg_search_provider.dart';
import 'package:yggdrasil/src/components/fields/search/models/yg_exact_search_provider_mixin.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgExactSearchProvider<T> extends YgSearchProvider<T>
    with YgExactSearchProviderMixin<YgSearchItem<T>, YgSearchResult<T>> {
  YgExactSearchProvider({
    required this.items,
    this.searchSubtitle = false,
  });

  // @override
  @override
  final bool searchSubtitle;

  // @override
  @override
  final List<YgSearchItem<T>> items;

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
