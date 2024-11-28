import 'package:yggdrasil/src/components/fields/search/models/base/yg_base_search_provider.dart';
import 'package:yggdrasil/src/components/fields/search/models/string_search/yg_string_search_result.dart';
import 'package:yggdrasil/src/components/fields/search/models/string_search/yg_string_search_results_layout.dart';

abstract class YgStringSearchProvider
    extends YgBaseSearchProvider<String, String, YgStringSearchResult, YgStringSearchResultsLayout> {
  @override
  YgStringSearchSession<YgStringSearchProvider> createSession();
}

abstract class YgStringSearchSession<Provider extends YgStringSearchProvider>
    extends YgBaseSearchSession<String, String, YgStringSearchResult, YgStringSearchResultsLayout, Provider> {}
