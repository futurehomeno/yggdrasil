import 'dart:async';

import 'package:yggdrasil/src/components/fields/search/models/value_search/yg_search_result.dart';
import 'package:yggdrasil/src/components/fields/search/models/yg_base_search_provider.dart';

abstract class YgSearchProvider<Value, ResultValue> extends YgBaseSearchProvider<Value, YgSearchResult<Value>> {
  @override
  YgSearchSession<Value, ResultValue, YgSearchProvider<Value, ResultValue>> createSession();
}

abstract class YgSearchSession<Value, ResultValue, Provider extends YgSearchProvider<Value, ResultValue>>
    extends YgBaseSearchSession<Value, YgSearchResult<Value>, Provider> {
  FutureOr<YgSearchResultValue<ResultValue>?> buildSelectedResult(Value value);
}

class YgSearchResultValue<T> {
  const YgSearchResultValue({
    required this.value,
    this.resultText,
  });

  final String? resultText;
  final T value;
}
