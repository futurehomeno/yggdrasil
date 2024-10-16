import 'package:flutter/widgets.dart';

import 'yg_search_widget.dart';

abstract interface class YgSearchState<T extends YgSearchWidget<Object?>> implements State<T> {
  void open();

  void openMenu();

  void openScreen();

  void close();

  bool get isOpen;
}
