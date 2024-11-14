import 'package:flutter/widgets.dart';
import 'package:yggdrasil/src/components/fields/search/models/string_search/yg_string_search_provider.dart';

import 'yg_search_mixin_interface.dart';

mixin YgStringSearchMixin<Widget extends StatefulWidget> on State<Widget> implements YgSearchMixinInterface {
  YgStringSearchProvider get searchProvider;
}
