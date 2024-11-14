part of 'yg_search_controller_mixin.dart';

class YgValueSearchController<T>
    with ChangeNotifier, YgSearchControllerMixin<T, T?, YgValueSearchMixin<T, StatefulWidget>> {
  YgValueSearchController({
    T? initialValue,
  })  : _textEditingController = TextEditingController(),
        _value = initialValue {
    _textEditingController.addListener(_updateResults);
  }

  final TextEditingController _textEditingController;

  String _lastHandledSearch = '';

  @override
  T? get value => _value;
  T? _value;
  String _valueText = '';

  @override
  List<YgSearchResult<T>> get results => _results ?? <YgSearchResult<T>>[];
  List<YgSearchResult<T>>? _results;

  @override
  bool get loading => _loadingResultText || _loadingResults;
  bool _loadingResults = false;
  bool _loadingResultText = false;

  void _updateResults({bool force = false}) async {
    final YgValueSearchMixin<T, StatefulWidget>? state = _state;
    final String text = textEditingController.text;
    if ((!force && _lastHandledSearch == text) || state == null || _loadingResults || !state.isOpen) {
      return;
    }

    _lastHandledSearch = text;
    _updateLoadingResults(true);
    _results = await state.searchProvider.buildResults(text);
    _updateLoadingResults(false);

    // Call this again in case value has changed in the meantime.
    _updateResults();
  }

  void _updateLoadingResultText(bool value) {
    final bool wasLoading = _loadingResults || _loadingResultText;
    final bool newLoading = _loadingResults || value;
    _loadingResultText = value;
    if (newLoading != wasLoading) {
      notifyListeners();
    }
  }

  void _updateLoadingResults(bool value) {
    final bool wasLoading = _loadingResults || _loadingResultText;
    final bool newLoading = value || _loadingResultText;
    _loadingResults = value;
    if (newLoading != wasLoading) {
      notifyListeners();
    }
  }

  void _updateResultText(T value, {bool init = false}) async {
    final FutureOr<String?>? result = _state?.searchProvider.buildResultText(value);
    final String? text;
    if (result is Future<String?>) {
      _updateLoadingResultText(true);
      text = await result;
      _updateLoadingResultText(false);
    } else {
      text = result;
    }

    if (!init) {
      close();
    }

    if (text == null) {
      _valueText = _textEditingController.text;
    } else {
      _lastHandledSearch = text;
      textEditingController.text = text;
      _valueText = text;
    }

    notifyListeners();
  }

  @override
  void onResultTapped(T result) {
    if (_value != result) {
      _value = result;
      _updateResultText(result);
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
  void attach(YgValueSearchMixin<T, StatefulWidget> state) {
    super.attach(state);
    final T? value = _value;
    if (value != null) {
      _updateResultText(value, init: true);
    }
  }

  @override
  TextEditingController get textEditingController => _textEditingController;

  @override
  bool get hasValue => _value != null;

  @override
  String get valueText => _valueText;
}
