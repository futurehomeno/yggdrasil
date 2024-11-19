import 'dart:async';

import 'package:yggdrasil/src/components/fields/search/models/value_search/yg_search_result.dart';
import 'package:yggdrasil/src/components/fields/search/models/yg_base_search_provider.dart';

abstract class YgSearchProvider<Value> extends YgBaseSearchProvider<Value, YgSearchResult<Value>> {
  @override
  YgSearchSession<Value, YgSearchProvider<Value>> createSession();
}

abstract class YgSearchSession<Value, Provider extends YgSearchProvider<Value>>
    extends YgBaseSearchSession<Value, YgSearchResult<Value>, Provider> {
  FutureOr<String?> buildResultText(Value value);
}
