part of '../yg_search_controller_mixin.dart';

typedef _AdvancedSession<Value, ResultValue>
    = YgAdvancedSearchSession<Value, ResultValue, YgAdvancedSearchProvider<Value, ResultValue>>;
typedef _AdvancedState<Value, ResultValue> = YgAdvancedSearchStateMixin<Value, ResultValue, StatefulWidget>;

// TODO(Tim): Look in to maybe extending the lifespan of a session to simplify
// caching between closing and opening the search widgets.

/// Controller for advanced search widgets.
///
/// This controller is different from the simple search controller in that the
/// [value] is not equal to the value on a search result, instead after selecting
/// a result, this controller will fetch a final value and text based on the
/// selected result.
///
/// This can be useful if the results are only a preview of the final result,
/// and lack critical information needed for the final value which needs to be
/// fetched from the server separately from the results.
///
/// This controller does not change its value until the user selects a result.
class YgAdvancedSearchController<Value, ResultValue>
    with
        ChangeNotifier,
        _YgSearchControllerMixin<Value, Value?, ResultValue, YgSearchResult<ResultValue>,
            YgSearchResultsLayout<ResultValue>, YgAdvancedSearchStateMixin<Value, ResultValue, StatefulWidget>> {
  YgAdvancedSearchController({
    YgSearchValueAndText<Value>? initialValue,
  })  : _textEditingController = TextEditingController(text: initialValue?.text),
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
  }) =>
      _updateValueInternal(
        text: text,
        value: value,
      );

  @override
  void clear() => _updateValueInternal(
        text: null,
        value: null,
      );

  void _updateValueInternal({
    required Value? value,
    required String? text,
  }) {
    if (text != _valueText || value != _value) {
      _value = value;
      _valueText = text;
      _lastHandledSearch = text ?? '';
      notifyListeners();

      final _AdvancedState<Value, ResultValue>? state = _state;
      if (state != null) {
        state.onChanged();
      }

      if (isOpen) {
        _updateResults();
      }
    }
    if (text == null) {
      // This also resets things related to selection, not just the text.
      _textEditingController.clear();
    } else {
      _textEditingController.text = text;
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

  void _updateResults({
    bool force = false,
  }) async {
    final _AdvancedState<Value, ResultValue>? state = _state;
    final String query = textEditingController.text;
    final _AdvancedSession<Value, ResultValue>? session = _session;
    if ((!force && _lastHandledSearch == query) ||
        session == null ||
        state == null ||
        _resultsFuture != null ||
        !state.isOpen) {
      return;
    }

    final FutureOr<YgSearchResultsLayout<ResultValue>?> result = session.buildResultsLayout(query);
    final YgSearchResultsLayout<ResultValue>? oldResult = _results;
    if (result is YgSearchResultsLayout<ResultValue>) {
      if (result != oldResult) {
        _results = result;
        notifyListeners();
      }
    } else if (result is Future<YgSearchResultsLayout<ResultValue>?>) {
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
        _lastHandledSearch = valueAndText.text;
        _valueText = valueAndText.text;
        _value = valueAndText.value;
        _textEditingController.text = valueAndText.text;
        notifyListeners();
      }
      if (valueChanged) {
        _state?.onChanged();
      }
    } else if (valueAndText is Future<YgSearchValueAndText<Value>?>) {
      _valueAndTextFuture = valueAndText;
      _updateLoading();

      final YgSearchValueAndText<Value>? result = await valueAndText;
      _valueAndTextFuture = null;
      final bool valueChanged = result?.value != oldValue;
      final bool shouldUpdate = valueChanged || result?.text != oldText;
      if (shouldUpdate) {
        _lastHandledSearch = result?.text ?? '';
        _value = result?.value;
        _valueText = result?.text;
        _textEditingController.text = result?.text ?? '';
      }
      _updateLoading(
        forceNotify: shouldUpdate,
      );
      if (valueChanged) {
        _state?.onChanged();
      }
    } else {
      final bool valueChanged = oldValue != null;
      if (oldText != null || valueChanged) {
        _lastHandledSearch = '';
        _valueText = null;
        _value = null;
        _textEditingController.text = '';
        notifyListeners();
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
      // This could happen if startSession was called while we were waiting for
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
    _updateResults(force: true);
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
