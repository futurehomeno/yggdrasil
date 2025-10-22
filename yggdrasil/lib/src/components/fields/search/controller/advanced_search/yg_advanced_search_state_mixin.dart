import 'package:flutter/widgets.dart';
import 'package:yggdrasil/src/components/fields/search/controller/advanced_search/yg_advanced_search_provider.dart';
import 'package:yggdrasil/src/components/fields/search/controller/yg_search_state_mixin_interface.dart';
import 'package:yggdrasil/src/components/fields/search/models/shared/yg_search_result.dart';
import 'package:yggdrasil/src/components/fields/search/models/shared/yg_search_results_layout.dart';

/// Internal mixin class used for advances search variants of widgets.
mixin YgAdvancedSearchStateMixin<Value, ResultValue, Widget extends StatefulWidget> on State<Widget>
    implements
        YgSearchStateMixinInterface<
          Value,
          ResultValue,
          YgSearchResult<ResultValue>,
          YgSearchResultsLayout<ResultValue>
        > {
  @override
  YgAdvancedSearchProvider<Value, ResultValue> get searchProvider;
}
