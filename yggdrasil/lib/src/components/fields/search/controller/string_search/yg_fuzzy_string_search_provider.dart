import 'package:flutter/widgets.dart';
import 'package:yggdrasil/src/components/fields/search/interfaces/_interfaces.dart';
import 'package:yggdrasil/src/components/fields/search/models/string_search/_string_search.dart';

import 'yg_string_search_provider.dart';

/// Provides fuzzy search capabilities for a string search widget.
///
/// This class allows you to perform fuzzy searches on a list of string items.
/// You can provide a list of items to search through, and it will return
/// results that closely match the search query.
///
/// It also supports a builder for displaying a message when there are no
/// results, and an optional hint builder for displaying search hints.
///
/// Example:
/// ```
/// YgStringSearchField(
///   keyboardType: TextInputType.streetAddress,
///   autocorrect: false,
///   textCapitalization: TextCapitalization.sentences,
///   label: 'Example search field',
///   completeAction: YgCompleteAction.focusNext,
///   searchProvider: YgFuzzyStringSearchProvider(
///     items: [
///       YgStringSearchItem(title: 'Item 1', subtitle: 'Subtitle 1'),
///       YgStringSearchItem(title: 'Item 2', subtitle: 'Subtitle 2'),
///       YgStringSearchItem(title: 'Item 3', subtitle: 'Subtitle 3'),
///     ],
///     noResultsBuilder: (context) => Text('No results found'),
///     hintBuilder: (context) => Text('Type to search'),
///     searchSubtitle: true,
///     threshold: 0.5,
///     requireQuery: true,
///   ),
/// );
/// ```
class YgFuzzyStringSearchProvider extends YgFuzzySearchProviderInterface<String, String, YgStringSearchResult,
    YgStringSearchResultsLayout, YgStringSearchItem> implements YgStringSearchProvider {
  const YgFuzzyStringSearchProvider({
    required super.items,
    required super.noResultsBuilder,
    super.hintBuilder,
    super.searchSubtitle,
    super.threshold,
    super.requireQuery,
  });

  @override
  YgStringSearchSession<YgFuzzyStringSearchProvider> createSession() {
    return _YgFuzzyStringSearchSession();
  }
}

class _YgFuzzyStringSearchSession extends YgStringSearchSession<YgFuzzyStringSearchProvider>
    with
        YgFuzzySearchSessionMixin<String, String, YgStringSearchResult, YgStringSearchResultsLayout, YgStringSearchItem,
            YgFuzzyStringSearchProvider> {
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
