import 'package:yggdrasil/src/components/fields/search/interfaces/yg_base_search_results_layout.dart';
import 'package:yggdrasil/src/components/fields/search/models/string_search/yg_string_search_result.dart';

/// Search results layout for string search providers.
class YgStringSearchResultsLayout extends YgBaseSearchResultsLayout<YgStringSearchResult> {
  const YgStringSearchResultsLayout({
    super.leading,
    super.results,
  });
}
