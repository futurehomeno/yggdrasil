part of '../yg_search_controller_mixin.dart';

class YgStringSearchController extends TextEditingController
    with
        _YgSearchControllerMixin<String, TextEditingValue, String, YgStringSearchResult, YgStringSearchResultsLayout,
            YgStringSearchMixin<StatefulWidget>> {
  YgStringSearchController({
    String? initialValue,
  })  : _lastHandledSearch = initialValue ?? '',
        super(text: initialValue);

  YgStringSearchSession<YgStringSearchProvider>? _session;
  String _lastHandledSearch;
  bool _endingSession = false;

  @override
  String get valueText => text;

  @override
  bool get hasValue => text.isNotEmpty;

  @override
  TextEditingController get textEditingController => this;

  @override
  YgStringSearchResultsLayout get results => _results ?? const YgStringSearchResultsLayout();
  YgStringSearchResultsLayout? _results;

  @override
  bool get loading => _resultsFuture != null;
  Future<YgStringSearchResultsLayout?>? _resultsFuture;

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

  void _updateResults({bool force = false}) async {
    final YgStringSearchMixin<StatefulWidget>? state = _state;
    final YgStringSearchSession<YgStringSearchProvider>? session = _session;
    if ((!force && _lastHandledSearch == text) ||
        session == null ||
        state == null ||
        _resultsFuture != null ||
        !state.isOpen) {
      return;
    }

    _lastHandledSearch = text;
    final FutureOr<YgStringSearchResultsLayout?> results = session.buildResults(text);

    if (results is YgStringSearchResultsLayout?) {
      _results = results;
      notifyListeners();
    } else {
      _resultsFuture = results;
      notifyListeners();
      _results = await results;
      _resultsFuture = null;
      notifyListeners();
    }

    // Call this again in case value has changed in the meantime.
    _updateResults();
  }

  @override
  void startSession() {
    _endingSession = false;
    final YgStringSearchMixin<StatefulWidget>? state = _state;
    if (state == null || _session != null) {
      return;
    }

    final YgStringSearchProvider provider = state.searchProvider;
    final YgStringSearchSession<YgStringSearchProvider> session = provider.createSession();
    session.attach(this, provider);
    session.initSession();
    _session = session;
  }

  @override
  void endSession({bool force = false}) async {
    _endingSession = true;
    if (_resultsFuture != null && !force) {
      await _resultsFuture;
    }

    final YgStringSearchSession<YgStringSearchProvider>? session = _session;
    if ((!force && !_endingSession) || session == null) {
      // This could happen is startSession was called while we were waiting for
      // results.
      return;
    }

    session.dispose();
    session.detach();
    _session = null;
  }
}
