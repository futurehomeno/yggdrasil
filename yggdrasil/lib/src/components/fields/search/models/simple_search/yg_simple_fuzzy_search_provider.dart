import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:yggdrasil/src/components/fields/search/models/advanced_search/yg_search_results_layout.dart';
import 'package:yggdrasil/src/components/fields/search/models/shared/yg_search_result.dart';
import 'package:yggdrasil/src/components/fields/search/models/simple_search/yg_simple_search_provider.dart';
import 'package:yggdrasil/src/components/fields/search/models/yg_fuzzy_search_session_mixin.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgSimpleFuzzySearchProvider<Value> extends YgFuzzySearchProviderInterface<Value, Value, YgSearchResult<Value>,
    YgSearchResultsLayout<Value>, YgSearchItem<Value>> implements YgSimpleSearchProvider<Value> {
  const YgSimpleFuzzySearchProvider({
    required super.items,
    required super.noResultsBuilder,
    required super.searchSubtitle,
    required super.threshold,
    super.hintBuilder,
  });

  @override
  YgFuzzyStringSearchSession<Value> createSession() => YgFuzzyStringSearchSession<Value>();
}

class YgFuzzyStringSearchSession<Value> extends YgSimpleSearchSession<Value, YgSimpleFuzzySearchProvider<Value>>
    with
        YgFuzzySearchSessionMixin<Value, Value, YgSearchResult<Value>, YgSearchResultsLayout<Value>,
            YgSearchItem<Value>, YgSimpleFuzzySearchProvider<Value>> {
  @override
  YgSearchResultsLayout<Value> createLayoutFromResultsAndLeading({
    required List<YgSearchResult<Value>>? results,
    required Widget? leading,
  }) {
    return YgSearchResultsLayout<Value>(
      leading: leading,
      results: results,
    );
  }

  @override
  FutureOr<String?>? getValueText(Value value) {
    for (final YgSearchItem<Value> item in provider.items) {
      if (item.value == value) {
        return item.title;
      }
    }

    return null;
  }
}
