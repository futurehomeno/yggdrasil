import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:yggdrasil/src/components/fields/search/models/yg_search_mixin.dart';
import 'package:yggdrasil/src/components/fields/search/models/yg_search_result.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

import 'loading_value.dart';

/// Builds results for a search widget.
typedef YgSearchResultsBuilder<T> = FutureOr<List<YgSearchResult<T>>?> Function(String searchQuery);

/// Builds a result text for a search widget based on a selected [value].
typedef YgSearchResultTextBuilder<T> = FutureOr<String?> Function(T value)?;

/// Controller for any search widget.
class YgSearchControllerOld<T> extends TextEditingController implements YgAttachable<YgSearchMixin<T, StatefulWidget>> {
  YgSearchControllerOld({
    super.text,
  }) : _lastHandledValue = text ?? '';

  /// The results for the current search query.
  ///
  /// Might not be entirely up to date as the results are loaded async. The
  /// results are provided by the search widget's results builder.
  final ValueNotifier<List<YgSearchResult<T>>?> results = ValueNotifier<List<YgSearchResult<T>>?>(null);

  /// Whether the search widget is loading.
  ///
  /// When either the search widget's results builder or result text builder
  /// are called and returned a future, this will be set to true, until all
  /// futures are resolved.
  ValueNotifier<bool> get loading => _loadingNotifier;
  final LoadingValue _loadingNotifier = LoadingValue();
  YgSearchMixin<T, StatefulWidget>? _state;
  String _lastHandledValue;

  @override
  void notifyListeners() {
    // This gets called when the text value changes.
    _updateResults();
    super.notifyListeners();
  }

  /// Handles a tap on an entry.
  ///
  /// !--- WARNING ---
  /// Used internally in the search widget and should generally not be used
  /// by a user of the search widget or its derivatives.
  ///
  /// This will call the search widget's result text builder and depending on its
  /// result, either set the current [text] to the result, or keep the current
  /// search string.
  void onValueTapped(T value) async {
    final YgSearchMixin<T, StatefulWidget>? state = _state;
    assert(
      state != null,
      'YgSearchController.valueSelected was called while the controller was not attached to a search widget!',
    );
    if (state == null || _loadingNotifier.isLoadingSelectedResult) {
      return;
    }

    _loadingNotifier.isLoadingSelectedResult = true;

    final String? newText = await state.resultTextBuilder?.call(value);

    _loadingNotifier.isLoadingSelectedResult = false;
    if (newText == null) {
      return;
    }

    // We also set the last handled value to prevent this value from triggering
    // a new search result query, which might break things which expect the
    // search to have already ended.
    _lastHandledValue = newText;
    text = newText;
    close();
  }

  /// Method to attach a controller to a search widget.
  ///
  /// !--- Warning ---
  /// Should not be called when the controller is already attached to a
  /// search widget.
  @override
  void attach(YgSearchMixin<T, StatefulWidget> state) {
    assert(
      _state == null || _state == state,
      'Can not attach controller to multiple dropdowns.',
    );
    if (_state != null && _state != state) {
      return;
    }
    _state = state;
    if (_lastHandledValue.isNotEmpty == true) {
      _updateResults(force: true);
    }
  }

  /// Method to detach a controller from its current search widget.
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
    final YgSearchMixin<T, StatefulWidget>? state = _state;
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
    final YgSearchMixin<T, StatefulWidget>? state = _state;
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
    final YgSearchMixin<T, StatefulWidget>? state = _state;
    assert(
      state != null,
      'YgSearchController.open was called while the controller was not attached to a search widget!',
    );
    if (state == null) {
      return;
    }
    state.open();

    // We ignore updates to the value if the search field is closed, so we need
    // to check if anything made changes to the value while the field was closed.
    _updateResults();
  }

  /// Closes the search widget.
  void close() {
    final YgSearchMixin<T, StatefulWidget>? state = _state;
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
    final YgSearchMixin<T, StatefulWidget>? state = _state;
    if (state == null) {
      return false;
    }

    return state.isOpen;
  }

  bool get attached => _state != null;

  void _updateResults({bool force = false}) async {
    final YgSearchMixin<T, StatefulWidget>? state = _state;
    if (state == null || _loadingNotifier.isLoadingResults || !state.isOpen) {
      return;
    }

    if (!force && _lastHandledValue == text) {
      return;
    }

    _loadingNotifier.isLoadingResults = true;
    _lastHandledValue = text;
    results.value = await state.resultsBuilder(text);
    _loadingNotifier.isLoadingResults = false;

    // Call this again in case value has changed in the meantime.
    _updateResults();
  }
}
