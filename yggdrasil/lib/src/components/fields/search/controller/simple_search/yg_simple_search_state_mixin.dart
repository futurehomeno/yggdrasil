import 'package:flutter/widgets.dart';
import 'package:yggdrasil/src/components/fields/search/controller/yg_search_state_mixin_interface.dart';
import 'package:yggdrasil/src/components/fields/search/models/shared/yg_search_result.dart';
import 'package:yggdrasil/src/components/fields/search/models/shared/yg_search_results_layout.dart';

import 'yg_simple_search_provider.dart';

mixin YgSimpleSearchStateMixin<Value, Widget extends StatefulWidget> on State<Widget>
    implements YgSearchStateMixinInterface<Value, Value, YgSearchResult<Value>, YgSearchResultsLayout<Value>> {
  @override
  YgSimpleSearchProvider<Value> get searchProvider;
}
