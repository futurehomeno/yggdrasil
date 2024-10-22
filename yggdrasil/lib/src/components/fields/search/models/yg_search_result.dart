import 'package:yggdrasil/src/utils/_utils.dart';

/// A result for a [YgSearchWidget].
class YgSearchResult<T> {
  const YgSearchResult({
    required this.title,
    required this.value,
    this.icon,
    this.subtitle,
  });

  /// The value which is passed to [YgSearchWidget.].
  ///
  /// This value is what you will get back from the [YgSearchWidget.onChange]
  /// when this entry is selected.
  final T value;

  /// The title of the entry.
  ///
  /// This will be shown in the search results, and as the value in the field
  /// when the user selects this entry.
  final YgFormattedText title;

  /// The subtitle of the entry.
  ///
  /// !--- WARNING ---
  /// The subtitle is only shown in the search results, and
  /// NOT in the field itself, therefore they should NOT be used as the main
  /// identifier of the entry as the user will not be able to identify the
  /// selected value from looking at the field itself.
  final YgFormattedText? subtitle;

  /// The icon of the entry.
  ///
  /// !--- WARNING ---
  /// The icon is only shown in the search results, and
  /// NOT in the field itself, therefore they should NOT be used as the main
  /// identifier of the entry as the user will not be able to identify the
  /// selected value from looking at the field itself.
  final YgIconData? icon;
}
