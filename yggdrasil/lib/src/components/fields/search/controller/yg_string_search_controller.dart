part of 'yg_search_controller.dart';

class YgStringSearchController extends TextEditingController
    with YgSearchController<String, TextEditingValue, YgStringSearchMixin<StatefulWidget>> {
  YgStringSearchController({
    String? initialQuery,
  })  : _lastHandledSearch = initialQuery ?? '',
        super(text: initialQuery);

  @override
  TextEditingController get textEditingController => this;
  String _lastHandledSearch;
  bool _loadingResults = false;

  @override
  List<YgSearchResult<String>> get results => _results ?? const <YgSearchResult<String>>[];
  List<YgSearchResult<String>>? _results;

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
    _results = await state.resultsBuilder(text);
    _loadingResults = false;
    notifyListeners();

    // Call this again in case value has changed in the meantime.
    _updateResults();
  }
}
