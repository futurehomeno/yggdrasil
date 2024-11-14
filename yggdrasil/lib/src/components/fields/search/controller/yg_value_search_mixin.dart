import 'package:flutter/widgets.dart';
import 'package:yggdrasil/src/components/fields/search/models/value_search/yg_value_search_provider.dart';

import 'yg_search_mixin_interface.dart';

mixin YgValueSearchMixin<T, W extends StatefulWidget> on State<W> implements YgSearchMixinInterface {
  YgValueSearchProvider<T> get searchProvider;
}
