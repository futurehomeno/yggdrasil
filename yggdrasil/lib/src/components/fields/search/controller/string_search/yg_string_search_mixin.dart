import 'package:flutter/widgets.dart';
import 'package:yggdrasil/src/components/fields/search/models/string_search/yg_string_search_provider.dart';
import 'package:yggdrasil/src/components/fields/search/models/string_search/yg_string_search_result.dart';
import 'package:yggdrasil/src/components/fields/search/models/string_search/yg_string_search_results_layout.dart';

import '../yg_search_mixin_interface.dart';

mixin YgStringSearchMixin<Widget extends StatefulWidget> on State<Widget>
    implements YgSearchMixinInterface<String, String, YgStringSearchResult, YgStringSearchResultsLayout> {
  @override
  YgStringSearchProvider get searchProvider;
}
