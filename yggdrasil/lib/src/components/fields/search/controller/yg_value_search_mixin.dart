import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:yggdrasil/src/components/fields/search/models/yg_search_result.dart';

import 'yg_search_mixin_interface.dart';

typedef YgValueSearchResultsBuilder<Value> = FutureOr<List<YgSearchResult<Value>>?> Function(String query);
typedef YgValueSearchResultTextBuilder<Value> = FutureOr<String?> Function(Value value);

mixin YgValueSearchMixin<Value, Widget extends StatefulWidget> on State<Widget> implements YgSearchMixinInterface {
  YgValueSearchResultsBuilder<Value> get resultsBuilder;
  YgValueSearchResultTextBuilder<Value> get resultTextBuilder;
}
