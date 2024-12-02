import 'package:flutter/widgets.dart';
import 'package:yggdrasil/src/components/fields/search/interfaces/_interfaces.dart';
import 'package:yggdrasil/src/components/fields/search/models/string_search/_string_search.dart';

import 'yg_string_search_provider.dart';

class YgExactStringSearchProvider extends YgStringSearchProvider
    implements
        YgExactSearchProviderInterface<String, String, YgStringSearchResult, YgStringSearchResultsLayout,
            YgStringSearchItem> {
  YgExactStringSearchProvider({
    required this.items,
    required this.noResultsBuilder,
    this.hintBuilder,
    this.searchSubtitle = false,
  });

  @override
  final bool searchSubtitle;

  @override
  final List<YgStringSearchItem> items;

  @override
  final WidgetBuilder? hintBuilder;

  @override
  final WidgetBuilder noResultsBuilder;

  @override
  YgExactStringSearchSession createSession() {
    return YgExactStringSearchSession();
  }
}

class YgExactStringSearchSession extends YgStringSearchSession<YgExactStringSearchProvider>
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
