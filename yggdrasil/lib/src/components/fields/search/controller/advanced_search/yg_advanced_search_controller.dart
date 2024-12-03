part of '../yg_search_controller_mixin.dart';

typedef _AdvancedSession<Value, ResultValue>
    = YgAdvancedSearchSession<Value, ResultValue, YgAdvancedSearchProvider<Value, ResultValue>>;
typedef _AdvancedState<Value, ResultValue> = YgAdvancedSearchMixin<Value, ResultValue, StatefulWidget>;

class YgAdvancedSearchController<Value, ResultValue>
    with
        ChangeNotifier,
        _YgSearchControllerMixin<Value, Value?, ResultValue, YgSearchResult<ResultValue>,
            YgSearchResultsLayout<ResultValue>, YgAdvancedSearchMixin<Value, ResultValue, StatefulWidget>> {
  YgAdvancedSearchController({
    YgSearchValueAndText<Value>? initialValue,
  })  : _textEditingController = TextEditingController(),
        _value = initialValue?.value,
        _valueText = initialValue?.text {
    _textEditingController.addListener(_updateResults);
  }

  _AdvancedSession<Value, ResultValue>? _session;
  bool _endingSession = false;
  String _lastHandledSearch = '';
  Future<void>? _resultsFuture;
  Future<void>? _valueAndTextFuture;

  @override
  bool get loading => _loading;
  bool _loading = false;

  @override
  TextEditingController get textEditingController => _textEditingController;
  final TextEditingController _textEditingController;

  @override
  YgSearchResultsLayout<ResultValue> get results => _results ?? YgSearchResultsLayout<ResultValue>();
  YgSearchResultsLayout<ResultValue>? _results;

  @override
  bool get hasValue => _value != null;

  @override
  String get valueText => _valueText ?? '';
  String? _valueText;

  @override
  Value? get value => _value;
  Value? _value;

  void updateValue({
    required Value value,
    required String text,
  }) {
    if (text != _valueText || value != _value) {
      _value = value;
      _valueText = text;
      _lastHandledSearch = text;
      _textEditingController.text = text;
      notifyListeners();
    }
  }

  @override
  void clear() {
    _textEditingController.clear();
    if (_value != null) {
      _value = null;
      notifyListeners();
    }
  }

  void _updateLoading({bool forceNotify = false}) {
    final bool wasLoading = _loading;
    final bool isLoading = _resultsFuture != null || _valueAndTextFuture != null;
    _loading = isLoading;

    if (forceNotify || wasLoading != isLoading) {
      notifyListeners();
    }
  }

  void _updateResults() async {
    final _AdvancedState<Value, ResultValue>? state = _state;
    final String query = textEditingController.text;
    final _AdvancedSession<Value, ResultValue>? session = _session;
    if (_lastHandledSearch == query || session == null || state == null || _resultsFuture != null || !state.isOpen) {
      return;
    }

    final FutureOr<YgSearchResultsLayout<ResultValue>?> result = session.buildResults(query);
    final YgSearchResultsLayout<ResultValue>? oldResult = _results;
    if (result is YgSearchResultsLayout<ResultValue>) {
      if (result != oldResult) {
        _results = result;
        notifyListeners();
      }
    } else if (result is Future<YgSearchResultsLayout<ResultValue>>) {
      _resultsFuture = result;
      _updateLoading();
      _results = await result;
      _resultsFuture = null;
      _updateLoading(forceNotify: oldResult != _results);
    } else if (oldResult != null) {
      _results = null;
      notifyListeners();
    }

    _lastHandledSearch = query;
    _updateResults();
  }

  @override
  void onResultTapped(ResultValue result) async {
    final _AdvancedState<Value, ResultValue>? state = _state;
    final _AdvancedSession<Value, ResultValue>? session = _session;
    if (session == null || state == null) {
      return;
    }

    final FutureOr<YgSearchValueAndText<Value>?> valueAndText = session.getFinalValueAndText(result);
    final Value? oldValue = _value;
    final String? oldText = _valueText;
    if (valueAndText is YgSearchValueAndText<Value>) {
      final bool valueChanged = oldValue != valueAndText.value;
      if (oldText != valueAndText.text || valueChanged) {
        _valueText = valueAndText.text;
        _value = valueAndText.value;
      }
      if (valueChanged) {
        _state?.onChanged();
      }
    } else if (valueAndText is Future<YgSearchValueAndText<Value>>) {
      _valueAndTextFuture = valueAndText;
      _updateLoading();

      final YgSearchValueAndText<Value> result = await valueAndText;
      _value = result.value;
      _valueText = result.text;
      _valueAndTextFuture = null;

      final bool valueChanged = oldValue != _value;
      _updateLoading(forceNotify: oldText != _valueText || valueChanged);
      if (valueChanged) {
        _state?.onChanged();
      }
    } else {
      final bool valueChanged = oldValue != null;
      if (oldText != null || valueChanged) {
        _valueText = null;
        _value = null;
      }
      if (valueChanged) {
        _state?.onChanged();
      }
    }

    close();
  }

  @override
  void endSession({bool force = false}) async {
    _endingSession = true;
    final Future<void>? resultsFuture = _resultsFuture;
    final Future<void>? valueAndTextFuture = _valueAndTextFuture;
    if (!force) {
      if (resultsFuture != null) {
        await resultsFuture;
      }
      if (valueAndTextFuture != null) {
        await valueAndTextFuture;
      }
    }

    final _AdvancedSession<Value, ResultValue>? session = _session;
    if ((!force && !_endingSession) || session == null) {
      // This could happen is startSession was called while we were waiting for
      // results.
      return;
    }

    session.detach();
    session.dispose();
    _session = null;
  }

  @override
  void startSession() {
    final _AdvancedState<Value, ResultValue>? state = _state;
    if (state == null || _session != null) {
      return;
    }

    final YgAdvancedSearchProvider<Value, ResultValue> provider = state.searchProvider;
    final YgAdvancedSearchSession<Value, ResultValue, YgAdvancedSearchProvider<Value, ResultValue>> session =
        provider.createSession();
    session.attach(this, provider);
    session.initSession();
    _endingSession = false;
    _session = session;
  }

  @override
  void detach() {
    endSession(force: true);
    super.detach();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _resultsFuture = null;
    _valueAndTextFuture = null;
    _loading = false;
    detach();
    super.dispose();
  }
}
