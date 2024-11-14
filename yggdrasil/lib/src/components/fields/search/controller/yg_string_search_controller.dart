part of 'yg_search_controller_mixin.dart';

class YgStringSearchController extends TextEditingController
    with YgSearchControllerMixin<String, TextEditingValue, YgStringSearchMixin<StatefulWidget>> {
  YgStringSearchController({
    String? initialValue,
  })  : _lastHandledSearch = initialValue ?? '',
        super(text: initialValue);

  @override
  TextEditingController get textEditingController => this;
  String _lastHandledSearch;
  bool _loadingResults = false;

  @override
  List<YgStringSearchResult> get results => _results ?? const <YgStringSearchResult>[];
  List<YgStringSearchResult>? _results;

  @override
  void notifyListeners() {
    _updateResults();
    super.notifyListeners();
    _state?.onChanged();
  }

  @override
  void onResultTapped(String result) {
    _lastHandledSearch = result;
    text = result;
  }

  @override
  bool get loading => _loadingResults;

  @override
  bool get hasValue => text.isNotEmpty;

  void _updateResults({bool force = false}) async {
    final YgStringSearchMixin<StatefulWidget>? state = _state;
    if (state == null || _loadingResults || !state.isOpen) {
      return;
    }

    if (!force && _lastHandledSearch == text) {
      return;
    }

    _loadingResults = true;
    _lastHandledSearch = text;
    notifyListeners();
    _results = await state.searchProvider.buildResults(text);
    _loadingResults = false;
    notifyListeners();

    // Call this again in case value has changed in the meantime.
    _updateResults();
  }

  @override
  String get valueText => text;
}
