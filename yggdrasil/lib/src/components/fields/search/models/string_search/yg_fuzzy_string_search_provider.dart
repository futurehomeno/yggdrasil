import 'package:flutter/widgets.dart';
import 'package:yggdrasil/src/components/fields/search/models/string_search/yg_string_search_item.dart';
import 'package:yggdrasil/src/components/fields/search/models/string_search/yg_string_search_result.dart';
import 'package:yggdrasil/src/components/fields/search/models/string_search/yg_string_search_results_layout.dart';
import 'package:yggdrasil/src/components/fields/search/models/yg_fuzzy_search_session_mixin.dart';

import 'yg_string_search_provider.dart';

class YgFuzzyStringSearchProvider extends YgStringSearchProvider
    implements
        YgFuzzySearchProviderInterface<String, String, YgStringSearchResult, YgStringSearchResultsLayout,
            YgStringSearchItem> {
  YgFuzzyStringSearchProvider({
    required this.items,
    required this.noResultsBuilder,
    this.hintBuilder,
    this.searchSubtitle = false,
    this.threshold = 0.4,
  });

  @override
  final bool searchSubtitle;

  @override
  final List<YgStringSearchItem> items;

  @override
  final double threshold;

  @override
  final WidgetBuilder? hintBuilder;

  @override
  final WidgetBuilder noResultsBuilder;

  @override
  YgFuzzyStringSearchSession createSession() {
    return YgFuzzyStringSearchSession();
  }
}

class YgFuzzyStringSearchSession extends YgStringSearchSession<YgFuzzyStringSearchProvider>
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
