import 'package:yggdrasil/src/components/fields/search/models/string_search/yg_string_search_result.dart';
import 'package:yggdrasil/src/components/fields/search/models/yg_base_search_provider.dart';

abstract class YgStringSearchProvider extends YgBaseSearchProvider<String, YgStringSearchResult> {
  @override
  YgStringSearchSession<YgStringSearchProvider> createSession();
}

abstract class YgStringSearchSession<Provider extends YgStringSearchProvider>
    extends YgBaseSearchSession<String, YgStringSearchResult, Provider> {}
