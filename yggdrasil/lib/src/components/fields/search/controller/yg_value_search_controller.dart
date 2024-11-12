part of 'yg_search_controller_mixin.dart';

class YgValueSearchController<T>
    with ChangeNotifier, YgSearchControllerMixin<T, T?, YgValueSearchMixin<T, StatefulWidget>> {
  YgValueSearchController({
    String? initialQuery,
    T? initialValue,
  })  : _textEditingController = TextEditingController(text: initialQuery),
        _value = initialValue,
        _lastHandledSearch = initialQuery ?? '' {
    _textEditingController.addListener(_updateResults);
  }

  final TextEditingController _textEditingController;

  String _lastHandledSearch;

  @override
  T? get value => _value;
  T? _value;

  @override
  List<YgSearchResult<T>> get results => _results ?? <YgSearchResult<T>>[];
  List<YgSearchResult<T>>? _results;

  @override
  bool get loading => _loadingResultText || _loadingResults;
  bool _loadingResults = false;
  final bool _loadingResultText = false;

  void _updateResults({bool force = false}) async {
    final YgValueSearchMixin<T, StatefulWidget>? state = _state;
    if (state == null || _loadingResults || !state.isOpen) {
      return;
    }

    final String text = textEditingController.text;
    if (!force && _lastHandledSearch == text) {
      return;
    }

    _loadingResults = true;
    _lastHandledSearch = text;
    notifyListeners();
    _results = await state.resultsBuilder(text);
    _loadingResults = false;
    notifyListeners();

    // Call this again in case value has changed in the meantime.
    _updateResults();
  }

  @override
  void onResultTapped(T? result) {
    if (_value != result) {
      _value = result;
      notifyListeners();
    }
  }

  @override
  void clear() {
    if (value != null) {
      _value = null;
      _textEditingController.clear();
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  TextEditingController get textEditingController => _textEditingController;

  @override
  bool get hasValue => _value != null;
}
