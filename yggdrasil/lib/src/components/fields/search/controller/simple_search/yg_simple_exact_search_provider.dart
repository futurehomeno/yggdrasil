import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:yggdrasil/src/components/fields/search/interfaces/_interfaces.dart';
import 'package:yggdrasil/yggdrasil.dart';

/// Provides simple exact match search capabilities for a generic search widget.
///
/// This class allows you to perform exact match searches on a list of generic items.
/// You can provide a list of items to search through, and it will return
/// results that exactly match the search query.
///
/// It also supports a builder for displaying a message when there are no
/// results, and an optional hint builder for displaying search hints.
///
/// Example:
/// ```
/// YgSimpleSearchField<int>(
///   keyboardType: TextInputType.text,
///   autocorrect: false,
///   textCapitalization: TextCapitalization.sentences,
///   label: 'Example search field',
///   completeAction: YgCompleteAction.focusNext,
///   searchProvider: YgSimpleExactSearchProvider<int>(
///     items: [
///       YgSearchItem<int>(title: 'Item 1', subtitle: 'Subtitle 1', value: 1),
///       YgSearchItem<int>(title: 'Item 2', subtitle: 'Subtitle 2', value: 2),
///       YgSearchItem<int>(title: 'Item 3', subtitle: 'Subtitle 3', value: 3),
///     ],
///     noResultsBuilder: (context) => Text('No results found'),
///     hintBuilder: (context) => Text('Type to search'),
///     searchSubtitle: true,
///     requireQuery: true,
///   ),
/// );
/// ```
class YgSimpleExactSearchProvider<Value> extends YgExactSearchProviderInterface<Value, Value, YgSearchResult<Value>,
    YgSearchResultsLayout<Value>, YgSearchItem<Value>> implements YgSimpleSearchProvider<Value> {
  const YgSimpleExactSearchProvider({
    required super.items,
    required super.noResultsBuilder,
    super.searchSubtitle,
    super.hintBuilder,
    super.requireQuery,
  });

  @override
  YgSimpleSearchSession<Value, YgSimpleExactSearchProvider<Value>> createSession() =>
      _YgSimpleExactSearchSession<Value>();
}

class _YgSimpleExactSearchSession<Value> extends YgSimpleSearchSession<Value, YgSimpleExactSearchProvider<Value>>
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
