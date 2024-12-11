import 'dart:async';

import 'package:yggdrasil/src/components/fields/search/controller/_controller.dart';
import 'package:yggdrasil/src/components/fields/search/interfaces/yg_base_search_provider.dart';
import 'package:yggdrasil/src/components/fields/search/models/shared/yg_search_result.dart';
import 'package:yggdrasil/src/components/fields/search/models/shared/yg_search_results_layout.dart';

/// Base class for implementing a simple search provider.
///
/// Can not be used direct and should be extended instead.
abstract class YgSimpleSearchProvider<Value>
    extends YgBaseSearchProvider<Value, Value, YgSearchResult<Value>, YgSearchResultsLayout<Value>> {
  const YgSimpleSearchProvider();

  @override
  YgSimpleSearchSession<Value, YgSimpleSearchProvider<Value>> createSession();
}

/// Base class for implementing a simple search session.
///
/// Can not be used direct and should be extended instead.
///
/// !-- IMPORTANT --
/// Error handling should be handled by the user of this interface, the
/// controller will not handle any errors by it self.
abstract class YgSimpleSearchSession<Value, Provider extends YgSimpleSearchProvider<Value>>
    extends YgBaseSearchSession<Value, Value, YgSearchResult<Value>, YgSearchResultsLayout<Value>, Provider> {
  /// Should return a string representing [value].
  ///
  /// !-- IMPORTANT --
  /// Error handling should be handled by the user of this interface, the
  /// controller will not handle any errors by it self.
  FutureOr<String?>? getValueText(Value value);

  @override
  YgSimpleSearchController<Value> get controller => super.controller as YgSimpleSearchController<Value>;
}
