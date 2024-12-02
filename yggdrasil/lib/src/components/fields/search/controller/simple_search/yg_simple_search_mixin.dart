import 'package:flutter/widgets.dart';
import 'package:yggdrasil/src/components/fields/search/controller/yg_search_mixin_interface.dart';
import 'package:yggdrasil/src/components/fields/search/models/advanced_search/yg_search_results_layout.dart';
import 'package:yggdrasil/src/components/fields/search/models/shared/yg_search_result.dart';
import 'package:yggdrasil/src/components/fields/search/models/simple_search/_simple_search.dart';

mixin YgSimpleSearchMixin<Widget extends StatefulWidget, Value> on State<Widget>
    implements YgSearchMixinInterface<Value, Value, YgSearchResult<Value>, YgSearchResultsLayout<Value>> {
  @override
  YgSimpleSearchProvider<Value> get searchProvider;
}
