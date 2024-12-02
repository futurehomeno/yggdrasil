import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:yggdrasil/src/components/fields/search/controller/yg_search_mixin_interface.dart';
import 'package:yggdrasil/src/components/fields/search/interfaces/yg_base_search_result.dart';
import 'package:yggdrasil/src/components/fields/search/interfaces/yg_base_search_results_layout.dart';
import 'package:yggdrasil/src/components/fields/search/models/advanced_search/yg_search_results_layout.dart';
import 'package:yggdrasil/src/components/fields/search/models/advanced_search/yg_search_value_and_text.dart';
import 'package:yggdrasil/src/components/fields/search/models/shared/yg_search_result.dart';
import 'package:yggdrasil/src/components/fields/search/models/simple_search/_simple_search.dart';
import 'package:yggdrasil/src/components/fields/search/models/string_search/yg_string_search_results_layout.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'advanced_search/yg_advanced_search_mixin.dart';
import 'simple_search/yg_simple_search_mixin.dart';
import 'string_search/yg_string_search_mixin.dart';
import 'yg_search_controller.dart';

part 'advanced_search/yg_advanced_search_controller.dart';
part 'simple_search/yg_simple_search_controller.dart';
part 'string_search/yg_string_search_controller.dart';

mixin _YgSearchControllerMixin<
        Value,
        ControllerValue,
        ResultValue,
        Result extends YgBaseSearchResult,
        ResultsLayout extends YgBaseSearchResultsLayout<Result>,
        SearchMixin extends YgSearchMixinInterface<Value, ResultValue, Result, ResultsLayout>> on ChangeNotifier
    implements YgSearchController<Value, ControllerValue, ResultValue, Result, ResultsLayout, SearchMixin> {
  SearchMixin? _state;

  bool _initializing = true;

  @override
  void notifyListeners() {
    // Don't try and update while we are initializing.
    if (!_initializing) {
      super.notifyListeners();
    }
  }

  /// Internal method called by the search widget when the widget is closed.
  ///
  /// !-- WARNING --
  /// This should not be called manually, if you want to cancel a search use the
  /// [close] method instead.
  void endSession({bool force = false});

  /// Internal method called by the search widget when the widget is opened.
  ///
  /// !-- WARNING --
  /// This should not be called manually, if you want to start a search use the
  /// [open] method instead
  void startSession();

  @override
  String get searchQuery => textEditingController.text;
  @override
  set searchQuery(String newSearchQuery) {
    textEditingController.text = newSearchQuery;
  }

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
    scheduleMicrotask(() => _initializing = false);
  }

  @override
  void detach() {
    endSession(force: true);
    _state = null;
    _initializing = true;
  }

  @override
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

  @override
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

  @override
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

  @override
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

  @override
  bool get isOpen {
    final SearchMixin? state = _state;
    if (state == null) {
      return false;
    }

    return state.isOpen;
  }

  @override
  bool get attached => _state != null;
}
