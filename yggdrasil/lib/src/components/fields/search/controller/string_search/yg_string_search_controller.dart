part of '../yg_search_controller_mixin.dart';

/// Controller for string search widgets.
///
/// Is different from simple and advanced search controllers in that it treats
/// the [searchQuery] as the value of the search widget. It also functions as a
/// [TextEditingController] directly.
///
/// The user does not need to select an result for this controller to have a
/// result, however selecting a result will set both the value and the
/// [searchQuery] to the title of that result.
class YgStringSearchController extends TextEditingController
    with
        _YgSearchControllerMixin<
          String,
          TextEditingValue,
          String,
          YgStringSearchResult,
          YgStringSearchResultsLayout,
          YgStringSearchStateMixin<StatefulWidget>
        > {
  YgStringSearchController({
    String? initialValue,
  }) : _lastHandledSearch = initialValue ?? '',
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
    close();
  }

  void _updateResults({bool force = false}) async {
    final YgStringSearchStateMixin<StatefulWidget>? state = _state;
    final YgStringSearchSession<YgStringSearchProvider>? session = _session;
    if ((!force && _lastHandledSearch == text) ||
        session == null ||
        state == null ||
        _resultsFuture != null ||
        !state.isOpen) {
      return;
    }

    _lastHandledSearch = text;
    final FutureOr<YgStringSearchResultsLayout?> results = session.buildResultsLayout(text);

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
    final YgStringSearchStateMixin<StatefulWidget>? state = _state;
    if (state == null || _session != null) {
      return;
    }

    final YgStringSearchProvider provider = state.searchProvider;
    final YgStringSearchSession<YgStringSearchProvider> session = provider.createSession();
    session.attach(this, provider);
    session.initSession();
    _session = session;
    _updateResults(force: true);
  }

  @override
  void endSession({bool force = false}) async {
    _endingSession = true;
    if (_resultsFuture != null && !force) {
      await _resultsFuture;
    }

    final YgStringSearchSession<YgStringSearchProvider>? session = _session;
    if ((!force && !_endingSession) || session == null) {
      // This could happen if startSession was called while we were waiting for
      // results.
      return;
    }

    session.dispose();
    session.detach();
    _session = null;
  }
}
