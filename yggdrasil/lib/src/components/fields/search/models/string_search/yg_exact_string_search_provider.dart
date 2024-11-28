import 'package:flutter/widgets.dart';
import 'package:yggdrasil/src/components/fields/search/models/string_search/yg_string_search_result.dart';
import 'package:yggdrasil/src/components/fields/search/models/string_search/yg_string_search_results_layout.dart';
import 'package:yggdrasil/src/components/fields/search/models/yg_exact_search_provider_mixin.dart';

import 'yg_string_search_item.dart';
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
