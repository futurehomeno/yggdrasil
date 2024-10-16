import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:yggdrasil/src/components/fields/search/controller/yg_search_controller.dart';

abstract interface class YgSearchWidget<T> implements StatefulWidget {
  YgSearchResultsBuilder<T> get resultsBuilder;

  FutureOr<String?> Function(T value)? get resultTextBuilder;
}
