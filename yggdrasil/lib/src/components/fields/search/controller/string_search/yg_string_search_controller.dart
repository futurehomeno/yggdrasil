part of '../yg_search_controller_mixin.dart';

class YgStringSearchController extends TextEditingController
    with YgSearchControllerMixin<String, TextEditingValue, YgStringSearchResult, YgStringSearchMixin<StatefulWidget>> {
  YgStringSearchController({
    String? initialValue,
  })  : _lastHandledSearch = initialValue ?? '',
        super(text: initialValue);

  @override
  TextEditingController get textEditingController => this;
  String _lastHandledSearch;

  @override
  List<YgStringSearchResult> get results => _results ?? const <YgStringSearchResult>[];
  List<YgStringSearchResult>? _results;
  Future<List<YgStringSearchResult>?>? _resultsFuture;

  YgStringSearchSession<YgStringSearchProvider>? _session;
  bool _endingSession = false;

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
  bool get loading => _resultsFuture != null;

  @override
  bool get hasValue => text.isNotEmpty;

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
    final FutureOr<List<YgStringSearchResult>?> results = session.buildResults(text);

    if (results is List<YgStringSearchResult>?) {
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
  String get valueText => text;

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
}
