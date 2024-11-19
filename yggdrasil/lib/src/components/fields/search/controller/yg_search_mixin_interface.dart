import 'package:yggdrasil/src/components/fields/search/models/string_search/yg_string_search_result.dart';
import 'package:yggdrasil/src/components/fields/search/models/yg_base_search_provider.dart';

abstract interface class YgSearchMixinInterface<Value, Result extends YgStringSearchResult> {
  void onChanged();

  void open();

  void openMenu();

  void openScreen();

  void close();

  bool get isOpen;

  YgBaseSearchProvider<Value, Result> get searchProvider;
}
