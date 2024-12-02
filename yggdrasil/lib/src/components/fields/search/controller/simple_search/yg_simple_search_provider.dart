import 'dart:async';

import 'package:yggdrasil/src/components/fields/search/interfaces/yg_base_search_provider.dart';
import 'package:yggdrasil/src/components/fields/search/models/shared/yg_search_result.dart';
import 'package:yggdrasil/src/components/fields/search/models/shared/yg_search_results_layout.dart';

abstract class YgSimpleSearchProvider<Value>
    extends YgBaseSearchProvider<Value, Value, YgSearchResult<Value>, YgSearchResultsLayout<Value>> {
  @override
  YgSimpleSearchSession<Value, YgSimpleSearchProvider<Value>> createSession();
}

abstract class YgSimpleSearchSession<Value, Provider extends YgSimpleSearchProvider<Value>>
    extends YgBaseSearchSession<Value, Value, YgSearchResult<Value>, YgSearchResultsLayout<Value>, Provider> {
  FutureOr<String?>? getValueText(Value value);
}
