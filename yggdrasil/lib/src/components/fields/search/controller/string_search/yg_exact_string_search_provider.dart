import 'package:flutter/widgets.dart';
import 'package:yggdrasil/src/components/fields/search/interfaces/_interfaces.dart';
import 'package:yggdrasil/src/components/fields/search/models/string_search/_string_search.dart';

import 'yg_string_search_provider.dart';

/// Provides exact match search capabilities for a string search widget.
///
/// This class allows you to perform exact match searches on a list of string items.
/// You can provide a list of items to search through, and it will return
/// results that exactly match the search query.
///
/// It also supports a builder for displaying a message when there are no
/// results, and an optional hint builder for displaying search hints.
///
/// Example:
/// ```
/// YgStringSearchField(
///   keyboardType: TextInputType.text,
///   autocorrect: false,
///   textCapitalization: TextCapitalization.sentences,
///   label: 'Example search field',
///   completeAction: YgCompleteAction.focusNext,
///   searchProvider: YgExactStringSearchProvider(
///     items: [
///       YgStringSearchItem(title: 'Item 1', subtitle: 'Subtitle 1'),
///       YgStringSearchItem(title: 'Item 2', subtitle: 'Subtitle 2'),
///       YgStringSearchItem(title: 'Item 3', subtitle: 'Subtitle 3'),
///     ],
///     noResultsBuilder: (context) => Text('No results found'),
///     hintBuilder: (context) => Text('Type to search'),
///     searchSubtitle: true,
///     requireQuery: true,
///   ),
/// );
/// ```
class YgExactStringSearchProvider extends YgExactSearchProviderInterface<String, String, YgStringSearchResult,
    YgStringSearchResultsLayout, YgStringSearchItem> implements YgStringSearchProvider {
  const YgExactStringSearchProvider({
    required super.items,
    required super.noResultsBuilder,
    super.hintBuilder,
    super.searchSubtitle,
    super.requireQuery,
  });

  @override
  YgStringSearchSession<YgExactStringSearchProvider> createSession() {
    return _YgExactStringSearchSession();
  }
}

class _YgExactStringSearchSession extends YgStringSearchSession<YgExactStringSearchProvider>
    with
        YgExactSearchSessionMixin<String, String, YgStringSearchResult, YgStringSearchResultsLayout, YgStringSearchItem,
            YgExactStringSearchProvider> {
  @override
  YgStringSearchResultsLayout createLayoutFromResultsAndLeading({
    required List<YgStringSearchResult>? results,
    required Widget? leading,
  }) {
    return YgStringSearchResultsLayout(
      leading: leading,
      results: results,
    );
  }
}
