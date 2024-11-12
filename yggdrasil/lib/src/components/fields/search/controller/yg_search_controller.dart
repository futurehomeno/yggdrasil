import 'package:flutter/widgets.dart';
import 'package:yggdrasil/src/components/fields/search/controller/yg_search_mixin_interface.dart';
import 'package:yggdrasil/src/components/fields/search/models/yg_search_result.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

import 'yg_string_search_mixin.dart';
import 'yg_value_search_mixin.dart';

part 'yg_string_search_controller.dart';
part 'yg_value_search_controller.dart';

typedef YgSearchControllerAny = YgSearchController<Object?, Object?, YgSearchMixinInterface>;
typedef YgSearchControllerSimple<T> = YgSearchController<T, Object?, YgSearchMixinInterface>;

mixin YgSearchController<UserValue, ControllerValue, SearchMixin extends YgSearchMixinInterface>
    implements Listenable, YgAttachable<SearchMixin>, YgDisposable {
  ControllerValue get value;

  TextEditingController get textEditingController;

  List<YgSearchResult<UserValue>> get results;

  bool get loading;

  void onResultTapped(UserValue result);

  void clear();

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

  bool get hasValue;

  bool get attached => _state != null;
}
