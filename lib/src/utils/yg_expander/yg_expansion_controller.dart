part of 'yg_expander.dart';

class YgExpansionController extends ChangeNotifier {
  YgExpansionController({
    bool initiallyExpanded = false,
  }) : _expanded = initiallyExpanded;

  bool _expanded;
  bool get expanded => _expanded;
  set expanded(bool newValue) => _update(newValue);

  void toggle() {
    _expanded ^= true;
    notifyListeners();
  }

  bool expand() => _update(true);

  bool collapse() => _update(false);

  bool _update(bool newValue) {
    final bool shouldUpdate = _expanded != newValue;

    if (shouldUpdate) {
      _expanded = newValue;
      notifyListeners();
    }

    return shouldUpdate;
  }

  static YgExpansionController of(BuildContext context) {
    final _YgExpanderState? result = context.findAncestorStateOfType<_YgExpanderState>();
    if (result != null) {
      return result._controller;
    }

    throw Exception(
      'YgExpansionController.of() called with a context that does not contain a YgExpander or widget which uses it.',
    );
  }
}
