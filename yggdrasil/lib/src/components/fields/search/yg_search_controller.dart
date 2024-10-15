import 'package:flutter/widgets.dart';
import 'package:yggdrasil/src/components/fields/search/models/yg_search_result.dart';
import 'package:yggdrasil/src/components/fields/search/widgets/mobile_search_screen.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

typedef YgSearchControllerAny<T> = YgSearchController<T, YgSearchState<YgSearchWidget<T>>>;

class YgSearchController<T, S extends YgSearchState<YgSearchWidget<T>>> extends TextEditingController
    implements YgAttachable<S> {
  YgSearchController({
    super.text,
  }) : _lastHandledValue = text ?? '';

  final ValueNotifier<List<YgSearchResult<T>>?> results = ValueNotifier<List<YgSearchResult<T>>?>(null);

  final LoadingValue _loadingNotifier = LoadingValue();
  ValueNotifier<bool> get loading => _loadingNotifier;

  YgSearchState<YgSearchWidget<T>>? _state;

  String _lastHandledValue;

  @override
  void notifyListeners() {
    _updateResults();
    super.notifyListeners();
  }

  void _updateResults([bool force = false]) async {
    final YgSearchState<YgSearchWidget<T>>? state = _state;
    if (state == null || _loadingNotifier.isLoadingResults) {
      return;
    }

    if (!force && _lastHandledValue == text) {
      return;
    }

    _loadingNotifier.isLoadingResults = true;
    _lastHandledValue = text;
    results.value = await state.widget.resultsBuilder(text);
    _loadingNotifier.isLoadingResults = false;

    // Call this again in case value has changed in the meantime.
    _updateResults();
  }

  void valueSelected(T value) async {
    final YgSearchState<YgSearchWidget<T>>? state = _state;
    assert(
      state != null,
      'YgSearchController.valueSelected was called while the controller was not attached to a search widget!',
    );
    if (state == null || _loadingNotifier.isLoadingSelectedResult) {
      return;
    }

    _loadingNotifier.isLoadingSelectedResult = true;

    final YgSearchWidget<T> widget = state.widget;
    final String? newText = await widget.resultSelected?.call(value);

    _loadingNotifier.isLoadingSelectedResult = false;
    if (newText == null) {
      return;
    }

    text = newText;
    close();
  }

  @override
  void attach(YgSearchState<YgSearchWidget<T>> state) {
    _state = state;

    if (_lastHandledValue.isNotEmpty == true) {
      _updateResults(true);
    }
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
    final YgSearchState<YgSearchWidget<T>>? field = _state;
    assert(
      field != null,
      'YgSearchController.openMenu was called while the controller was not attached to a search widget!',
    );
    if (field == null) {
      return;
    }

    field.openMenu();
  }

  /// Opens the search screen specifically.
  ///
  /// Should be called only when the search screen specifically should be opened.
  /// For most cases you want to use the [open] method instead to show either a
  /// menu or search screen, depending on the platform the user is on.
  void openScreen() {
    final YgSearchState<YgSearchWidget<T>>? field = _state;
    assert(
      field != null,
      'YgSearchController.openScreen was called while the controller was not attached to a search widget!',
    );
    if (field == null) {
      return;
    }

    field.openScreen();
  }

  /// Opens the search widget.
  ///
  /// Shows either a menu or search screen, depending on the platform the user is
  /// on.
  void open() {
    final YgSearchState<YgSearchWidget<T>>? field = _state;
    assert(
      field != null,
      'YgSearchController.open was called while the controller was not attached to a search widget!',
    );
    if (field == null) {
      return;
    }
    field.open();
  }

  /// Closes the search widget.
  void close() {
    final YgSearchState<YgSearchWidget<T>>? field = _state;
    assert(
      field != null,
      'YgSearchController.close was called while the controller was not attached to a search widget!',
    );
    if (field == null) {
      return;
    }

    field.close();
  }

  /// Whether the search widget in open or closed.
  bool get isOpen {
    final YgSearchState<YgSearchWidget<T>>? field = _state;
    if (field == null) {
      return false;
    }

    return field.isOpen;
  }
}

class LoadingValue extends ValueNotifier<bool> {
  LoadingValue() : super(false);

  bool _isLoadingResults = false;
  bool get isLoadingResults => _isLoadingResults;
  set isLoadingResults(bool isLoading) {
    _isLoadingResults = isLoading;
    _update();
  }

  bool _isLoadingSelectedResult = false;
  bool get isLoadingSelectedResult => _isLoadingSelectedResult;
  set isLoadingSelectedResult(bool isLoading) {
    _isLoadingSelectedResult = isLoading;
    _update();
  }

  void _update() {
    value = _isLoadingResults || _isLoadingSelectedResult;
  }
}

abstract interface class YgSearchWidget<T> implements StatefulWidget {
  YgSearchResultsBuilder<T> get resultsBuilder;

  Future<String?> Function(T value)? get resultSelected;
}

abstract interface class YgSearchState<T extends YgSearchWidget<Object?>> implements State<T> {
  void open();

  void openMenu();

  void openScreen();

  void close();

  bool get isOpen;
}
