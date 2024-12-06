import 'dart:async';

import 'package:yggdrasil/src/components/fields/search/interfaces/yg_base_search_provider.dart';
import 'package:yggdrasil/yggdrasil.dart';

/// Base class for implementing a advanced search provider.
///
/// Can not be used direct and should be extended instead.
abstract class YgAdvancedSearchProvider<Value, ResultValue>
    extends YgBaseSearchProvider<Value, ResultValue, YgSearchResult<ResultValue>, YgSearchResultsLayout<ResultValue>> {
  @override
  YgAdvancedSearchSession<Value, ResultValue, YgAdvancedSearchProvider<Value, ResultValue>> createSession();
}

/// Base class for implementing a advanced search session.
///
/// Can not be used direct and should be extended instead.
abstract class YgAdvancedSearchSession<Value, ResultValue,
        Provider extends YgAdvancedSearchProvider<Value, ResultValue>>
    extends YgBaseSearchSession<Value, ResultValue, YgSearchResult<ResultValue>, YgSearchResultsLayout<ResultValue>,
        YgAdvancedSearchProvider<Value, ResultValue>> {
  /// Should create the final value and text representation stored in the search
  /// widget.
  FutureOr<YgSearchValueAndText<Value>?> getFinalValueAndText(ResultValue value);

  @override
  YgAdvancedSearchController<Value, ResultValue> get controller =>
      super.controller as YgAdvancedSearchController<Value, ResultValue>;
}
