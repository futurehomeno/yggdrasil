import 'package:yggdrasil/src/components/fields/search/models/base/yg_base_search_results_layout.dart';
import 'package:yggdrasil/src/components/fields/search/models/string_search/yg_string_search_result.dart';

class YgStringSearchResultsLayout extends YgBaseSearchResultsLayout<YgStringSearchResult> {
  const YgStringSearchResultsLayout({
    super.leading,
    super.results,
  });
}
