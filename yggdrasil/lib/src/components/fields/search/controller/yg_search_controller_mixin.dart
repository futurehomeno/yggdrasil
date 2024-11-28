import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:yggdrasil/src/components/fields/search/controller/yg_search_mixin_interface.dart';
import 'package:yggdrasil/src/components/fields/search/models/advanced_search/yg_search_results_layout.dart';
import 'package:yggdrasil/src/components/fields/search/models/advanced_search/yg_search_value_and_text.dart';
import 'package:yggdrasil/src/components/fields/search/models/base/yg_base_search_result.dart';
import 'package:yggdrasil/src/components/fields/search/models/base/yg_base_search_results_layout.dart';
import 'package:yggdrasil/src/components/fields/search/models/string_search/yg_string_search_results_layout.dart';
import 'package:yggdrasil/src/utils/_utils.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'advanced_search/yg_advanced_value_search_mixin.dart';
import 'string_search/yg_string_search_mixin.dart';

part 'advanced_search/yg_advanced_search_controller.dart';
part 'string_search/yg_string_search_controller.dart';

typedef YgSearchControllerAny<Value, ResultValue> = YgSearchControllerMixin<
    Value,
    ResultValue,
    YgBaseSearchResult,
    YgBaseSearchResultsLayout<YgBaseSearchResult>,
    YgSearchMixinInterface<Value, ResultValue, YgBaseSearchResult, YgBaseSearchResultsLayout<YgBaseSearchResult>>>;

mixin YgSearchControllerMixin<
        Value,
        ResultValue,
        Result extends YgBaseSearchResult,
        ResultsLayout extends YgBaseSearchResultsLayout<Result>,
        SearchMixin extends YgSearchMixinInterface<Value, ResultValue, Result, ResultsLayout>> on ChangeNotifier
    implements YgAttachable<SearchMixin>, YgDisposable {
  Value get value;

  String get valueText;

  TextEditingController get textEditingController;

  ResultsLayout get results;

  bool get loading;

  void onResultTapped(ResultValue result);

  void clear();

  SearchMixin? _state;

  bool _initializing = true;

  void endSession({bool force = false});

  void startSession();

  @override
  void notifyListeners() {
    // Don't try and update while we are initializing.
    if (!_initializing) {
      super.notifyListeners();
    }
  }

  String get searchQuery => textEditingController.text;
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

  bool get hasValue;

  bool get attached => _state != null;
}
