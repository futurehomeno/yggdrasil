import 'dart:async';

import 'package:yggdrasil/src/components/fields/search/interfaces/yg_base_search_provider.dart';
import 'package:yggdrasil/src/components/fields/search/models/shared/yg_search_result.dart';
import 'package:yggdrasil/src/components/fields/search/models/shared/yg_search_results_layout.dart';

import '../../models/advanced_search/yg_search_value_and_text.dart';

abstract class YgAdvancedSearchProvider<Value, ResultValue>
    extends YgBaseSearchProvider<Value, ResultValue, YgSearchResult<ResultValue>, YgSearchResultsLayout<ResultValue>> {
  @override
  YgAdvancedSearchSession<ResultValue, Value, YgAdvancedSearchProvider<ResultValue, Value>> createSession();
}

abstract class YgAdvancedSearchSession<Value, ResultValue,
        Provider extends YgAdvancedSearchProvider<Value, ResultValue>>
    extends YgBaseSearchSession<Value, ResultValue, YgSearchResult<Value>, YgSearchResultsLayout<Value>, Provider> {
  FutureOr<YgSearchValueAndText<ResultValue>?> getValueFromResultValue(Value value);
}
