import 'package:yggdrasil/src/components/fields/search/models/advanced_search/_advanced_search.dart';
import 'package:yggdrasil/src/components/fields/search/models/base/yg_base_search_results_layout.dart';

class YgSearchResultsLayout<ResultValue> extends YgBaseSearchResultsLayout<YgSearchResult<ResultValue>> {
  const YgSearchResultsLayout({
    super.leading,
    super.results,
  });
}
