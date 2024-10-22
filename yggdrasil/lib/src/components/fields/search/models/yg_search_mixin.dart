import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:yggdrasil/src/components/fields/search/controller/yg_search_controller.dart';

mixin YgSearchMixin<T, S extends StatefulWidget> on State<S> {
  YgSearchResultsBuilder<T> get resultsBuilder;

  FutureOr<String?> Function(T value)? get resultTextBuilder;

  void open();

  void openMenu();

  void openScreen();

  void close();

  bool get isOpen;
}
