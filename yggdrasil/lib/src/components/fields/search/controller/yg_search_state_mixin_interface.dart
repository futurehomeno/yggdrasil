import 'package:yggdrasil/src/components/fields/search/interfaces/yg_base_search_provider.dart';
import 'package:yggdrasil/src/components/fields/search/interfaces/yg_base_search_result.dart';
import 'package:yggdrasil/src/components/fields/search/interfaces/yg_base_search_results_layout.dart';

abstract interface class YgSearchStateMixinInterface<Value, ResultValue, Result extends YgBaseSearchResult,
    ResultsLayout extends YgBaseSearchResultsLayout<Result>> {
  void onChanged();

  void open();

  void openMenu();

  void openScreen();

  void close();

  bool get isOpen;

  YgBaseSearchProvider<Value, ResultValue, Result, ResultsLayout> get searchProvider;
}
