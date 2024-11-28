import 'dart:async';

import 'package:yggdrasil/src/components/fields/search/models/advanced_search/yg_search_result.dart';
import 'package:yggdrasil/src/components/fields/search/models/advanced_search/yg_search_results_layout.dart';
import 'package:yggdrasil/src/components/fields/search/models/base/yg_base_search_provider.dart';

import 'yg_search_value_and_text.dart';

abstract class YgSearchProvider<Value, ResultValue>
    extends YgBaseSearchProvider<Value, ResultValue, YgSearchResult<ResultValue>, YgSearchResultsLayout<ResultValue>> {
  @override
  YgSearchSession<ResultValue, Value, YgSearchProvider<ResultValue, Value>> createSession();
}

abstract class YgSearchSession<Value, ResultValue, Provider extends YgSearchProvider<Value, ResultValue>>
    extends YgBaseSearchSession<Value, ResultValue, YgSearchResult<Value>, YgSearchResultsLayout<Value>, Provider> {
  FutureOr<YgSearchValueAndText<ResultValue>?> getValueFromResultValue(Value value);
}
