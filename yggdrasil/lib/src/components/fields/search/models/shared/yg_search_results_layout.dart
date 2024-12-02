import 'package:yggdrasil/src/components/fields/search/interfaces/yg_base_search_results_layout.dart';

import 'yg_search_result.dart';

class YgSearchResultsLayout<ResultValue> extends YgBaseSearchResultsLayout<YgSearchResult<ResultValue>> {
  const YgSearchResultsLayout({
    super.leading,
    super.results,
  });
}
