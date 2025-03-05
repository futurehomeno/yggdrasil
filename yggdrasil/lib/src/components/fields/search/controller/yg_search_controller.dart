import 'package:flutter/widgets.dart';
import 'package:yggdrasil/src/components/fields/search/controller/yg_search_state_mixin_interface.dart';
import 'package:yggdrasil/src/components/fields/search/interfaces/yg_base_search_result.dart';
import 'package:yggdrasil/src/components/fields/search/interfaces/yg_base_search_results_layout.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

/// Generic type to refer to any type of search controller.
typedef YgSearchControllerAny<Value, ResultValue> = YgSearchController<
    Value,
    Object?,
    ResultValue,
    YgBaseSearchResult,
    YgBaseSearchResultsLayout<YgBaseSearchResult>,
    YgSearchStateMixinInterface<Value, ResultValue, YgBaseSearchResult, YgBaseSearchResultsLayout<YgBaseSearchResult>>>;

/// Internal interface shared between all search controllers.
abstract interface class YgSearchController<
        Value,
        ControllerValue,
        ResultValue,
        Result extends YgBaseSearchResult,
        ResultsLayout extends YgBaseSearchResultsLayout<Result>,
        SearchMixin extends YgSearchStateMixinInterface<Value, ResultValue, Result, ResultsLayout>>
    implements YgAttachable<SearchMixin>, YgDisposable {
  /// Internal method called when the user taps on a result.
  ///
  /// This should generally not be used manually, instead use the [value] setter
  /// if supported.
  void onResultTapped(ResultValue result);

  /// Clears the current value, results and search query.
  void clear();

  /// Opens the search menu specifically.
  ///
  /// For most cases you will want to use the [open] method instead as this
  /// method choses the appropriate option based on the widget configuration.
  void openMenu();

  /// Opens the search screen specifically.
  ///
  /// For most cases you will want to use the [open] method instead as this
  /// method choses the appropriate option based on the widget configuration.
  void openScreen();

  /// Opens the search widget.
  void open();

  /// Closes the search widget.
  void close();

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

  /// The value of the controller.
  ///
  /// This value may not be identical to the value which is passed to the
  /// onChange callback on the widget.
  ControllerValue get value;

  /// The text representing the value.
  ///
  /// In some cases this might be identical to the value, in other cases this
  /// might be identical to the title of a search result / item.
  String get valueText;

  /// The current search query.
  ///
  /// This represents the value which the text value the user has entered in the
  /// search widget. It can be, but is not always identical to the [valueText].
  String get searchQuery;
  set searchQuery(String newSearchQuery);

  /// The text editing controller which controls the search query.
  TextEditingController get textEditingController;

  /// The latest results for the search query.
  ///
  /// This might not always be up to date as retrieving search results has the
  /// potential to be async.
  ResultsLayout get results;

  /// Whether any aspect of the search widget is loading.
  ///
  /// This can be true when the results are build async, or if supported, the
  /// final selected value is fetched async.
  bool get loading;

  /// Whether the controller has any value.
  bool get hasValue;

  /// Whether the search widget is open.
  bool get isOpen;

  /// Whether the controller is attached to a search widget.
  bool get attached;
}
