import 'dart:async';

import 'package:yggdrasil/src/components/fields/search/models/yg_exact_search_provider_mixin.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgExactSearchProvider<Value> extends YgSearchProvider<Value>
    implements YgExactSearchProviderInterface<Value, YgSearchItem<Value>, YgSearchResult<Value>> {
  YgExactSearchProvider({
    required this.items,
    this.searchSubtitle = false,
  });

  @override
  final bool searchSubtitle;

  @override
  final List<YgSearchItem<Value>> items;

  @override
  YgExactSearchSession<Value> createSession() {
    return YgExactSearchSession<Value>();
  }
}

class YgExactSearchSession<Value> extends YgSearchSession<Value, YgExactSearchProvider<Value>>
    with YgExactSearchSessionMixin<Value, YgSearchItem<Value>, YgSearchResult<Value>, YgExactSearchProvider<Value>> {
  @override
  FutureOr<String?> buildResultText(Value value) {
    for (final YgSearchItem<Value> result in provider.items) {
      if (result.value == value) {
        return result.title;
      }
    }

    return '';
  }

  @override
  YgSearchResult<Value> createResultFromMatches({
    required YgSearchItem<Value> item,
    required List<YgTextMatch> titleMatches,
    required List<YgTextMatch>? subtitleMatches,
  }) {
    return item.createResult(
      titleMatches: titleMatches,
      subtitleMatches: subtitleMatches,
    );
  }
}
