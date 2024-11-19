import 'package:flutter/widgets.dart';
import 'package:yggdrasil/src/components/fields/search/models/value_search/yg_search_provider.dart';
import 'package:yggdrasil/src/components/fields/search/models/value_search/yg_search_result.dart';

import 'yg_search_mixin_interface.dart';

mixin YgValueSearchMixin<T, W extends StatefulWidget> on State<W>
    implements YgSearchMixinInterface<T, YgSearchResult<T>> {
  @override
  YgSearchProvider<T> get searchProvider;
}
