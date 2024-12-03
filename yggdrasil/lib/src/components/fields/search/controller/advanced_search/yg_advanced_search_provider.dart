import 'dart:async';

import 'package:yggdrasil/src/components/fields/search/interfaces/yg_base_search_provider.dart';
import 'package:yggdrasil/src/components/fields/search/models/advanced_search/_advanced_search.dart';
import 'package:yggdrasil/src/components/fields/search/models/shared/yg_search_result.dart';
import 'package:yggdrasil/src/components/fields/search/models/shared/yg_search_results_layout.dart';

abstract class YgAdvancedSearchProvider<Value, ResultValue>
    extends YgBaseSearchProvider<Value, ResultValue, YgSearchResult<ResultValue>, YgSearchResultsLayout<ResultValue>> {
  @override
  YgAdvancedSearchSession<Value, ResultValue, YgAdvancedSearchProvider<Value, ResultValue>> createSession();
}

abstract class YgAdvancedSearchSession<Value, ResultValue,
        Provider extends YgAdvancedSearchProvider<Value, ResultValue>>
    extends YgBaseSearchSession<Value, ResultValue, YgSearchResult<ResultValue>, YgSearchResultsLayout<ResultValue>,
        YgAdvancedSearchProvider<Value, ResultValue>> {
  FutureOr<YgSearchValueAndText<Value>?> getFinalValueAndText(ResultValue value);
}
