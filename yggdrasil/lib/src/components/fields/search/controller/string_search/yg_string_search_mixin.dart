import 'package:flutter/widgets.dart';
import 'package:yggdrasil/src/components/fields/search/controller/string_search/yg_string_search_provider.dart';
import 'package:yggdrasil/src/components/fields/search/models/string_search/yg_string_search_result.dart';
import 'package:yggdrasil/src/components/fields/search/models/string_search/yg_string_search_results_layout.dart';

import '../yg_search_mixin_interface.dart';

/// Internal mixin class used for string search variants of widgets.
mixin YgStringSearchMixin<Widget extends StatefulWidget> on State<Widget>
    implements YgSearchMixinInterface<String, String, YgStringSearchResult, YgStringSearchResultsLayout> {
  @override
  YgStringSearchProvider get searchProvider;
}
