import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:yggdrasil/src/components/fields/search/models/advanced_search/yg_search_results_layout.dart';
import 'package:yggdrasil/src/components/fields/search/models/advanced_search/yg_search_value_and_text.dart';
import 'package:yggdrasil/src/components/fields/search/models/yg_exact_search_provider_mixin.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgExactSearchProvider<Value> extends YgSearchProvider<Value, Value>
    implements
        YgExactSearchProviderInterface<Value, Value, YgSearchResult<Value>, YgSearchResultsLayout<Value>,
            YgSearchItem<Value>> {
  YgExactSearchProvider({
    required this.items,
    required this.noResultsBuilder,
    this.hintBuilder,
    this.searchSubtitle = false,
  });

  @override
  final bool searchSubtitle;

  @override
  final List<YgSearchItem<Value>> items;

  @override
  final WidgetBuilder? hintBuilder;

  @override
  final WidgetBuilder noResultsBuilder;

  @override
  YgExactSearchSession<Value> createSession() {
    return YgExactSearchSession<Value>();
  }
}

class YgExactSearchSession<Value> extends YgSearchSession<Value, Value, YgExactSearchProvider<Value>>
    with
        YgExactSearchSessionMixin<Value, Value, YgSearchResult<Value>, YgSearchResultsLayout<Value>,
            YgSearchItem<Value>, YgExactSearchProvider<Value>> {
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
}
