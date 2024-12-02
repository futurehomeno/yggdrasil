import 'package:yggdrasil/src/components/fields/search/interfaces/yg_base_search_results_layout.dart';
import 'package:yggdrasil/src/components/fields/search/models/advanced_search/_advanced_search.dart';

class YgSearchResultsLayout<ResultValue> extends YgBaseSearchResultsLayout<YgSearchResult<ResultValue>> {
  const YgSearchResultsLayout({
    super.leading,
    super.results,
  });
}
