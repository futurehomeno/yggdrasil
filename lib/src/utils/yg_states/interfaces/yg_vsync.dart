import 'package:flutter/material.dart';

/// Provides [TickerProvider], [BuildContext], and the option to listen for
/// dependency changes on the [context].
abstract interface class YgVsync implements TickerProvider {
  /// Add [callback] for dependency changes on [context].
  void addDependenciesChangedListener(VoidCallback callback);

  /// remove [callback] for dependency changes on [context].
  void removeDependenciesChangedListener(VoidCallback callback);

  /// A BuildContext.
  BuildContext get context;
}
