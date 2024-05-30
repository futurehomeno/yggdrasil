import 'package:flutter/widgets.dart';

import 'yg_expander_default_controller_inherited_widget.dart';

/// Controls a [YgExpander].
class YgExpansionController extends ChangeNotifier {
  YgExpansionController({
    bool initiallyExpanded = false,
  }) : _expanded = initiallyExpanded;

  bool _expanded;

  /// Whether the widget controller by this controller should be expanded.
  bool get expanded => _expanded;
  set expanded(bool newValue) => _update(newValue);

  /// Toggles the [expanded] state.
  void toggle() {
    _expanded ^= true;
    notifyListeners();
  }

  /// Changes [expanded] to true.
  ///
  /// Returns true if [expanded] wasn't already set to true.
  bool expand() => _update(true);

  /// Changes [expanded] to false.
  ///
  /// Returns true if [expanded] wasn't already set to false.
  bool collapse() => _update(false);

  /// Gets an instance of [YgExpansionController] from context.
  ///
  /// Use this only within a child of [YgExpander].
  static YgExpansionController of(BuildContext context) {
    final YgExpanderDefaultControllerInheritedWidget? result =
        context.dependOnInheritedWidgetOfExactType<YgExpanderDefaultControllerInheritedWidget>();

    if (result != null) {
      return result.controller;
    }

    throw Exception(
      'YgExpansionController.of() called with a context that does not contain a YgExpander or widget which uses it.',
    );
  }

  static YgExpansionController? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<YgExpanderDefaultControllerInheritedWidget>()?.controller;
  }

  bool _update(bool newValue) {
    final bool shouldUpdate = _expanded != newValue;

    if (shouldUpdate) {
      _expanded = newValue;
      notifyListeners();
    }

    return shouldUpdate;
  }
}
