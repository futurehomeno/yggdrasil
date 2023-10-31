import 'package:flutter/material.dart';

abstract interface class YgVsync implements TickerProvider {
  void addDependenciesChangedListener(VoidCallback callback);
  void removeDependenciesChangedListener(VoidCallback callback);
  BuildContext get context;
}
