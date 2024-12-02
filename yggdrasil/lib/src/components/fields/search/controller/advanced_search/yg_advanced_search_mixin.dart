import 'package:flutter/widgets.dart';
import 'package:yggdrasil/src/components/fields/search/models/advanced_search/yg_advanced_search_provider.dart';
import 'package:yggdrasil/src/components/fields/search/models/advanced_search/yg_search_results_layout.dart';
import 'package:yggdrasil/src/components/fields/search/models/shared/yg_search_result.dart';

import '../yg_search_mixin_interface.dart';

mixin YgAdvancedSearchMixin<Value, ResultValue, Widget extends StatefulWidget> on State<Widget>
    implements
        YgSearchMixinInterface<Value, ResultValue, YgSearchResult<ResultValue>, YgSearchResultsLayout<ResultValue>> {
  @override
  YgAdvancedSearchProvider<Value, ResultValue> get searchProvider;
}
