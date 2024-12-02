part of '../yg_search_controller_mixin.dart';

typedef _Session<ResultValue, Value>
    = YgAdvancedSearchSession<ResultValue, Value, YgAdvancedSearchProvider<ResultValue, Value>>;
typedef _SearchMixin<ResultValue, Value> = YgAdvancedSearchMixin<ResultValue, Value, StatefulWidget>;

class YgAdvancedSearchController<ResultValue, Value>
    with
        ChangeNotifier,
        _YgSearchControllerMixin<ResultValue, YgSearchValueAndText<Value>?, Value, YgSearchResult<ResultValue>,
            YgSearchResultsLayout<ResultValue>, YgAdvancedSearchMixin<ResultValue, Value, StatefulWidget>> {
  YgAdvancedSearchController({
    YgSearchValueAndText<Value>? initialValue,
  })  : _textEditingController = TextEditingController(),
        _value = initialValue {
    _textEditingController.addListener(_updateResults);
  }

  final TextEditingController _textEditingController;

  String _lastHandledSearch = '';

  YgSearchValueAndText<Value>? _value;

  @override
  YgSearchValueAndText<Value>? get value => _value;

  String _valueText = '';

  @override
  YgSearchResultsLayout<ResultValue> get results => _results ?? YgSearchResultsLayout<ResultValue>();
  YgSearchResultsLayout<ResultValue>? _results;
  Future<void>? _resultsFuture;
  Future<void>? _resultTextFuture;

  _Session<ResultValue, Value>? _session;
  bool _endingSession = false;

  @override
  bool get loading => _resultsFuture != null || _resultTextFuture != null;

  void _updateResults({bool force = false}) async {
    final _SearchMixin<ResultValue, Value>? state = _state;
    final String text = textEditingController.text;
    final _Session<ResultValue, Value>? session = _session;
    if ((!force && _lastHandledSearch == text) ||
        session == null ||
        state == null ||
        _resultsFuture != null ||
        !state.isOpen) {
      return;
    }

    _lastHandledSearch = text;
    final FutureOr<List<YgSearchResult<ResultValue>>?> results = session.buildResults(text);
    if (results is List<YgSearchResult<ResultValue>>?) {
      _results = results;
      notifyListeners();
    } else {
      _updateResultsFuture(results);
      _results = await results;
      _updateResultsFuture(null);
    }

    // Call this again in case value has changed in the meantime.
    _updateResults();
  }

  void _updateResultTextFuture(Future<void>? value) {
    final bool wasLoading = _resultsFuture != null || _resultTextFuture != null;
    final bool newLoading = _resultsFuture != null || value != null;
    _resultsFuture = value;
    if (newLoading != wasLoading) {
      notifyListeners();
    }
  }

  void _updateResultsFuture(Future<void>? value) {
    final bool wasLoading = _resultsFuture != null || _resultTextFuture != null;
    final bool newLoading = value != null || _resultTextFuture != null;
    _resultsFuture = value;
    if (newLoading != wasLoading) {
      notifyListeners();
    }
  }

  void _updateResultText(ResultValue value) async {
    final _Session<ResultValue, Value>? session = _session;
    if (session == null) {
      return;
    }

    final FutureOr<String?>? result = session.getValueFromResultValue(value);
    final String? text;
    if (result is Future<String?>) {
      _updateResultTextFuture(result);
      text = await result;
      _updateResultTextFuture(null);
    } else {
      text = result;
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
  void onResultTapped(ResultValue result) {
    if (_value != result) {
      _value = result;
      _updateResultText(result);
      _state?.onChanged();
      notifyListeners();
    }

    close();
  }

  @override
  void clear() {
    if (value != null) {
      _value = null;
      _valueText = '';
      _textEditingController.clear();
      _state?.onChanged();
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  void attach(_SearchMixin<ResultValue, Value> state) {
    super.attach(state);
    final ResultValue? value = _value;
    if (value != null) {
      _updateResultText(value);
    }
  }

  @override
  TextEditingController get textEditingController => _textEditingController;

  @override
  bool get hasValue => _value != null;

  @override
  String get valueText => _valueText;

  @override
  void endSession({bool force = false}) async {
    _endingSession = true;
    final Future<void>? resultsFuture = _resultsFuture;
    final Future<void>? resultTextFuture = _resultTextFuture;
    if (!force && (resultsFuture != null || resultTextFuture != null)) {
      await resultsFuture;
      await resultTextFuture;
    }

    final _SearchMixin<ResultValue, Value>? session = _session;
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
    final _SearchMixin<ResultValue, Value>? state = _state;
    if (state == null || _session != null) {
      return;
    }

    final YgAdvancedSearchProvider<ResultValue, Value> provider = state.searchProvider;
    final _SearchMixin<ResultValue, Value> session = provider.createSession();
    session.attach(this, provider);
    session.initSession();
    _session = session;
  }
}
