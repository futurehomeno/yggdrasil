import 'package:flutter/widgets.dart';
import 'package:yggdrasil/src/components/fields/search/interfaces/yg_base_search_result.dart';

typedef YgSearchResultsLayoutAny = YgBaseSearchResultsLayout<YgBaseSearchResult>;

/// Internal base class for search result layouts.
class YgBaseSearchResultsLayout<Result extends YgBaseSearchResult> {
  const YgBaseSearchResultsLayout({
    this.leading,
    this.results,
  });

  /// Any widget shown above the results in the search widget.
  final Widget? leading;

  /// The results show in the search widget.
  final List<Result>? results;
}
