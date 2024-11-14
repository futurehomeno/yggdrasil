import 'dart:async';

import 'package:yggdrasil/src/components/fields/search/models/yg_exact_search_provider_mixin.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgExactValueSearchProvider<T> extends YgValueSearchProvider<T>
    with YgExactSearchProviderMixin<YgValueSearchItem<T>, YgSearchResult<T>> {
  YgExactValueSearchProvider({
    required this.items,
    this.searchSubtitle = false,
  });

  // @override
  @override
  final bool searchSubtitle;

  // @override
  @override
  final List<YgValueSearchItem<T>> items;

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
