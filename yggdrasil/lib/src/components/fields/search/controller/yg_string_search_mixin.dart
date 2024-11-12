import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:yggdrasil/src/components/fields/search/models/yg_search_result.dart';

import 'yg_search_mixin_interface.dart';

typedef YgStringSearchResultsBuilder = FutureOr<List<YgSearchResult<String>>?> Function(String query);

mixin YgStringSearchMixin<Widget extends StatefulWidget> on State<Widget> implements YgSearchMixinInterface {
  YgStringSearchResultsBuilder get resultsBuilder;
}
