import 'package:yggdrasil/src/components/fields/search/interfaces/yg_base_search_provider.dart';
import 'package:yggdrasil/src/components/fields/search/interfaces/yg_base_search_result.dart';
import 'package:yggdrasil/src/components/fields/search/interfaces/yg_base_search_results_layout.dart';

/// Internal interface used by all search widgets.
abstract interface class YgSearchStateMixinInterface<
  Value,
  ResultValue,
  Result extends YgBaseSearchResult,
  ResultsLayout extends YgBaseSearchResultsLayout<Result>
> {
  /// Called by the search controller when the value changes.
  ///
  /// Should be used to call the onChanged callback on the widget it self with
  /// the value of the search controller.
  void onChanged();

  /// Called by the search controller when the widget should be opened.
  ///
  /// Should call [startSession] on the search controller if the search
  /// succeeded in opening, and was not already opened.
  void open();

  /// Called by the search controller when the widget should open the menu.
  ///
  /// Should call [startSession] on the search controller if the search
  /// succeeded in opening, and was not already opened.
  void openMenu();

  /// Called by the search controller when the widget should open the search
  /// screen.
  ///
  /// Should call [startSession] on the search controller if the search
  /// succeeded in opening, and was not already opened.
  void openScreen();

  /// Called by the search controller when the widget should close any search
  /// view.
  ///
  /// Should call [endSession] on the search controller if the search
  /// succeeded in closing, and was not already closed.
  void close();

  /// Should return true if the widget is opened.
  ///
  /// Used in the search controller directly to verify whether results should be
  /// fetched and shown.
  bool get isOpen;

  /// Should return the current search provider.
  ///
  /// This should usually be provided by the user and passed to this getter.
  ///
  /// The search provider gets used by the search controller internally.
  YgBaseSearchProvider<Value, ResultValue, Result, ResultsLayout> get searchProvider;
}
