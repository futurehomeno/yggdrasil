/// The action that should be performed when a search widget is pressed.
enum YgSearchAction {
  /// Show a menu when the search widget is pressed.
  menu,

  /// Show a full screen search page when the search widget is pressed.
  screen,

  /// Show either a menu or search page depending on the current platform.
  auto,

  /// Do nothing, use the search widget as a button.
  ///
  /// !-- WARNING --
  /// This may be required if you want to manually do something before actually
  /// opening the search widget using the [YgSearchController], but using the
  /// search widget as an actual button to open a custom bottom sheet for
  /// example is not recommended as the widget will not be able to track whether
  /// the search widget is open or not and thus will not be able to update its
  /// styling accordingly.
  none,
}
