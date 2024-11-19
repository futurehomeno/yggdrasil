import 'dart:async';

import 'package:yggdrasil/src/components/fields/search/models/value_search/yg_search_item.dart';
import 'package:yggdrasil/src/components/fields/search/models/value_search/yg_search_provider.dart';
import 'package:yggdrasil/src/components/fields/search/models/value_search/yg_search_result.dart';
import 'package:yggdrasil/src/components/fields/search/models/yg_fuzzy_search_session_mixin.dart';
import 'package:yggdrasil/src/utils/yg_match_text/yg_text_match.dart';

class YgFuzzySearchProvider<Value> extends YgSearchProvider<Value>
    implements YgFuzzySearchProviderInterface<Value, YgSearchItem<Value>, YgSearchResult<Value>> {
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
  final List<YgSearchItem<Value>> items;

  @override
  final double threshold;

  @override
  YgFuzzySearchSession<Value> createSession() {
    return YgFuzzySearchSession<Value>();
  }
}

class YgFuzzySearchSession<Value> extends YgSearchSession<Value, YgFuzzySearchProvider<Value>>
    with YgFuzzySearchSessionMixin<Value, YgSearchItem<Value>, YgSearchResult<Value>, YgFuzzySearchProvider<Value>> {
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
