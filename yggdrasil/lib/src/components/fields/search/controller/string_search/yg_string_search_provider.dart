import 'package:yggdrasil/src/components/fields/search/controller/_controller.dart';
import 'package:yggdrasil/src/components/fields/search/interfaces/yg_base_search_provider.dart';
import 'package:yggdrasil/src/components/fields/search/models/string_search/yg_string_search_result.dart';
import 'package:yggdrasil/src/components/fields/search/models/string_search/yg_string_search_results_layout.dart';

/// Base class for implementing a string search provider.
///
/// Can not be used direct and should be extended instead.
abstract class YgStringSearchProvider
    extends YgBaseSearchProvider<String, String, YgStringSearchResult, YgStringSearchResultsLayout> {
  @override
  YgStringSearchSession<YgStringSearchProvider> createSession();
}

/// Base class for implementing a string search session.
///
/// Can not be used direct and should be extended instead.
abstract class YgStringSearchSession<Provider extends YgStringSearchProvider>
    extends YgBaseSearchSession<String, String, YgStringSearchResult, YgStringSearchResultsLayout, Provider> {
  @override
  YgStringSearchController get controller => super.controller as YgStringSearchController;
}
