part of '../yg_search_controller_mixin.dart';

class YgValueSearchController<Value>
    with
        ChangeNotifier,
        YgSearchControllerMixin<Value, Value?, YgSearchResult<Value>, YgValueSearchMixin<Value, StatefulWidget>> {
  YgValueSearchController({
    Value? initialValue,
  })  : _textEditingController = TextEditingController(),
        _value = initialValue {
    _textEditingController.addListener(_updateResults);
  }

  YgValueSearchController.fromValue({
    TextEditingValue? textValue,
    Value? value,
    List<YgSearchResult<Value>>? results,
  })  : _textEditingController = TextEditingController.fromValue(textValue),
        _value = value,
        _results = results,
        _valueText = textValue?.text ?? '';

  final TextEditingController _textEditingController;

  String _lastHandledSearch = '';

  Value? _value;

  @override
  Value? get value => _value;

  set value(Value? newValue) {
    if (_value == newValue) {
      return;
    }
    _value = newValue;

    if (newValue == null) {
      _value = null;
      _valueText = '';
      notifyListeners();

      return;
    }

    if (_session == null) {
      startSession();
    }
    _updateResultText(newValue);
    if (_state?.isOpen != true) {
      endSession();
    }
  }

  String _valueText = '';

  @override
  List<YgSearchResult<Value>> get results => _results ?? <YgSearchResult<Value>>[];
  List<YgSearchResult<Value>>? _results;
  Future<void>? _resultsFuture;
  Future<void>? _resultTextFuture;

  YgSearchSession<Value, YgSearchProvider<Value>>? _session;
  bool _endingSession = false;

  @override
  bool get loading => _resultsFuture != null || _resultTextFuture != null;

  void _updateResults({bool force = false}) async {
    final YgValueSearchMixin<Value, StatefulWidget>? state = _state;
    final String text = textEditingController.text;
    final YgSearchSession<Value, YgSearchProvider<Value>>? session = _session;
    if ((!force && _lastHandledSearch == text) ||
        session == null ||
        state == null ||
        _resultsFuture != null ||
        !state.isOpen) {
      return;
    }

    _lastHandledSearch = text;
    final FutureOr<List<YgSearchResult<Value>>?> results = session.buildResults(text);
    if (results is List<YgSearchResult<Value>>?) {
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

  void _updateResultText(Value value) async {
    final YgSearchSession<Value, YgSearchProvider<Value>>? session = _session;
    if (session == null) {
      return;
    }

    final FutureOr<String?>? result = session.buildResultText(value);
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
  void onResultTapped(Value result) {
    if (_value != result) {
      _value = result;
      _updateResultText(result);
      close();
      notifyListeners();
    }
  }

  @override
  void clear() {
    if (value != null) {
      _value = null;
      _valueText = '';
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
  void attach(YgValueSearchMixin<Value, StatefulWidget> state) {
    super.attach(state);
    final Value? value = _value;
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

    final YgSearchSession<Value, YgSearchProvider<Value>>? session = _session;
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
    final YgValueSearchMixin<Value, StatefulWidget>? state = _state;
    if (state == null || _session != null) {
      return;
    }

    final YgSearchProvider<Value> provider = state.searchProvider;
    final YgSearchSession<Value, YgSearchProvider<Value>> session = provider.createSession();
    session.attach(this, provider);
    session.initSession();
    _session = session;
  }
}
