import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:yggdrasil/src/components/fields/search/controller/simple_search/yg_simple_search_provider.dart';
import 'package:yggdrasil/src/components/fields/search/interfaces/_interfaces.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgSimpleExactSearchProvider<Value> extends YgExactSearchProviderInterface<Value, Value, YgSearchResult<Value>,
    YgSearchResultsLayout<Value>, YgSearchItem<Value>> implements YgSimpleSearchProvider<Value> {
  const YgSimpleExactSearchProvider({
    required super.items,
    required super.noResultsBuilder,
    required super.searchSubtitle,
    super.hintBuilder,
  });

  @override
  YgExactStringSearchSession<Value> createSession() => YgExactStringSearchSession<Value>();
}

class YgExactStringSearchSession<Value> extends YgSimpleSearchSession<Value, YgSimpleExactSearchProvider<Value>>
    with
        YgExactSearchSessionMixin<Value, Value, YgSearchResult<Value>, YgSearchResultsLayout<Value>,
            YgSearchItem<Value>, YgSimpleExactSearchProvider<Value>> {
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
