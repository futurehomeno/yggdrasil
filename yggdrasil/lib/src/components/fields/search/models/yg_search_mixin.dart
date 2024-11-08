import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:yggdrasil/src/components/fields/search/controller/yg_search_controller.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

import 'yg_search_result.dart';

/// A mixin for a stateful widget to allow it to function as a search field.
///
/// Used by [YgSearchController].
mixin YgSearchMixin<T, S extends StatefulWidget> on State<S> {
  YgSearchResultsBuilder<T> get resultsBuilder;

  FutureOr<String?> Function(T String)? get resultTextBuilder;

  void open();

  void openMenu();

  void openScreen();

  void close();

  bool get isOpen;
}

abstract interface class YgSearchMixinNew {
  void open();

  void openMenu();

  void openScreen();

  void close();

  bool get isOpen;
}

typedef YgValueSearchResultsBuilder<Value> = FutureOr<List<YgSearchResult<Value>>?> Function(String query);
typedef YgValueSearchResultTextBuilder<Value> = FutureOr<String?> Function(Value value);

mixin YgValueSearchMixin<Value, Widget extends StatefulWidget> on State<Widget> implements YgSearchMixinNew {
  YgValueSearchResultsBuilder<Value> get resultsBuilder;
  YgValueSearchResultTextBuilder<Value> get resultTextBuilder;
}

typedef YgStringSearchResultsBuilder = FutureOr<List<YgSearchResult<String>>?> Function(String query);

mixin YgStringSearchMixin<Widget extends StatefulWidget> on State<Widget> implements YgSearchMixinNew {
  YgStringSearchResultsBuilder get resultsBuilder;
}

typedef YgSearchControllerAny = YgSearchController<Object?, Object?, YgSearchMixinNew>;
mixin YgSearchController<ControllerValue, UserValue, SearchMixin extends YgSearchMixinNew>
    implements Listenable, YgAttachable<SearchMixin>, YgDisposable {
  ControllerValue get value;

  TextEditingController get textEditingController;

  List<YgSearchResult<UserValue>> get results;

  bool get loading;

  void onResultTapped(UserValue result);

  SearchMixin? _state;

  @override
  void attach(SearchMixin state) {
    assert(
      _state == null,
      'Tried to attach YgValueSearchController to a search widget while the'
      ' controller was already attached. Make sure you only use a search'
      ' controller for a single widget at a time.',
    );
    if (_state != null) {
      return;
    }

    _state = state;
  }

  @override
  void detach() {
    _state = null;
  }

  /// Opens the menu specifically.
  ///
  /// Should be called only when the menu specifically should be opened. For most
  /// cases you want to use the [open] method instead to show either a menu or
  /// search screen, depending on the platform the user is on.
  void openMenu() {
    final SearchMixin? state = _state;
    assert(
      state != null,
      'YgSearchController.openMenu was called while the controller was not attached to a search widget!',
    );
    if (state == null) {
      return;
    }

    state.openMenu();
  }

  /// Opens the search screen specifically.
  ///
  /// Should be called only when the search screen specifically should be opened.
  /// For most cases you want to use the [open] method instead to show either a
  /// menu or search screen, depending on the platform the user is on.
  void openScreen() {
    final SearchMixin? state = _state;
    assert(
      state != null,
      'YgSearchController.openScreen was called while the controller was not attached to a search widget!',
    );
    if (state == null) {
      return;
    }

    state.openScreen();
  }

  /// Opens the search widget.
  ///
  /// Shows either a menu or search screen, depending on the platform the user
  /// is on.
  void open() {
    final SearchMixin? state = _state;
    assert(
      state != null,
      'YgSearchController.open was called while the controller was not attached to a search widget!',
    );
    if (state == null) {
      return;
    }
    state.open();
  }

  /// Closes the search widget.
  void close() {
    final SearchMixin? state = _state;
    assert(
      state != null,
      'YgSearchController.close was called while the controller was not attached to a search widget!',
    );
    if (state == null) {
      return;
    }

    state.close();
  }

  /// Whether the search widget is open or closed.
  bool get isOpen {
    final SearchMixin? state = _state;
    if (state == null) {
      return false;
    }

    return state.isOpen;
  }

  bool get attached => _state != null;
}

class YgValueSearchController<Value>
    with ChangeNotifier, YgSearchController<Value?, Value, YgValueSearchMixin<Value, StatefulWidget>> {
  YgValueSearchController({
    String? initialSearch,
    Value? initialValue,
  })  : _textEditingController = TextEditingController(text: initialSearch),
        _value = initialValue,
        _lastHandledSearch = initialSearch ?? '' {
    _textEditingController.addListener(_updateResults);
  }

  final TextEditingController _textEditingController;

  String _lastHandledSearch;

  @override
  Value? get value => _value;
  Value? _value;

  @override
  List<YgSearchResult<Value>> get results => _results ?? const <YgSearchResult<Value>>[];
  List<YgSearchResult<Value>>? _results;

  @override
  bool get loading => _loadingResultText || _loadingResults;
  bool _loadingResults = false;
  final bool _loadingResultText = false;

  void _updateResults({bool force = false}) async {
    final YgValueSearchMixin<Value, StatefulWidget>? state = _state;
    if (state == null || _loadingResults || !state.isOpen) {
      return;
    }

    final String text = textEditingController.text;
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

  @override
  void onResultTapped(Value? result) {
    if (_value != result) {
      _value = result;
      notifyListeners();
    }
  }

  @override
  TextEditingController get textEditingController => _textEditingController;
}

class YgStringSearchController extends TextEditingController
    with YgSearchController<TextEditingValue, String, YgStringSearchMixin<StatefulWidget>> {
  YgStringSearchController({
    String? initialValue,
  })  : _lastHandledSearch = initialValue ?? '',
        super(text: initialValue);

  @override
  TextEditingController get textEditingController => this;
  String _lastHandledSearch;
  bool _loadingResults = false;

  @override
  List<YgSearchResult<String>> get results => _results ?? const <YgSearchResult<String>>[];
  List<YgSearchResult<String>>? _results;

  @override
  void notifyListeners() {
    super.notifyListeners();
  }

  @override
  void onResultTapped(String result) {
    _lastHandledSearch = result;
    text = result;
  }

  @override
  bool get loading => _loadingResults;

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
