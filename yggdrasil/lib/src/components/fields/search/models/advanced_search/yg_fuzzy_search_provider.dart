import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:yggdrasil/src/components/fields/search/models/advanced_search/yg_search_item.dart';
import 'package:yggdrasil/src/components/fields/search/models/advanced_search/yg_search_provider.dart';
import 'package:yggdrasil/src/components/fields/search/models/advanced_search/yg_search_result.dart';
import 'package:yggdrasil/src/components/fields/search/models/advanced_search/yg_search_results_layout.dart';
import 'package:yggdrasil/src/components/fields/search/models/advanced_search/yg_search_value_and_text.dart';
import 'package:yggdrasil/src/components/fields/search/models/yg_fuzzy_search_session_mixin.dart';

class YgFuzzySearchProvider<Value> extends YgSearchProvider<Value, Value>
    implements
        YgFuzzySearchProviderInterface<Value, Value, YgSearchResult<Value>, YgSearchResultsLayout<Value>,
            YgSearchItem<Value>> {
  YgFuzzySearchProvider({
    required this.items,
    required this.noResultsBuilder,
    this.hintBuilder,
    this.searchSubtitle = false,
    this.threshold = 0.4,
  });

  @override
  final bool searchSubtitle;

  @override
  final List<YgSearchItem<Value>> items;

  @override
  final double threshold;

  @override
  final WidgetBuilder? hintBuilder;

  @override
  final WidgetBuilder noResultsBuilder;

  @override
  YgFuzzySearchSession<Value> createSession() {
    return YgFuzzySearchSession<Value>();
  }
}

class YgFuzzySearchSession<Value> extends YgSearchSession<Value, Value, YgFuzzySearchProvider<Value>>
    with
        YgFuzzySearchSessionMixin<Value, Value, YgSearchResult<Value>, YgSearchResultsLayout<Value>,
            YgSearchItem<Value>, YgFuzzySearchProvider<Value>> {
  @override
  FutureOr<YgSearchValueAndText<Value>?> getValueFromResultValue(Value value) {
    for (final YgSearchItem<Value> result in provider.items) {
      if (result.value == value) {
        return YgSearchValueAndText<Value>(
          value: result.value,
          resultText: result.title,
        );
      }
    }

    return null;
  }

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
}
