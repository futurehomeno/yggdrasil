part of '../yg_search_controller_mixin.dart';

typedef _SimpleSession<Value> = YgSimpleSearchSession<Value, YgSimpleSearchProvider<Value>>;
typedef _SimpleState<Value> = YgSimpleSearchMixin<StatefulWidget, Value>;

class YgSimpleSearchController<Value>
    with
        ChangeNotifier,
        _YgSearchControllerMixin<Value, Value?, Value, YgSearchResult<Value>, YgSearchResultsLayout<Value>,
            YgSimpleSearchMixin<StatefulWidget, Value>> {
  YgSimpleSearchController({Value? initialValue})
      : _textEditingController = TextEditingController(),
        _value = initialValue {
    _textEditingController.addListener(_updateResults);
  }

  _SimpleSession<Value>? _session;
  bool _endingSession = false;
  String _lastHandledSearch = '';
  Future<void>? _resultsFuture;
  Future<void>? _valueTextFuture;

  @override
  bool get loading => _loading;
  bool _loading = false;

  @override
  TextEditingController get textEditingController => _textEditingController;
  final TextEditingController _textEditingController;

  @override
  YgSearchResultsLayout<Value> get results => _results ?? YgSearchResultsLayout<Value>();
  YgSearchResultsLayout<Value>? _results;

  @override
  bool get hasValue => _value != null;

  @override
  String get valueText => _valueText ?? '';
  String? _valueText;

  @override
  Value? get value => _value;
  Value? _value;
  set value(Value? value) {
    if (value == _value) {
      return;
    }
    _value = value;

    if (!attached || value == null) {
      _valueText = null;

      return;
    }

    if (_session == null) {
      startSession();
    }
    _updateValueText();
    if (!isOpen) {
      endSession();
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
    final bool isLoading = _resultsFuture != null || _valueTextFuture != null;
    _loading = isLoading;

    if (forceNotify || wasLoading != isLoading) {
      notifyListeners();
    }
  }

  void _updateResults() async {
    final _SimpleState<Value>? state = _state;
    final String query = textEditingController.text;
    final _SimpleSession<Value>? session = _session;
    if (_lastHandledSearch == query || session == null || state == null || _resultsFuture != null || !state.isOpen) {
      return;
    }

    final FutureOr<YgSearchResultsLayout<Value>?> result = session.buildResults(query);
    final YgSearchResultsLayout<Value>? oldResult = _results;
    if (result is YgSearchResultsLayout<Value>) {
      if (result != oldResult) {
        _results = result;
        notifyListeners();
      }
    } else if (result is Future<YgSearchResultsLayout<Value>>) {
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
  }

  void _updateValueText() async {
    final _SimpleState<Value>? state = _state;
    final _SimpleSession<Value>? session = _session;
    if (session == null || state == null || !state.isOpen) {
      return;
    }

    final Value? value = _value;
    if (value == null) {
      if (_valueText != null) {
        _valueText = null;
        notifyListeners();
      }

      return;
    }

    final FutureOr<String?>? valueText = session.getValueText(value);
    final String? oldText = _valueText;
    if (valueText is String) {
      if (valueText != oldText) {
        _valueText = valueText;
        notifyListeners();
      }
    } else if (valueText is Future<String>) {
      _valueTextFuture = valueText;
      _updateLoading();
      _valueText = await valueText;
      _valueTextFuture = null;
      _updateLoading(forceNotify: oldText != _valueText);
    } else if (oldText != null) {
      _valueText = null;
      notifyListeners();
    }
  }

  @override
  void onResultTapped(Value result) {
    if (result != _value) {
      _value = value;
      notifyListeners();
      _updateValueText();
      _state?.onChanged();
    }

    close();
  }

  @override
  void startSession() {
    final _SimpleState<Value>? state = _state;
    if (state == null || _session != null) {
      return;
    }

    final YgSimpleSearchProvider<Value> provider = state.searchProvider;
    final YgSimpleSearchSession<Value, YgSimpleSearchProvider<Value>> session = provider.createSession();
    session.attach(this, provider);
    session.initSession();
    _endingSession = false;
    _session = session;
  }

  @override
  void endSession({bool force = false}) async {
    _endingSession = true;
    final Future<void>? resultsFuture = _resultsFuture;
    final Future<void>? valueTextFuture = _valueTextFuture;
    if (!force) {
      if (resultsFuture != null) {
        await resultsFuture;
      }
      if (valueTextFuture != null) {
        await valueTextFuture;
      }
    }

    final _SimpleSession<Value>? session = _session;
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
  void attach(YgSimpleSearchMixin<StatefulWidget, Value> state) {
    super.attach(state);
    if (_session == null) {
      startSession();
    }
    _updateValueText();
    if (!isOpen) {
      endSession();
    }
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
    _valueTextFuture = null;
    _loading = false;
    detach();
    super.dispose();
  }
}
